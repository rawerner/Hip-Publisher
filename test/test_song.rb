require_relative 'helper'
require_relative '../models/song'

class TestSong < HipPublisherTest

  def test_to_s_prints_details
    song = Song.new(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    expected = "id:#{song.id} - Best Is Yet To Come cDate:01-21-2013 HasLyrics: yes HasWorktape: yes"
    assert_equal expected, song.to_s
  end

  def test_update_doesnt_insert_new_row
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    before = database.execute("select count(id) from songs")[0][0]
    song.update(title: "Best Is Yet To Come!")
    after = database.execute("select count(id) from songs")[0][0]
    assert_equal before, after
  end

  def test_update_saves_to_the_database
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    id = song.id
    song.update(title: "Best Is Yet To Come!")
    updated_song = Song.find(id)
    expected = ["Best Is Yet To Come!"]
    actual = [updated_song.title]
    assert_equal expected, actual
  end

  def test_update_is_reflected_in_existing_instance
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    song.update(title: "Best Is Yet To Come To Me", creationdate: "01-21-2012", haslyrics: "no", hasworktape: "yes")
    expected = ["Best Is Yet To Come To Me", "01-21-2012", "no", "yes"]
    actual = [song.title, song.creationdate, song.haslyrics, song.hasworktape]
    assert_equal expected, actual
  end

  def test_saved_songs_are_saved
    song = Song.new(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    before = database.execute("select count(id) from songs")[0][0]
    song.save
    after = database.execute("select count(id) from songs")[0][0]
    assert_equal before + 1, after
  end

  def test_save_creates_an_id
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    refute_nil song.id, "Song id shouldn't be nil"
  end

  def test_find_returns_nil_if_unfindable
    assert_nil Song.find(12342)
  end

  def test_find_returns_the_row_as_song_object
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    found = Song.find(song.id)

    assert_equal song.title, found.title
    assert_equal song.id, found.id
  end

  def test_search_returns_song_objects
    Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    Song.create(title: "You You You", creationdate: "10-10-2009", haslyrics: "yes", hasworktape: "no")
    Song.create(title: "When The Whiskey Hits Me", creationdate: "12-01-2013", haslyrics: "no", hasworktape: "yes")
    results = Song.search("Best")
    assert results.all?{ |result| result.is_a? Song }, "Not all results were Songs"
  end

  def test_search_returns_appropriate_results
    song1 = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    song2 = Song.create(title: "You You You", creationdate: "10-10-2009", haslyrics: "yes", hasworktape: "no")
    song3 = Song.create(title: "You Make Me Happy", creationdate: "12-01-2013", haslyrics: "no", hasworktape: "yes")

    expected = [song3, song2]
    actual = Song.search("You")

    assert_equal expected, actual
  end

  def test_search_returns_empty_array_if_no_results
    Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    Song.create(title: "You You You", creationdate: "10-10-2009", haslyrics: "yes", hasworktape: "no")
    Song.create(title: "When The Whiskey Hits Me", creationdate: "12-01-2013", haslyrics: "no", hasworktape: "yes")
    results = Song.search("Go")
    assert_equal [], results
  end

  def test_all_returns_all_songs_in_alphabetical_order
    Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    Song.create(title: "You You You", creationdate: "10-10-2009", haslyrics: "yes", hasworktape: "no")
    results = Song.all
    expected = ["Best Is Yet To Come", "You You You"]
    actual = results.map{ |song| song.title }

    assert_equal expected, actual
  end

  def test_all_returns_empty_array_if_no_songs
    results = Song.all
    assert_equal [], results
  end

  def test_equality_on_same_object
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    assert song == song
  end

  def test_equality_with_different_class
    song = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    refute song == "Song"
  end

  def test_equality_with_different_song
    song1 = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    song2 = Song.create(title: "You You You", creationdate: "10-10-2009", haslyrics: "yes", hasworktape: "no", hasdemo: "yes")
    refute song1 == song2
  end

  def test_equality_with_same_song_different_object_id
    song1 = Song.create(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    song2 = Song.find(song1.id)
    assert song1 == song2
  end
end
