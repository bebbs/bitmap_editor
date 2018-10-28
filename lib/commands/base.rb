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

    def validate_coordinates
      if !coordinates_are_integers
        raise InvalidCommandError, 'Coordinates must be integers'
      end
    end

    def coordinates_are_integers
      arguments[0].is_i? && arguments[1].is_i?
    end
  end
end