require_relative 'base'

module Command
    class SetPixel < Base

        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.set_pixel_colour(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise ArgumentError, "wrong number of arguments for #{self.name}" if args.size != 3
            x_coordinate, y_coordinate, colour = *args
            raise ArgumentError, "wrong type of arguments" unless (x_coordinate.integer? &&  y_coordinate.integer? && colour.colour?)
            true
        end

        def self.argument_parser(args)
            x_coordinate, y_coordinate, colour = *args
            [x_coordinate.to_i, y_coordinate.to_i, colour]
        end

    end
end