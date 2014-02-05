class Songwriter
  attr_accessor :name
  attr_reader :id

  def self.default
    @@default ||= Songwriter.find_or_create("Unknown")
  end

  def initialize(name)
    self.name = name
  end

  def name=(name)
    @name = name.strip
  end

  def saveSongwriter
    database = Environment.database_connection
    if id
      database.execute("update songwriters set name = '#{name}' where id = #{id}")
    else
      database.execute("insert into songwriters(name) values('#{name}')")
      @id = database.last_insert_row_id
    end
  end

  def self.all
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songwriters order by name ASC")
    results.map do |row_hash|
      songwriter = Songwriter.new(row_hash["name"])
      songwriter.send("id=", row_hash["id"])
      songwriter
    end
  end

    def self.find id
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from songwriters where id = #{id}")[0]
    if results
      songwriter = Songwriter.new(name: results["name"])
      songwriter.send("id=", results["id"])
      songwriter
    else
      nil
    end
  end

  def self.find_or_create name
    database = Environment.database_connection
    database.results_as_hash = true
    songwriter = Songwriter.new(name)
    results = database.execute("select * from songwriters where name = '#{songwriter.name}'")

    if results.empty?
      database.execute("insert into songwriters(name) values('#{songwriter.name}')")
      songwriter.send("id=", database.last_insert_row_id)
    else
      row_hash = results[0]
      songwriter.send("id=", row_hash["id"])
    end
    songwriter
  end

  # def self.delete id
  #   database = Environment.database_connection
  #   database.execute("delete from songwriters where songwriters.id=#{id}")
  # end

  def ==(other)
    other.is_a?(Songwriter) && self.to_s == other.to_s
  end

  def to_s
    "Songwriter Id: #{id} Name: #{name}"
  end

  protected

  def id=(id)
    @id = id
  end
end
