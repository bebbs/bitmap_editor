module Commands
  class Vertical < Base
    def validate
      super(arg_count: 4)
      validate_integers(*arguments[0..2])
      validate_canvas_exists
    end

    def perform_action
      @canvas.fill_vertical(*arguments)
    end
  end
end