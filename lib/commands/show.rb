require_relative 'base'

module Command
    class Show < Base

        def self.execute(screen, args)
            super
            puts screen.bitmap.print
        end

        private

        def self.valid_arguments?(args)
             args.size != 0 ? (raise ArgumentError) : true
        end

    end
end