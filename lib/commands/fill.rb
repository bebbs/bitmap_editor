module Commands
  class Fill < Base
    def validate
      super(arg_count: 3)
      validate_integers(arguments[0], arguments[1])
    end
  end
end