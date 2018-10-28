module Commands
  class Fill < Base
    def validate
      super(arg_count: 3)
      validate_coordinates
    end
  end
end