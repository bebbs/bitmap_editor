module Commands
  class Create < Base
    def validate
      super(arg_count: 2)
      validate_integers(arguments[0], arguments[1])
    end
  end
end