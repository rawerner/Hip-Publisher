require 'optparse'
require 'optparse/time'

class ArgumentParser
  def self.parse
    options = {environment: "production"}
    OptionParser.new do |opts|
      opts.banner = "Usage: hippublisher [command] [options]"

      #song title option
      opts.on("--title [TITLE]", "The title of a song") do |title|
        options[:title] = title
      end
      #song creation date option
      opts.on("--date [DATE]", "The creation date of a song") do |date|
        options[:creationdate] = date
      end
      #song has lyrics option
      opts.on("--lyrics [LYRICS]", "The lyrics of a song") do |lyrics|
        options[:haslyrics] = lyrics
      end
      #song has worktape option
       opts.on("--worktape [WORKTAPE]", "The lyrics of a song") do |worktape|
        options[:hasworktape] = worktape
      end

      #ID for either song, songwriter or publisher
       opts.on("--id [ID]", "The id of the object we are editing") do |id|
        options[:id] = id
      end
      #environment option, either test or production
      opts.on("--environment [ENV]", "The environment") do |env|
        options[:environment] = env
      end

      #songwriter name option
      opts.on("--name [Name]", "The name of a songwriter") do |name|
        options[:name] = name
      end

    end.parse!
      # options[:title] ||= ARGV[1]
      options[:command] = ARGV[0]
      options
  end


  def self.validateSong options
    errors = []
    if options[:title].nil? or options[:title].empty?
      errors << "You must provide a song's title.\n"
    end
    errors
  end

  def self.validateSongwriter options
    errors = []
    if options[:name].nil? or options[:name].empty?
      errors << "You must provide a songwriter's name.\n"
    end
    errors
  end

end