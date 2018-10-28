require 'ext/string'

module Commands
  class InvalidCommandError < StandardError
  end

  class Base
    def initialize(line)
      @line = line
    end

    def call
      validate
    end

    def validate(arg_count:)
      raise InvalidCommandError, 'Invalid number of arguments' unless arguments.length == arg_count
    end

    def arguments
      @line.split(' ').drop(1)
    end

    def validate_integers *coords
        coords.each {|x| raise InvalidCommandError, 'Coordinates must be integers' unless x.is_i? }
    end
  end
end