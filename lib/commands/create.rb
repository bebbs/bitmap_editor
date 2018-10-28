module Commands
  class Create < Base
    def validate
      super(arg_count: 2)
      validate_coordinates
    end
  end
end