module Commands
  class Vertical < Base
    def validate
      super(arg_count: 4)
    end
  end
end