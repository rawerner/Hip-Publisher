# require_relative 'helper'

# class TestListingSongwriters < HipPublisherTest
#   def test_list_returns_relevant_results
#     # create will be new+save
#     rick_ferrell = Songwriter.create(name: "Rick Ferrell")
#     rick_smith = Songwriter.create(name: "Rick Smith")
#     abby_boykin = Songwriter.create(name: "Abby Boykin")

#     command = "./hippublisher list"
#     expected = <<EOS.chomp
# All Songwriters:
# Abby Boykin, id: #{abby_boykin.id}
# Rick Ferrell, id: #{rick_ferrell.id}
# Rick Smith, id: #{rick_smith.id}
# EOS
#     assert_command_output expected, command
#   end
# end
