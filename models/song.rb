class Song
  attr_accessor :title, :creationdate, :haslyrics, :hasworktape, :songwriters, :publishers
  attr_reader :id

  def initialize attributes = {}
    update_attributes(attributes)
  end

  def self.create(attributes = {})
    song = Song.new(attributes)
    song.save
    song
  end

  def update attributes = {}
    update_attributes(attributes)
    save
  end

  def save
    database = Environment.database_connection
    if id
      database.execute("update songs set title = '#{title}', creationdate = '#{creationdate}', haslyrics = '#{hasworktape}' where id = #{id}")
    else
      database.execute("insert into songs(title, creationdate, haslyrics, hasworktape) values('#{title}', '#{creationdate}', '#{haslyrics}', '#{hasworktape}')")
      @id = database.last_insert_row_id
    end
  end

  def self.find id
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songs where id = #{id}")[0]
    if results
      song = Song.new(title: results["title"], creationdate: results["creationdate"], haslyrics: results["haslyrics"], hasworktape: results["hasworktape"])
      song.send("id=", results["id"])
      song
    else
      nil
    end
  end

  def self.search(songname = nil)
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songs where title = '#{songname}' ")
    results.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end

  def self.searchSong(songname = nil)
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songs where title = '#{songname}' ")
    results.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end

  def self.all
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songs order by id ASC")
    results.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end

  def self.delete id
    database = Environment.database_connection
    database.execute("delete from songs where songs.id=#{id}")
  end

   def ==(other)
    other.is_a?(Song) && self.to_s == other.to_s
  end

  def to_s
    "id:#{id} - #{title} cDate:#{creationdate} HasLyrics: #{haslyrics} HasWorktape: #{hasworktape}"
  end

  def self.writtenby id
    database = Environment.database_connection
    database.results_as_hash = true
    nolyrics = database.execute("SELECT title, creationdate, haslyrics, hasworktape FROM songs LEFT JOIN  songsongwriters on songsongwriters.song_id = songs.id WHERE songsongwriters.songwriter_id = #{id}")
    nolyrics.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end

  def self.missingdate(id = nil)
    database = Environment.database_connection
    database.results_as_hash = true
    noCdate = database.execute("SELECT title, creationdate, haslyrics, hasworktape FROM songs LEFT JOIN  songsongwriters on songsongwriters.song_id = songs.id WHERE songsongwriters.songwriter_id = #{id} and creationdate= ''")
    noCdate.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end

  def self.missinglyrics(id = nil)
    database = Environment.database_connection
    database.results_as_hash = true
    nolyrics = database.execute("SELECT title, creationdate, haslyrics, hasworktape FROM songs LEFT JOIN  songsongwriters on songsongwriters.song_id = songs.id WHERE songsongwriters.songwriter_id = #{id} and haslyrics = 'no'")
    nolyrics.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end

  end

  def self.missingworktape(id = nil)
    database = Environment.database_connection
    database.results_as_hash = true
    noworktape = database.execute("SELECT title, creationdate, haslyrics, hasworktape FROM songs LEFT JOIN  songsongwriters on songsongwriters.song_id = songs.id WHERE songsongwriters.songwriter_id = #{id} and hasworktape = 'no'")
    noworktape.map do |row_hash|
      song = Song.new(
                      title: row_hash["title"],
                      creationdate: row_hash["creationdate"],
                      haslyrics: row_hash["haslyrics"],
                      hasworktape: row_hash["hasworktape"])
      song.send("id=", row_hash["id"])
      song
    end
  end


  protected

    def id=(id)
      @id = id
    end

    def update_attributes(attributes)
      [:title, :creationdate, :haslyrics, :hasworktape, :songwriters, :publishers].each do |attr|
        if attributes[attr]
          self.send("#{attr}=", attributes[attr])
        end
      end
    end
end


# SELECT * FROM songwriters
#   LEFT JOIN  songsongwriters on songsongwriters.songwriters_id = songwriters.id
#   WHERE songsongwriters.songs_id = 2

#   SELECT * FROM songs
#   LEFT JOIN  songsongwriters on songsongwriters.song_id = song.id
#   WHERE songsongwriter.songwriter_id = 2