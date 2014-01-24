require_relative 'helper'

class TestEnteringSong < HipPublisherTest

  # def test_valid_song_gets_saved
  #   command = "./hippublisher addsong --title 'Glass Heart' --cdate '2013-10-01' --publisher 'Rainy Graham'"
  #   expected = "A songwriter named Rick Ferrell, with a publisher called Rainy Graham was created."
  #   assert_command_output expected, command
  # end

  # def test_invalid_song_doesnt_get_saved
  #   `./hippublisher addsong --title 'Glass Heart' --cdate '2013-10-01'`
  #   result = database.execute("select count(id) from songs")
  #   assert_equal 0, result[0][0]
  # end

  # def test_error_message_for_missing_title
  #   command = "./hippublisher addsong --publisher Rainy Graham --environment test"
  #   expected = "You must provide the songwriter's fname and lname."
  #   assert_command_output expected, command
  # end

  # def test_error_message_for_missing_creation_date
  #   command = "./hippublisher addsong -fname Rick -lname Ferrell --environment test"
  #   expected = "You must provide the songwriter's publisher."
  #   assert_command_output expected, command
  # end

  # def test_error_message_for_missing_title_and_creation_date
  #   command = "./hippublisher addsong --environment test"
  #   expected = "You must provide the songwriter's fname and lname and publisher."
  #   assert_command_output expected, command
  # end

end
