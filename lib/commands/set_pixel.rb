=begin
    Command::SetPixel - Used to colour a single pixel in the bitmap using specified colour
=end


require_relative 'base'

module Command
    class SetPixel < Base
        MAX_ARGUMENTS_COUNT = 3
        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.set_pixel_colour(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT) if args.size != MAX_ARGUMENTS_COUNT
            x_coordinate, y_coordinate, colour = *args
            raise InvalidArgumentType.new(self.name) unless (x_coordinate.integer? &&  y_coordinate.integer? && colour.colour?)
            true
        end

        def self.argument_parser(args)
            x_coordinate, y_coordinate, colour = *args
            [x_coordinate.to_i, y_coordinate.to_i, colour]
        end

    end
end