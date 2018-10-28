require_relative 'canvas'
require_relative 'commands/base'
require_relative 'commands/show'
require_relative 'commands/clear'
require_relative 'commands/create'
require_relative 'commands/fill'
require_relative 'commands/vertical'
require_relative 'commands/horizontal'

class BitmapEditor
  attr_reader :canvas

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
        cmd = COMMANDS[command].new line, @canvas
        @canvas = cmd.call
      else
        raise Commands::InvalidCommandError, 'Command not recognised'
      end
    end

  rescue => e
    warn(e)
  end
end
