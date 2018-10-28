require 'commands/base'

def test_too_many_arguments(command)
  it 'rejects too many arguments' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
  end
end

def test_too_few_arguments(command)
  it 'rejects too few arguments' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Invalid number of arguments')
  end
end

def test_invalid_instruction(command)
  it 'rejects invalid instruction' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Unrecognised command')
  end
end

def test_canvas_exists(command)
  it 'checks that canvas exists' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::NilCanvasError, 'Command must be called after creating a canvas')
  end
end

def test_canvas_method_sent(command, method)
  it 'sends show command to canvas' do
    cmd = described_class.new(command, canvas)
    cmd.call
    expect(canvas).to have_received(method)
  end
end

def test_coordinates_are_integers(command)
  it 'checks that coordinates are integers' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Coordinates must be integers')
  end
end

def test_validate_colour(command)
  it 'checks that colour is a letter' do
    cmd = described_class.new(command, nil)
    expect { cmd.call }.to raise_error(Commands::InvalidCommandError, 'Must provide a valid colour')
  end
end

describe 'Commands' do
  let(:canvas) { instance_double('Canvas', 
    :fill_colour => true, 
    :fill_horizontal => true,
    :fill_vertical => true,
    :clear => true, 
    :show => true)
  }

  context Commands::Show do
    test_too_many_arguments 'S 1'
    test_invalid_instruction 'X'
    test_canvas_exists 'S'
    test_canvas_method_sent 'S', :show
  end

  context Commands::Clear do
    test_too_many_arguments 'C 1'
    test_invalid_instruction 'X'
    test_canvas_exists 'C'
    test_canvas_method_sent 'C', :clear
  end

  context Commands::Create do
    test_too_few_arguments 'I 2'
    test_too_many_arguments 'I 1 2 4 5 7'
    test_invalid_instruction 'X 1 2'
    test_coordinates_are_integers 'I A B'
  end

  context Commands::Fill do
    test_too_few_arguments 'L 1 2'
    test_too_many_arguments 'L 1 2 C A'
    test_invalid_instruction 'X 1 2 A'
    test_coordinates_are_integers 'L A B M'
    test_validate_colour 'L 1 2 8'
    test_canvas_exists 'L 1 2 M'
    test_canvas_method_sent 'L 1 2 M', :fill_colour
  end

  context Commands::Vertical do
    test_too_few_arguments 'V 1'
    test_too_many_arguments 'V 1 1 2 C A'
    test_invalid_instruction 'X 1 2 3 A'
    test_coordinates_are_integers 'V X Y Z C'
    test_validate_colour 'V 1 2 3 8'
    test_canvas_exists 'V 1 2 3 C'
    test_canvas_method_sent 'V 1 2 3 C', :fill_vertical
  end

  context Commands::Horizontal do
    test_too_few_arguments 'H 1 2'
    test_too_many_arguments 'H 1 2 3 4 C A'
    test_invalid_instruction 'X 1 2 3 A'
    test_coordinates_are_integers 'H X Y Z C'
    test_validate_colour 'H 1 2 3 8'
    test_canvas_exists 'H 1 2 3 C'
    test_canvas_method_sent 'H 1 2 3 C', :fill_horizontal
  end
end
