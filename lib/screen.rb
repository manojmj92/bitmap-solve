require_relative 'commands/create'
require_relative 'commands/show'

class Screen
    attr_accessor :bitmap
    def initialize
        @bitmap = nil
    end

    def execute(command)
        command.klass.execute(self, command.args)
    end
end
