module Commands
  class Show < Base
    def validate
      super(arg_count: 0)
    end
  end
end