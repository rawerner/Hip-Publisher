# require_relative 'helper'
# require_relative '../models/songwriter'

# class TestSongwriter < HipPublisherTest
#   def test_to_s_prints_details
#     songwriter = Songwriter.new(name: "Rick Ferrell")
#     expected = "Rick Ferrell, id: #{songwriter.id}"
#     assert_equal expected, songwriter.to_s
#   end

#   def test_update_doesnt_insert_new_row
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     rick_before = database.execute("select count(id) from songwriters")[0][0]
#     songwriter.update(name: "Rick Ferrell!")
#     rick_after = database.execute("select count(id) from songwriters")[0][0]
#     assert_equal rick_before, rick_after
#   end

#   def test_update_saves_to_the_database
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     id = songwriter.id
#     songwriter.update(name: "Rick Ferrell!")
#     updated_songwriter = Songwriter.find(id)
#     expected = ["Rick Ferrell!"]
#     actual = [ updated_songwriter.name]
#     assert_equal expected, actual
#   end

#   def test_update_is_reflected_in_existing_instance
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     songwriter.update(name: "Rick Ferrell!")
#     expected = ["Rick Ferrell!"]
#     actual = [ songwriter.name]
#     assert_equal expected, actual
#   end

#   def test_saved_songwriters_are_saved
#     songwriter = Songwriter.new(name: "Rick Ferrell")
#     rick_before = database.execute("select count(id) from songwriters")[0][0]
#     songwriter.save
#     rick_after = database.execute("select count(id) from songwriters")[0][0]
#     assert_equal rick_before + 1, rick_after
#   end

#   def test_save_creates_an_id
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     refute_nil songwriter.id, "Songwriter id shouldn't be nil"
#   end

#   def test_find_returns_nil_if_unfindable
#     assert_nil Songwriter.find(12342)
#   end

#   def test_find_returns_the_row_as_songwriter_object
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     found = Songwriter.find(songwriter.id)

#     assert_equal songwriter.name, found.name
#     assert_equal songwriter.id, found.id
#   end

#   def test_search_returns_songwriter_objects
#     Songwriter.create(name: "Rick Ferrell")
#     Songwriter.create(name: "Rick Smith")
#     Songwriter.create(name: "Abby Boykin")
#     results = Songwriter.search("Rick")
#     assert results.all?{ |result| result.is_a? Songwriter }, "Not all results were Songwriters"
#   end

#   def test_search_returns_appropriate_results
#     songwriter1 = Songwriter.create(name: "Rick Ferrell")
#     songwriter2 = Songwriter.create(name: "Rick Smith")
#     songwriter3 = Songwriter.create(name: "Abby Boykin")

#     expected = [songwriter1, songwriter2]
#     actual = Songwriter.search("Rick")

#     assert_equal expected, actual
#   end

#   def test_search_returns_empty_array_if_no_results
#     Songwriter.create(name: "Rick Ferrell")
#     Songwriter.create(name: "Rick Smith")
#     Songwriter.create(name: "Abby Boykin")
#     results = Songwriter.search("John")
#     assert_equal [], results
#   end

#   def test_all_returns_all_songwriters_in_alphabetical_order
#     Songwriter.create(name: "Rick Ferrell")
#     Songwriter.create(name: "Abby Boykin")
#     results = Songwriter.all
#     expected = ["Abby Boykin", "Rick Ferrell"]
#     actual = results.map{ |songwriter| songwriter.name }

#     assert_equal expected, actual
#   end

#   def test_all_returns_empty_array_if_no_songwriters
#     results = Songwriter.all
#     assert_equal [], results
#   end

#   def test_equality_on_same_object
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     assert songwriter == songwriter
#   end

#   def test_equality_with_different_class
#     songwriter = Songwriter.create(name: "Rick Ferrell")
#     refute songwriter == "Songwriter"
#   end

#   def test_equality_with_different_songwriter
#     songwriter1 = Songwriter.create(name: "Rick Ferrell")
#     songwriter2 = Songwriter.create(name: "Abby Boykin")
#     refute songwriter1 == songwriter2
#   end

#   def test_equality_with_same_songwriter_different_object_id
#     songwriter1 = Songwriter.create(name: "Rick Ferrell")
#     songwriter2 = Songwriter.find(songwriter1.id)
#     assert songwriter1 == songwriter2
#   end
# end
