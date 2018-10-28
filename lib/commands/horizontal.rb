module Commands
  class Horizontal < Base
    def validate
      super(arg_count: 4)
      validate_integers(arguments[0], arguments[1], arguments[2])
    end
  end
end