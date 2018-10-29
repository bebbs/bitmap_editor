module Commands
  class Fill < Base
    def validate
      super(arg_count: 3, instruction: 'L')
      validate_integers(*arguments[0..1])
      validate_colour(arguments[2])
      validate_canvas_exists
    end

    def perform_action
      column = arguments[0].to_i
      row = arguments[1].to_i
      colour = arguments[2]
      @canvas.fill_colour column, row, colour
    end
  end
end