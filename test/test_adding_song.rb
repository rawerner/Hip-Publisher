require_relative 'helper'

class TestAddingSong < HipPublisherTest

  def test_valid_song_gets_saved
    command = "./hippublisher addSong --title 'Best Is Yet To Come' --date '01-21-2013' --lyrics 'yes' --worktape 'yes' --environment test"
    expected = "The song 'Best Is Yet To Come' was added to the catalog"
    assert_command_output expected, command
  end

  def test_invalid_songwriter_doesnt_get_saved
    `./hippublisher addSong --title --environment test`
    result = database.execute("select count(id) from songs")
    assert_equal 0, result[0][0]
  end

  def test_error_message_for_missing_title
    command = "./hippublisher addSong --environment test"
    expected = "You must provide a song's title."
    assert_command_output expected, command
  end

end