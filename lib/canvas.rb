class Canvas
  DEFAULT_SIZE = 1

  def initialize(width: DEFAULT_SIZE, height: DEFAULT_SIZE)
    @width = width.to_i
    @height = height.to_i
    create_image
  end

  def create_image
    row = Array.new(@width, "")
    @data = Array.new(@height, row)
  end

  def width
    @data.dig(0).length
  end

  def height
    @data.length
  end
end