=begin
    Screen
    Screen is the basic object which contains the bitmap
    All commands are executed on the screen object
=end

require_relative 'errors'
require_relative 'commands/create'
require_relative 'commands/show'
require_relative 'commands/clear'
require_relative 'commands/set_pixel'
require_relative 'commands/colour_vertical'
require_relative 'commands/colour_horizontal'

class Screen

    attr_accessor :bitmap
    def initialize
        @bitmap = nil
    end

    def execute(command)
        command.klass.execute(self, command.args)
    end

end
