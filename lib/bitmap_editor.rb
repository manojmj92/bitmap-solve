=begin
    BitmapEditor -
    This class opens the file and feeds each line to CommandParser to find the command to be executed.
    This command is later executed on the screen object.
=end


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
