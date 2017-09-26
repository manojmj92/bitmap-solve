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
        @image = Bitmap.new($1.to_i, $2.to_i)
      when 'C'
        @image.clear
      end
    end
  end
end
