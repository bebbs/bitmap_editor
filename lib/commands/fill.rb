module Commands
  class Fill < Base
    def validate
      super(arg_count: 3)
    end
  end
end