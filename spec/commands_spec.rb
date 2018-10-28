require 'commands/base'

describe 'Commands' do
  context 'validates show' do
    it 'too many arguments' do
      cmd = Commands::Show.new('S 1')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates clear' do
    it 'too many arguments' do
      cmd = Commands::Clear.new('C 1')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates create' do
    it 'too few arguments' do
      cmd = Commands::Create.new('I 2')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Create.new('I 1 2 4 5 7')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'coordinates must be integers' do
      cmd = Commands::Create.new('I A B')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end

  context 'validates fill' do
    it 'too few arguments' do
      cmd = Commands::Fill.new('L X Y')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Fill.new('L X Y C A')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates vertical' do
    it 'too few arguments' do
      cmd = Commands::Vertical.new('V X')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Vertical.new('V X Y1 Y2 C A')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates horizontal' do
    it 'too few arguments' do
      cmd = Commands::Vertical.new('H X1 X2')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Vertical.new('H X Y1 Y2 Y3 C A')
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end
end