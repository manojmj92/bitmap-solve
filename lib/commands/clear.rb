require_relative 'base'

module Command
    class Clear < Base

        def self.execute(screen, args)
            super
            screen.bitmap.clear
        end

        private

        def self.valid_arguments?(args)
            args.size != 0 ? (raise ArgumentError) : true
        end

    end
end