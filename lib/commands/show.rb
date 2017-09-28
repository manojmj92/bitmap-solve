=begin
    Command::Show - Used to print the bitmap to screen
=end


require_relative 'base'

module Command
    class Show < Base
        MAX_ARGUMENTS_COUNT = 0
        def self.execute(screen, args)
            super
            puts screen.bitmap.print
        end

        private

        def self.valid_arguments?(args)
             args.size != MAX_ARGUMENTS_COUNT ? (raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT)) : true
        end

    end
end