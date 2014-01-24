require_relative 'helper'
require 'sqlite3'

class TestSearchingSongwriters < HipPublisherTest
  # def test_search_returns_relevant_results
  #   `./hippublisher search --fname Rick --lname Ferrell --publisher 'Rainy Graham' --environment test`
  #   # `./hippublisher search --fname Rick --lname White --publisher 'Do Write Music' --environment test`
  #   # `./hippublisher search --fname Abby --lname Boykin --publisher 'Rainy Graham' --environment test`
  #   shell_output = ""
  #   IO.popen('./hippublisher search', '--environment test', 'r+') do |pipe|
  #     pipe.puts("Rick")
  #     pipe.close_write
  #     shell_output = pipe.read
  #   end
  #   assert_in_output shell_output, "Rick Ferrell", "Rick White"
  #   assert_not_in_output shell_output, "Abby"
  # end
end