module Commands
  class Clear < Base
    def validate
      super(arg_count: 0, instruction: 'C')
      validate_canvas_exists
    end

    def perform_action
      @canvas.clear
    end
  end
end