require 'commands/base'

class BitmapEditor
  COMMANDS = {'S': 0, 'C': 0, 'I': 2, 'L': 3, 'V': 4, 'H': 4}

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command = line[0]
      if COMMANDS.has_key? command.to_sym
        cmd = Commands::Base.new(line, COMMANDS[command])
        cmd.call
      else
        raise Commands::InvalidCommandError, 'Command not recognised'
      end
    end
  end
end
