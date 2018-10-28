class Canvas
  class InvalidDimensionsError < StandardError
  end

  DEFAULT_SIZE = 1
  MAXIMUM_SIZE = 250

  def initialize(width: DEFAULT_SIZE, height: DEFAULT_SIZE)
    @width = width.to_i
    @height = height.to_i
    validate_dimensions
    create_image
  end

  def create_image
    row = proc { Array.new(@width, "") }
    @data = Array.new(@height) { row.call }

  end

  def width
    @data.dig(0).length
  end

  def height
    @data.length
  end

  def fill_colour(x, y, colour)
  end

  private

  def validate_dimensions
    validate_minimum_dimensions
    validate_maximum_dimensions
  end

  def validate_minimum_dimensions
    if @width <= 0 || @height <= 0
      raise_error 'Dimensions must be above 0'
    end
  end

  def validate_maximum_dimensions
    if @width > MAXIMUM_SIZE || @height > MAXIMUM_SIZE
      raise_error 'Maximum canvas size exceeded'
    end
  end

  def raise_error message
    raise InvalidDimensionsError, message
  end
end