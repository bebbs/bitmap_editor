require 'commands/base'

describe 'Commands' do
  let(:canvas) { instance_double('Canvas', 
    :fill_colour => true, 
    :fill_horizontal => true,
    :fill_vertical => true,
    :clear => true, 
    :show => true)
  }

  context Commands::Show do
    it 'rejects too many arguments' do
      cmd = described_class.new('S 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that canvas exists' do
      cmd = described_class.new('S', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends show command to canvas' do
      cmd = described_class.new('S', canvas)
      cmd.call
      expect(canvas).to have_received(:show)
    end
  end

  context Commands::Clear do
    it 'rejects too many arguments' do
      cmd = described_class.new('C 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that canvas exists' do
      cmd = described_class.new('C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends clear command to canvas' do
      cmd = described_class.new('C', canvas)
      cmd.call
      expect(canvas).to have_received(:clear)
    end
  end

  context Commands::Create do
    it 'rejects too few arguments' do
      cmd = described_class.new('I 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects too many arguments' do
      cmd = described_class.new('I 1 2 4 5 7', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X 1 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that coordinates are integers' do
      cmd = described_class.new('I A B', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end
  end

  context Commands::Fill do
    it 'rejects too few arguments' do
      cmd = described_class.new('L 1 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects too many arguments' do
      cmd = described_class.new('L 1 2 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X 1 2 A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that coordinates are integers' do
      cmd = described_class.new('L A B M', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end

    it 'checks that colour is a letter' do
      cmd = described_class.new('L 1 2 8', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Must provide a valid colour')
    end

    it 'checks that canvas exists' do
      cmd = described_class.new('L 1 2 M', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends fill command to canvas' do
      cmd = described_class.new('L 1 2 M', canvas)
      cmd.call
      expect(canvas).to have_received(:fill_colour)
    end
  end

  context Commands::Vertical do
    it 'rejects too few arguments' do
      cmd = described_class.new('V 1', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects too many arguments' do
      cmd = described_class.new('V 1 1 2 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X 1 2 3 A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that coordinates are integers' do
      cmd = described_class.new('V X Y Z C', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end

    it 'checks that colour is a letter' do
      cmd = described_class.new('V 1 2 3 8', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Must provide a valid colour')
    end

    it 'checks that canvas exists' do
      cmd = described_class.new('V 1 2 3 C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends vertical command to canvas' do
      cmd = described_class.new('V 1 2 3 C', canvas)
      cmd.call
      expect(canvas).to have_received(:fill_vertical)
    end
  end

  context Commands::Horizontal do
    it 'rejects too few arguments' do
      cmd = described_class.new('H 1 2', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects too many arguments' do
      cmd = described_class.new('H 1 2 3 4 C A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
    end

    it 'rejects invalid instruction' do
      cmd = described_class.new('X 1 2 3 A', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
    end

    it 'checks that coordinates are integers' do
      cmd = described_class.new('H X Y Z C', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
    end

    it 'checks that colour is a letter' do
      cmd = described_class.new('H 1 2 3 8', nil)
      expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Must provide a valid colour')
    end

    it 'checks that canvas exists' do
      cmd = described_class.new('H 1 2 3 C', nil)
      expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
    end

    it 'sends horizontal command to canvas' do
      cmd = described_class.new('H 1 2 3 C', canvas)
      cmd.call
      expect(canvas).to have_received(:fill_horizontal)
    end
  end
end