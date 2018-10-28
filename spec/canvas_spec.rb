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
  end
end