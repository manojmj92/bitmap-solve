class Bitmap

  attr_reader :width, :height, :image
  def initialize(width,height)
    @height = height
    @width = width
    @image = clean_image
  end

  def print
    @image.inject("") do |result, row|
      result << row.join('') << "\n"
    end
  end

  def clear
    @image = clean_image
  end

  def set_pixel_colour(x_cordinate, y_cordinate, colour)
    raise OutOfBoundsError if out_of_range?(x_cordinate, y_cordinate)
    @image[y_cordinate - 1][x_cordinate - 1] = colour
  end

  def colour_vertical(x_cordinate, y_cordinate_start, y_cordinate_end, colour)
    (y_cordinate_start..y_cordinate_end).each do |y_cordinate|
      set_pixel_colour(x_cordinate, y_cordinate, colour)
    end
  end

  def colour_horizontal(y_cordinate, x_cordinate_start, x_cordinate_end, colour)
    (x_cordinate_start..x_cordinate_end).each do |x_cordinate|
      set_pixel_colour(x_cordinate, y_cordinate, colour)
    end
  end

  private

  def out_of_range?(x_cordinate, y_cordinate)
    height_range = (1..height)
    width_range = (1..width)
    !(height_range.include?(y_cordinate) && width_range.include?(x_cordinate))
  end

  def clean_image
    Array.new(height) { Array.new(width) {'O'} }
  end

end
