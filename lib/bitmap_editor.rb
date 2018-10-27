class BitmapEditor

  class InvalidCommandError < StandardError
  end

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line[0]
      when 'S'
        validate_command(command: line, arg_count: 0)
      when 'C'
        validate_command(command: line, arg_count: 0)
      when 'I'
        validate_command(command: line, arg_count: 2)
      when 'L'
        validate_command(command: line, arg_count: 3)
      when 'V'
        validate_command(command: line, arg_count: 4)
      when 'H'
        validate_command(command: line, arg_count: 4)
      else
        raise InvalidCommandError, 'Command not recognised'
      end
    end
  end

  private

  def validate_command(command:, arg_count:)
    args = command.split(' ').shift
    raise InvalidCommandError, 'Invalid number of arguments' unless args.length == arg_count
  end
end
