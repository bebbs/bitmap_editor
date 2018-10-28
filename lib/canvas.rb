class Canvas
  class InvalidDimensionsError < StandardError
  end

  DEFAULT_SIZE = 1

  def initialize(width: DEFAULT_SIZE, height: DEFAULT_SIZE)
    @width = width.to_i
    @height = height.to_i
    validate_dimensions
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

  private

  def validate_dimensions
    if @width <= 0 || @height <= 0
      raise InvalidDimensionsError, 'Dimensions must be above 0'
    end
  end
end