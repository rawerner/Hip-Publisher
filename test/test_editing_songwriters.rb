# require_relative 'helper'

# class TestEditingSongwriter < HipPublisherTest

#   def test_updating_a_songwriter_that_exists
#     songwriter = Songwriter.new(name: "Rick Ferrell")
#     songwriter.save
#     id = songwriter.id
#     command = "./hippublisher edit --id #{id} --name 'Rick Ferrell!'"
#     expected = "Songwriter #{id} is now named Rick Ferrell!"
#     # What about the db?
#     assert_command_output expected, command
#   end

#   def test_attempting_to_update_a_nonexistant_songwriter
#     command = "./hippublisher edit --id 2001 --name 'Rick Ferrell!'"
#     expected = "Songwriter 2001 couldn't be found."
#     assert_command_output expected, command
#   end

#   def test_attempting_to_update_with_no_changes
#     songwriter = Songwriter.new(name: "Rick Ferrell")
#     songwriter.save
#     id = songwriter.id
#     command = "./hippublisher edit --id #{id} --name 'Rick Ferrell'"
#     expected = "Songwriter #{id} is now named Rick Ferrell"
#     assert_command_output expected, command
#   end

# end