class BitmapEditor

  class InvalidCommandError < StandardError
  end

  COMMANDS = {'S': 0, 'C': 0, 'I': 2, 'L': 3, 'V': 4, 'H': 4}

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command = line[0]
      if COMMANDS.has_key? command.to_sym
        validate_command(line: line, arg_count: COMMANDS[command])
      else
        raise InvalidCommandError, 'Command not recognised'
      end
    end
  end

  private

  def validate_command(line:, arg_count:)
    args = line.split(' ').shift
    raise InvalidCommandError, 'Invalid number of arguments' unless args.length == arg_count
  end
end
