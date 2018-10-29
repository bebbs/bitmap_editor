class Canvas
  class InvalidDimensionsError < StandardError
  end

  class OutOfBoundsError < StandardError
  end

  DEFAULT_COLOUR = 'O'
  DEFAULT_SIZE = 1
  MAXIMUM_SIZE = 250

  attr_reader :data

  def initialize(width: DEFAULT_SIZE, height: DEFAULT_SIZE)
    @width = width.to_i
    @height = height.to_i
    validate_dimensions
    create_image
  end

  def create_image
    row = proc { Array.new(@width, DEFAULT_COLOUR) }
    @data = Array.new(@height) { row.call }
  end

  def width
    @data.dig(0).length
  end

  def height
    @data.length
  end

  def clear
    create_image
  end

  def show
    @data.each {|row| puts row.join }
  end

  def fill_colour(x, y, colour)
    validate_in_bounds(x, y)
    @data[y.to_i-1][x.to_i-1] = colour
  end

  def fill_vertical(column, row_start, row_end, colour)
    sorted_range(row_start, row_end).each do |row|
      fill_colour(column, row, colour)
    end
  end

  def fill_horizontal(column_start, column_end, row, colour)
    sorted_range(column_start, column_end).each do |column|
      fill_colour(column, row, colour)
    end
  end

  private

  def sorted_range(a, b)
    Range.new(*[a,b].sort)
  end

  def validate_dimensions
    validate_minimum_dimensions
    validate_maximum_dimensions
  end

  def validate_minimum_dimensions
    if @width <= 0 || @height <= 0
      raise_dimensions_error 'Dimensions must be above 0'
    end
  end

  def validate_maximum_dimensions
    if @width > MAXIMUM_SIZE || @height > MAXIMUM_SIZE
      raise_dimensions_error 'Maximum canvas size exceeded'
    end
  end

  def raise_dimensions_error message
    raise InvalidDimensionsError, message
  end

  def validate_in_bounds(x, y)
    if !within_range(x, 1, width) || !within_range(y, 1, height)
      puts "#{x}, #{y} - not in range #{width} #{height}"
    end
    raise OutOfBoundsError, 'No pixel found' unless within_range(x, 1, width) && within_range(y, 1, height)
  end

  def within_range(n, min, max)
    n.to_i.between?(min, max)
  end
end