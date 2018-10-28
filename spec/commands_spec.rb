require 'commands/base'

describe 'Commands' do
  let(:canvas) { instance_double('Canvas', :fill_colour => true, :clear => true, :show => true) }

  context 'validates show' do
    it 'too many arguments' do
      cmd = Commands::Show.new('S 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'when canvas does not exist' do
      cmd = Commands::Show.new('S', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'when canvas exists' do
      cmd = Commands::Show.new('S', canvas)
      expect { cmd.call }.not_to raise_error
    end

    it 'send show command to canvas' do
      cmd = Commands::Show.new('S', canvas)
      cmd.call
      expect(canvas).to have_received(:show)
    end
  end

  context 'validates clear' do
    it 'too many arguments' do
      cmd = Commands::Clear.new('C 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'when canvas does not exist' do
      cmd = Commands::Clear.new('C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'when canvas exists' do
      cmd = Commands::Clear.new('C', canvas)
      expect { cmd.call }.not_to raise_error
    end

    it 'sends clear command to canvas' do
      cmd = Commands::Clear.new('C', canvas)
      cmd.call
      expect(canvas).to have_received(:clear)
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

    it 'when canvas does not exist' do
      cmd = Commands::Fill.new('L 1 2 M', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends fill_colour command to canvas' do
      cmd = Commands::Fill.new('L 1 2 M', canvas)
      cmd.call
      expect(canvas).to have_received(:fill_colour)
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

    it 'when canvas does not exist' do
      cmd = Commands::Vertical.new('V 1 2 3 C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'when canvas exists' do
      cmd = Commands::Vertical.new('V 1 2 3 C', canvas)
      expect { cmd.call }.not_to raise_error
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

    it 'when canvas does not exist' do
      cmd = Commands::Horizontal.new('H 1 2 3 C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'when canvas exists' do
      cmd = Commands::Horizontal.new('H 1 2 3 C', canvas)
      expect { cmd.call }.not_to raise_error
    end
  end
end