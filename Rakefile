#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/environment'
require 'rake/testtask'
Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

desc "Production Database"
task :bootstrap_database do
  require 'sqlite3'
  database = Environment.database_connection("production")
  create_tables(database)
end

desc "Test Database"
task :test_prepare do
  require 'sqlite3'
  File.delete("db/hippublisher_test.sqlite3")
  database = Environment.database_connection("test")
  create_tables(database)
end

def create_tables(database_connection)
  database_connection.execute("CREATE TABLE songwriters (id INTEGER PRIMARY KEY AUTOINCREMENT, fname varchar(50), lname varchar(50), publisher varchar(50))")
end
