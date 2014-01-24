require "sqlite3"

class Environment
  def self.database_connection(environment = "production")
    @connection ||= SQLite3::Database.new("db/hippublisher_#{environment}.sqlite3")
  end
end
