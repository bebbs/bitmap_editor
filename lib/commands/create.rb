module Commands
  class Create < Base
    def validate
      super(arg_count: 2, instruction: 'I')
      validate_integers(*arguments[0..1])
    end

    def perform_action
      @canvas = Canvas.new(width: arguments[0], height: arguments[1])
    end
  end
end