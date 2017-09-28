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

    def self.parse(command_string:)

        command, *args = command_string.split
        raise InvalidCommand unless AVAILABLE_COMMANDS.has_key?(command)
        OpenStruct.new(klass: Object.const_get(AVAILABLE_COMMANDS[command]), args: args)
    end

end