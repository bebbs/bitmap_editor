require 'commands/base'

describe 'Commands' do
  context 'validates show' do
    it 'too many arguments' do
      cmd = Commands::Show.new('S 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates clear' do
    it 'too many arguments' do
      cmd = Commands::Clear.new('C 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end
  end

  context 'validates create' do
    it 'too few arguments' do
      cmd = Commands::Create.new('I 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Create.new('I 1 2 4 5 7', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'coordinates must be integers' do
      cmd = Commands::Create.new('I A B', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end

  context 'validates fill' do
    it 'too few arguments' do
      cmd = Commands::Fill.new('L 1 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Fill.new('L 1 2 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'coordinates must be integers' do
      cmd = Commands::Fill.new('L A B M', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end

  context 'validates vertical' do
    it 'too few arguments' do
      cmd = Commands::Vertical.new('V 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Vertical.new('V 1 1 2 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'coordinates must be integers' do
      cmd = Commands::Vertical.new('V X Y Z C', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end

  context 'validates horizontal' do
    it 'too few arguments' do
      cmd = Commands::Vertical.new('H 1 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'too many arguments' do
      cmd = Commands::Vertical.new('H 1 2 3 4 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'coordinates must be integers' do
      cmd = Commands::Horizontal.new('H X Y Z C', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end
end