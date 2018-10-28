module Commands
  class Fill < Base
    def validate
      super(arg_count: 3)
      validate_integers(*arguments[0..1])
      validate_canvas_exists
    end
  end
end