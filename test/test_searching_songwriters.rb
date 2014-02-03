# require_relative 'helper'


# class TestSearchingSongwriters < HipPublisherTest
#   def test_search_returns_relevant_results
#     `./hippublisher addWriter --name 'Rick White' --environment test`
#     `./hippublisher addWriter --name 'Rick Ferrell' --environment test`
#     `./hippublisher addWriter --name 'Abby Boykin' --environment test`

#     shell_output = ""
#     IO.popen('./hippublisher search --environment test', 'r+') do |pipe|
#       pipe.puts("Rick")
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     assert_in_output shell_output, "Rick Ferrell", "Rick White"
#     assert_not_in_output shell_output, "Abby"
#   end
# end
