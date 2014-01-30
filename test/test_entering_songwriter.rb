require_relative 'helper'

class TestEnteringSongwriter < HipPublisherTest

  def test_valid_songwriter_gets_saved
    command = "./hippublisher addWriter --name 'Rick Ferrell' --environment test"
    expected = "Songwriter Rick Ferrell was created."
    assert_command_output expected, command
  end

  def test_invalid_songwriter_doesnt_get_saved
    `./hippublisher addWriter --name --environment test`
    result = database.execute("select count(id) from songwriters")
    assert_equal 0, result[0][0]
  end

  def test_error_message_for_missing_name
    command = "./hippublisher addWriter --environment test"
    expected = "You must provide a songwriter's name."
    assert_command_output expected, command
  end

end
