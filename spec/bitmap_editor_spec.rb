require 'bitmap_editor'
require 'tempfile'

describe BitmapEditor do
  let(:subject) { described_class.new.run path }
  let(:path) do
    Tempfile.new.tap do |file|
      file.write(content)
      file.rewind
    end
  end

  context 'receives invalid command' do
    let(:content) { 'bad_command' }
    it { expect { subject }.to raise_error('Command not recognised') }
  end

  context 'receives I command with too few arguments' do
    let(:content) { 'I 2' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives I command with too many arguments' do
    let(:content) { 'I 1 2 4 5 7' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives S command with too many arguments' do 
    let(:content) { 'S 1' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives C command with too many arguments' do 
    let(:content) { 'C 1' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives L command with too few arguments' do 
    let(:content) { 'L X Y' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives L command with too few arguments' do 
    let(:content) { 'L X Y C A' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end
  
  context 'receives V command with too few arguments' do 
    let(:content) { 'V X Y1' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives V command with too many arguments' do 
    let(:content) { 'V X Y1 Y2 C A' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end

  context 'receives H command with too few arguments' do 
    let(:content) { 'H X1 X2' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end
  
  context 'receives H command with too many arguments' do 
    let(:content) { 'H X1 X2 C A' }
    it { expect { subject }.to raise_error('Invalid number of arguments') }
  end
end