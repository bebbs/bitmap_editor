require 'ext/string'

module Commands
  class InvalidCommandError < StandardError
  end

  class Base
    def initialize(line, canvas)
      @line = line
      @canvas = canvas
    end

    def call
      validate
      perform_action
      @canvas
    end

    protected

    def validate(arg_count:)
      raise_error 'Invalid number of arguments' unless arguments.length == arg_count
    end

    def arguments
      @line.split(' ').drop(1)
    end

    def validate_integers *coords
        coords.each {|x| raise_error 'Coordinates must be integers' unless x.is_i? }
    end

    def perform_action
    end

    def raise_error message
      raise InvalidCommandError, message
    end
  end
end