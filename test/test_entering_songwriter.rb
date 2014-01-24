require_relative 'helper'

class TestEnteringSongwriter < HipPublisherTest

  def test_valid_songwriter_gets_saved
    command = "./hippublisher addwriter --fname Rick --lname Ferrell --publisher 'Rainy Graham'"
    expected = "A songwriter named Rick Ferrell, with a publisher called Rainy Graham was created."
    assert_command_output expected, command
  end

  def test_invalid_songwriter_doesnt_get_saved
    `./hippublisher addwriter --fname Abby --publisher 'Rainy Graham'`
    result = database.execute("select count(id) from songwriters")
    assert_equal 0, result[0][0]
  end

  def test_error_message_for_missing_name
    command = "./hippublisher addwriter --publisher Rainy Graham --environment test"
    expected = "You must provide the songwriter's fname and lname."
    assert_command_output expected, command
  end

  def test_error_message_for_missing_publisher
    command = "./hippublisher addwriter -fname Rick -lname Ferrell --environment test"
    expected = "You must provide the songwriter's publisher."
    assert_command_output expected, command
  end

  def test_error_message_for_missing_name_and_publisher
    command = "./hippublisher addwriter --environment test"
    expected = "You must provide the songwriter's fname and lname and publisher."
    assert_command_output expected, command
  end

end
