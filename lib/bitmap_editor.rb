require 'commands/base'
require 'commands/show'
require 'commands/clear'
require 'commands/create'
require 'commands/fill'
require 'commands/vertical'
require 'commands/horizontal'

class BitmapEditor
  COMMANDS = {
    'S' => Commands::Show, 
    'C' => Commands::Clear, 
    'I' => Commands::Create, 
    'L' => Commands::Fill, 
    'V' => Commands::Vertical, 
    'H' => Commands::Horizontal
  }

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command = line[0]
      if COMMANDS.has_key? command
        cmd = COMMANDS[command].new line
        cmd.call
      else
        raise Commands::InvalidCommandError, 'Command not recognised'
      end
    end
  end
end
