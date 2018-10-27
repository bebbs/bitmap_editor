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
end