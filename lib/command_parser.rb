=begin
    CommandParser -
    This class contains a list of supported commands on the screen and the classes
    that execute these commands.
=end

require 'ostruct'

class CommandParser

    AVAILABLE_COMMANDS = {
        'I' => 'Command::Create',
        'L' => 'Command::SetPixel',
        'V' => 'Command::ColourVertical',
        'H' => 'Command::ColourHorizontal',
        'S' => 'Command::Show',
        'C' => 'Command::Clear',
    }.freeze

    #This function parses the command and arguments supplied.
    #Raises InvalidCommand error if command is not supported.
    #Returns an Openstruct with the command class and the arguments supplied from file
    def self.parse(command_string:)
        command, *args = command_string.split
        raise InvalidCommand.new(command, AVAILABLE_COMMANDS.keys) unless AVAILABLE_COMMANDS.has_key?(command)
        OpenStruct.new(klass: Object.const_get(AVAILABLE_COMMANDS[command]), args: args)
    end

end