require_relative '../ext/string'

module Commands
  class InvalidCommandError < StandardError
  end

  class NilCanvasError < StandardError
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

    def arguments
      @line.split(' ').drop(1)
    end

    def recognised? instruction
      @line[0] == instruction
    end

    def validate(arg_count:, instruction:)
      raise InvalidCommandError, 'Invalid number of arguments' unless arguments.length == arg_count
      raise InvalidCommandError, 'Unrecognised command' unless recognised? instruction
    end

    def validate_integers *coords
        coords.each {|x| raise InvalidCommandError, 'Coordinates must be integers' unless x.is_i? }
    end

    def validate_colour colour
      raise InvalidCommandError, 'Must provide a valid colour' unless colour.is_letter?
    end

    def validate_canvas_exists
      raise NilCanvasError, 'Command must be called after creating a canvas' if @canvas.nil?
    end

    def perform_action
    end
  end
end