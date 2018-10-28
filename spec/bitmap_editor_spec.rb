require 'bitmap_editor'
require 'tempfile'

describe BitmapEditor do
  context '#run' do
    let(:subject) { described_class.new.run path }
    let(:path) do
      Tempfile.new.tap do |file|
        file.write(content)
        file.rewind
      end
    end

    context 'with a valid file' do
      let(:content) { 'I 2 3' }
      it { expect { subject }.not_to raise_error }
    end

    context 'with an invalid file' do
      let(:content) { 'bad_content' }
      it { expect { subject }.to output(/Command not recognised/).to_stderr }
    end
  end
end