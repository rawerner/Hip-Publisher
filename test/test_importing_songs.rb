require_relative 'helper'
require_relative '../lib/importer'

class TestImportingSongs < HipPublisherTest
  def import_data
    Importer.import("test/sample_songs.csv")
  end

  def test_the_correct_number_of_songs_are_imported
    import_data
    assert_equal 5, Song.all.count
  end

  def test_songs_are_imported_fully
    skip
    import_data
    expected = [
      "As Far As You Wanta Go, 8/29/12, yes, yes ,'Rick Ferrell, Wade Kirby','Rainy Graham, Big Tractor'",
      "Beautiful Girl, 2/3/12, yes, yes, 'Rick Ferrell, Natalie Murphy','Rainy Graham, Natalie Murphy Publishing'",
      "By My Side, 10/25/12, yes, yes, 'Rick Ferrell, Marti Lynn Dodsen','Rainy Graham, Shapiro-Bernstein Music Publishing'",
      "Camoflage Girls, 7/13/12,yes,yes,'RickFerrell, Wade Kirby','Rainy Graham, Big Tractor'",
      "Country Boy, 8/30/12, yes, yes, 'Rick Ferrell, Wade Kirby, Melanie Morgan', 'Rainy Graham, Big Tractor, Busy Music'"
    ]
    actual = Songs.all.map do |song|
      "#{song.title}, #{song.creationdate}, #{song.haslyrics}, #{song.hasworktape}"
    end
    assert_equal expected, actual
  end

  def test_extra_songwriters_arent_created
    import_data
    assert_equal 5, Songwriter.all.count
  end

  def test_songwriters_are_created_as_needed
    Songwriter.find_or_create("Rick Ferrell")
    Songwriter.find_or_create("Natalie Murphy")
    import_data
    assert_equal 5, Songwriter.all.count, "The songwriters were: #{Songwriter.all.map(&:name)}"
  end

  def test_data_isnt_duplicated
    import_data
    expected = ["Marti Lynn Dodsen", "Melanie Morgan", "Natalie Murphy", "Rick Ferrell", "Wade Kirby"]
    assert_equal expected, Songwriter.all.map(&:name)
    # ^equivalent:
    # category_names = Songwriter.all.map{ |category| category.name }
    # assert_equal expected, category_names
  end
end
