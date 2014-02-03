#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/environment'
require 'rake/testtask'
Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

desc 'import data from the given file'
task :import_data do
  Environment.environment = "production"
  require_relative 'lib/importer'
  Importer.import("data/songs.csv")
end

desc 'create the production database setup'
task :bootstrap_database do
  Environment.environment = "production"
  database = Environment.database_connection
  create_tables(database)
end

desc 'prepare the test database'
task :test_prepare do
  require 'sqlite3'
  File.delete("db/hippublisher_test.sqlite3")
  Environment.environment = "test"
  database = Environment.database_connection
  create_tables(database)
end

def create_tables(database_connection)
  database_connection.execute("CREATE TABLE songs (id INTEGER PRIMARY KEY AUTOINCREMENT, title varchar(100), creationdate varchar(10), haslyrics varchar(3), hasworktape varchar(3))")
  database_connection.execute("CREATE TABLE songsongwriters (song_id INTEGER FORIEGN KEY, songwriter_id INTEGER FORIEGN KEY)")
  database_connection.execute("CREATE TABLE songwriters (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(80))")
  database_connection.execute("CREATE TABLE songpublishers (song_id INTEGER FORIEGN KEY, publisher_id INTEGER FORIEGN KEY)")
  database_connection.execute("CREATE TABLE publishers (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(80))")
end
