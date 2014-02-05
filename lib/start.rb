module Start

  def startmessage

      title = <<EOS
            __  ___       ____        __    ___      __
           / / / (_)___  / __ \__  __/ /_  / (_)____/ /_  ___  _____
          / /_/ / / __ \/ /_/ / / / / __ \/ / / ___/ __ \/ _ \/ ___/
         / __  / / /_/ / ____/ /_/ / /_/ / / (__  ) / / /  __/ /
        /_/ /_/_/ .___/_/    \__,_/_.___/_/_/____/_/ /_/\___/_/
               /_/

          --Keeping better track of what your songwriters submit--
                         (c)2014 Rachel Werner


    Please use the following commands to manage your catalog

    *Add new song |----> addSong --title 'Rainy Day' --date '12-13-2013' --haslyrics 'yes' --hasworktape 'no'
    *Add new writer |---> addWriter --name 'Abby Boykin'
    *View songs |----> viewAll
    *View songs by writer |----> viewSongsBy --name 'Abby Graham'"
    *View missing items by writer |----> missing --name 'Abby Graham'"
    *Edit Song |----> editSong --title 'Rainy Day' --date '12-20-2013' --haslyrics 'yes' --hasworktape 'yes'"
    *delete Song |----> deleteSong --title 'Rainy Day' --date '12-20-2013' --haslyrics 'yes' --hasworktape 'yes'"



EOS

    puts CLEAR
    puts title
  #   puts "Please use the following commands to manage your catalog\n"
  #   puts "*Add new song ----> addSong --title 'Rainy Day' --date '12-13-2013' --haslyrics 'yes' --hasworktape 'no'"
  #   puts "*Add new writer -----> addWriter --name 'Abby Boykin'"
  #   puts "*View songs -----> viewAll"
  #   puts "*View songs by writer ----> viewSongsBy --name 'Abby Graham'"
  #   puts "*View missing items by writer ----> missing --name 'Abby Graham'"
  #   puts "*Edit a Song ----> editSong --title 'Rainy Day' --date '12-20-2013' --haslyrics 'yes' --hasworktape 'yes'"
  #   puts "*delete a Song ----> deleteSong --title 'Rainy Day' --date '12-20-2013' --haslyrics 'yes' --hasworktape 'yes'"

  end

end