require_relative 'helper'

class TestEditingSong < HipPublisherTest

  def test_updating_a_song_that_exists
    song = Song.new(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
    song.save
    id = song.id
    command = "./hippublisher editSong --id #{id} --title 'Best Is Yet To Come Now'"
    expected = "Song #{id} is now titled Best Is Yet To Come Now"
    # What about the db?
    assert_command_output expected, command
  end

  def test_attempting_to_update_a_nonexistant_song
    command = "./hippublisher editSong --id 2001 --title 'Best Is Yet To Come!'"
    expected = "Song 2001 couldn't be updated."
    assert_command_output expected, command
  end

  def test_attempting_to_update_with_no_changes
    song = Song.new(title: "Best Is Yet To Come")
    song.save
    id = song.id
    command = "./hippublisher editSong --id #{id} --title 'Best Is Yet To Come'"
    expected = "Song #{id} is now titled Best Is Yet To Come"
    assert_command_output expected, command
  end

   def test_attempting_to_update_with_bad_data
    skip
      song = Song.new(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
      song.save
      id = song.id
      command = "./hippublisher editSong --id #{id} --title 'Best Is Yet To Come!' --date 10 --lyrics 'yes' --worktape 'yes'"
      expected = "Song #{id} couldn't be updated."
      assert_command_output expected, command
    end

    def test_attempting_to_update_partial_data
      song = Song.new(title: "Best Is Yet To Come", creationdate: "01-21-2013", haslyrics: "yes", hasworktape: "yes")
      song.save
      id = song.id #<--- First thing we have to implement
      command = "./hippublisher editSong --id #{id} --title 'Best Is Yet To Come!'"
      expected = "Song #{id} is now titled Best Is Yet To Come!"
      assert_command_output expected, command
    end
end