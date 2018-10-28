require 'ext/string'

module Commands
  class Create < Base
    def validate
      super(arg_count: 2)
      validate_coordinates
    end

    protected

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