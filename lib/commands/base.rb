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

    private

    def validate(arg_count:)
      raise InvalidCommandError, 'Invalid number of arguments' unless arguments.length == arg_count
    end

    def arguments
      @line.split(' ').drop(1)
    end
  end
end