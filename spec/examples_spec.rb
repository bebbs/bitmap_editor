

describe 'Example files' do
  context 'Valid files' do
    it 'clear.txt' do
      expect { BitmapEditor.new.run('examples/clear.txt') }
        .to output("OO\nOO\n").to_stdout
    end

    it 'horizontal_and_vertical.txt' do
      expect { BitmapEditor.new.run('examples/horizontal_and_vertical.txt') }
        .to output("OJLJ\nOOLO\nOOOO\nOOOO\n").to_stdout
    end

    it 'simple_fill.txt' do
      expect { BitmapEditor.new.run('examples/simple_fill.txt') }
        .to output("CO\nOO\n").to_stdout
    end
  end
end