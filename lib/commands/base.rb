module Commands
  class InvalidCommandError < StandardError
  end

  class Base
    def initialize(line, arg_count)
      @line = line
      @arg_count = arg_count
    end

    def call
      validate
    end

    private

    def validate
      args = @line.split(' ').shift
      raise InvalidCommandError, 'Invalid number of arguments' unless @line.length == @arg_count
    end
  end
end