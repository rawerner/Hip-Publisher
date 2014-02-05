require 'csv'

class Importer
  def self.import(from_filename)
    CSV.foreach(from_filename, headers: true) do |row_hash|
      import_songs(row_hash)
    end
  end

  def self.import_songs(row_hash)

    songwriters = row_hash["songwriters"].split(", ")
    publishers = row_hash["publishers"].split(", ")
    songwriters.map! do |writer|
      songwriter = Songwriter.find_or_create(writer)
      songwriter
    end
    publishers.map! do |pub|
      publisher = Publisher.find_or_create(pub)
      publisher
    end

    song = Song.create(
      title: row_hash["title"],
      creationdate: row_hash["creationDate"],
      haslyrics: row_hash["hasLyrics"],
      hasworktape: row_hash["hasWorktape"],
      songwriters: songwriters,
      publishers: publishers)

    database = Environment.database_connection
    songwriters.each do |writer|
      database.execute("insert into songsongwriters(song_id, songwriter_id) values(#{song.id}, #{writer.id})")
    end

    publishers.each do |pub|
      database.execute("insert into songpublishers(song_id, publisher_id) values(#{song.id}, #{pub.id})")
    end
  end
end