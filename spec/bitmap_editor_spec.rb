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
    it { expect{ subject }.to raise_error('Invalid number of arguments') }
  end
end