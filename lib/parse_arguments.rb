require 'optparse'

class ParseArguments

  def self.parse
    options = {environment: "production"}

    OptionParser.new do |opts|
      opts.banner = "Usage: hippublisher [command] [options]"

      opts.on("--fname [FNAME]", "The first name") do |name|
        options[:fname] = name
      end

      opts.on("--lname [LNAME]", "The last name") do |name|
        options[:lname] = name
      end

      opts.on("--publisher [PUBLISHER]", "The publisher") do |publisher|
        options[:publisher] = publisher
      end

      opts.on("--environment [env]", "The environment") do |env|
        options[:environment] = env
      end

    end.parse!
    options
  end


  def self.validate options
    errors = []
    missing_things = []
    missing_things << "fname" unless options[:fname]
    missing_things << "lname" unless options[:lname]
    missing_things << "publisher" unless options[:publisher]
    unless missing_things.empty?
      errors << "You must provide the songwriter's #{missing_things.join(" and ")}.\n"
    end
    errors
  end

end