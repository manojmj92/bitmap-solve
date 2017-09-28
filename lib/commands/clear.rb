require_relative 'base'

module Command
    class Clear < Base
        MAX_ARGUMENTS_COUNT = 0
        def self.execute(screen, args)
            super
            screen.bitmap.clear
        end

        private

        def self.valid_arguments?(args)
            args.size != MAX_ARGUMENTS_COUNT ? (raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT)) : true
        end

    end
end