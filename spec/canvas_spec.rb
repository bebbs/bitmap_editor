describe Canvas do
  context '#new' do
    context 'with no given dimensions' do
      it 'uses the default dimensions' do
        expect(Canvas.new.width).to eq 1
        expect(Canvas.new.height).to eq 1
      end
    end

    context 'with valid dimensions' do
      width = 10
      height = 9
      canvas = Canvas.new(width: width, height: height)
  
      it 'sets a width' do
        expect(canvas.width).to eq 10
      end
  
      it 'sets a height' do
        expect(canvas.height).to eq 9
      end
    end
    
    context 'with invalid dimensions' do
      it 'rejects negative dimensions' do
        expect { Canvas.new(width: -3, height: -7) }
          .to raise_error(Canvas::InvalidDimensionsError, 'Dimensions must be above 0')
      end

      it 'rejects zero dimensions' do
        expect { Canvas.new(width: 0, height: 0) }
          .to raise_error(Canvas::InvalidDimensionsError, 'Dimensions must be above 0')
      end

      it 'rejects dimensions above the maximum' do
        expect { Canvas.new(width: 251, height: 251) }
          .to raise_error(Canvas::InvalidDimensionsError, 'Maximum canvas size exceeded')
      end
    end

    context 'is created with a default colour' do
      it 'should be O (white)' do
        canvas = Canvas.new
        expect(canvas.data[0][0]).to eq 'O'
      end
    end
  end

  context '#fill_colour' do
    let(:canvas) { Canvas.new(width: 2, height: 2) }

    it 'with pixel in bounds' do
      canvas.fill_colour(2, 2, 'M')
      expect(canvas.data).to eq [['O', 'O'], ['O', 'M']]

      canvas.fill_colour(1, 1, 'Q')
      expect(canvas.data).to eq [['Q', 'O'], ['O', 'M']]
    end

    it 'with pixel out of bounds' do
      expect { canvas.fill_colour(10, 10, 'M') }.to raise_error Canvas::OutOfBoundsError
    end
  end

  context '#clear' do
    let(:canvas) { Canvas.new(width: 2, height: 2) }

    it 'resets canvas to default values' do
      canvas.fill_colour(1, 1, 'B')
      canvas.clear
      expect(canvas.data).to eq [['O', 'O'], ['O', 'O']]
    end
  end
end