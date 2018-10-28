module Commands
  class Show < Base
    def validate
      super(arg_count: 0)
      validate_canvas_exists
    end

    def perform_action
      @canvas.show
    end
  end
end