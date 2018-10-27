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

  context 'validates S command' do 
    context 'too many arguments' do
      let(:content) { 'S 1' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end

  context 'validates C command' do
    context 'too many arguments' do
      let(:content) { 'C 1' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end

  context 'validates I command' do
    context 'too few arguments' do
      let(:content) { 'I 2' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end

    context 'too many arguments' do
      let(:content) { 'I 1 2 4 5 7' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end

  context 'validates L command' do
    context 'too few arguments' do
      let(:content) { 'L X Y' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end

    context 'too many arguments' do
      let(:content) { 'L X Y C A' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end

  context 'validates V command' do
    context 'too few arguments' do
      let(:content) { 'V X' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end

    context 'too many arguments' do
      let(:content) { 'V X Y1 Y2 C A' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end

  context 'validates H command' do
    context 'too few arguments' do
      let(:content) { 'H X1 X2' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end

    context 'too many arguments' do
      let(:content) { 'H X1 X2 C A' }
      it { expect { subject }.to raise_error('Invalid number of arguments') }
    end
  end
end