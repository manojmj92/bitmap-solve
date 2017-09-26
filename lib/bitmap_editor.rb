require_relative 'bitmap'

class BitmapEditor
  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        puts @image.print
      when  /I (\d+) (\d+)/
        @image = Bitmap.new(width: $1.to_i, height: $2.to_i)
      when 'C'
        @image.clear
      when /L (\d+) (\d+) (\w)/
        @image.set_pixel_colour(x_cordinate: $1.to_i, y_cordinate: $2.to_i, colour: $3)
      when /V (\d+) (\d+) (\d+) (\w)/
        @image.colour_vertical(x_cordinate: $1.to_i, y_cordinate_start: $2.to_i, y_cordinate_end: $3.to_i, colour: $4)
      when /H (\d+) (\d+) (\d+) (\w)/
        @image.colour_horizontal(x_cordinate_start: $1.to_i, x_cordinate_end: $2.to_i, y_cordinate: $3.to_i, colour: $4)
      end
    end
  end
end
