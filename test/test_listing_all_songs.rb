require_relative 'helper'

class TestListingSongs < HipPublisherTest

#   def test_viewAll_returns_relevant_results
#     # create will be new+save
#     song1 = Song.create(title: "Best Is Yet To Come", creationdate: "01/21/2013", haslyrics: "yes", hasworktape: "yes")
#     song2 = Song.create(title: "You You You", creationdate: "10/10/2009", haslyrics: "yes", hasworktape: "no")
#     song3 = Song.create(title: "When The Whiskey Hits Me", creationdate: "12/01/2013", haslyrics: "no", hasworktape: "yes")

#     command = "./hippublisher viewAll"
#     expected = <<EOS.chomp
# All Songs:
# id:#{song1.id} - Best Is Yet To Come cDate:01/21/2013 HasLyrics: yes HasWorktape: yes
# id:#{song2.id} - You You You cDate:10/10/2009 HasLyrics: yes HasWorktape: no
# id:#{song3.id} - When The Whiskey Hits Me cDate:1/01/2013 HasLyrics: no HasWorktape: yes
# EOS
#     assert_command_output expected, command
#   end

  def test_viewSong_returns_relevant_results
    song1 = Song.create(title: "Best Is Yet To Come", creationdate: "01/21/2013", haslyrics: "yes", hasworktape: "yes")
    song2 = Song.create(title: "You You You", creationdate: "10/10/2009", haslyrics: "yes", hasworktape: "no")
    song3 = Song.create(title: "When The Whiskey Hits Me", creationdate: "12/01/2013", haslyrics: "no", hasworktape: "yes")

    shell_output = ""
    IO.popen('./hippublisher viewSong --title "Best Is Yet To Come" --environment test', 'r+') do |pipe|
      pipe.close_write
      shell_output = pipe.read
    end
    assert_in_output shell_output, "id:#{song1.id} - Best Is Yet To Come cDate:01/21/2013 HasLyrics: yes HasWorktape: yes"
  end
end
