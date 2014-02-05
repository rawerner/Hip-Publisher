class Publisher
  attr_accessor :name
  attr_reader :id

  def self.default
    @@default ||= Publisher.find_or_create("Unknown")
  end

  def initialize(name)
    self.name = name
  end

  def name=(name)
    @name = name.strip
  end


  def self.all
    database = Environment.database_connection
    database.results_as_hash = true
    results = database.execute("select * from publishers order by name ASC")
    results.map do |row_hash|
      publisher = Publisher.new(row_hash["name"])
      publisher.send("id=", row_hash["id"])
      publisher
    end
  end

  def self.find_or_create name
    database = Environment.database_connection
    database.results_as_hash = true
    publisher = Publisher.new(name)
    results = database.execute("select * from publishers where name = '#{publisher.name}'")

    if results.empty?
      database.execute("insert into publishers(name) values('#{publisher.name}')")
      publisher.send("id=", database.last_insert_row_id)
    else
      row_hash = results[0]
      publisher.send("id=", row_hash["id"])
    end
    publisher
  end

  protected

  def id=(id)
    @id = id
  end
end
