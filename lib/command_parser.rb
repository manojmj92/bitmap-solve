require 'ostruct'
require_relative 'errors'

class CommandParser

    AVAILABLE_COMMANDS = {
        'I' => 'Create',
        'L' => 'SetPixel',
        'V' => 'ColourVertical',
        'H' => 'ColourHorizontal',
        'S' => 'Show',
        'C' => 'Clear',
    }.freeze

    def self.parse(command_string:)

        command, *args = command_string.split
        raise InvalidCommand unless AVAILABLE_COMMANDS.has_key?(command)
        OpenStruct.new(klass: Object.const_get(AVAILABLE_COMMANDS[command]), args: args)
    end

end