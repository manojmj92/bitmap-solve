require_relative 'bitmap'
require_relative 'screen'
require_relative 'command_parser'

class BitmapEditor

  def run(file)

    raise FileError if (file.nil? || !File.exists?(file))
    screen = Screen.new
    File.open(file).each do |line|
      line = line.chomp
      command = CommandParser.parse(command_string: line)
      screen.execute(command)
    end
  end

end
