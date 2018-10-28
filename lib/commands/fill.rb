module Commands
  class Fill < Base
    def validate
      super(arg_count: 3)
      validate_integers(*arguments[0..1])
      validate_colour(arguments[2])
      validate_canvas_exists
    end

    def perform_action
      x = arguments[0].to_i
      y = arguments[1].to_i
      colour = arguments[2]
      @canvas.fill_colour x, y, colour
    end
  end
end