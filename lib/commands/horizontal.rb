module Commands
  class Horizontal < Base
    def validate
      super(arg_count: 4)
    end
  end
end