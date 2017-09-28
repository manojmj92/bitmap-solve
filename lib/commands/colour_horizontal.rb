=begin
    Command::ColourHorizontal - Used to colour a horizontal patch of pixels
=end
require_relative 'base'

module Command
    class ColourHorizontal < Base
        MAX_ARGUMENTS_COUNT = 4
        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.colour_horizontal(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT) if args.size != MAX_ARGUMENTS_COUNT
            x_coordinate_start, x_coordinate_end, y_coordinate, colour = *args
            raise InvalidArgumentType.new(self.name) unless (
                                                                x_coordinate_start.integer? &&
                                                                x_coordinate_end.integer? &&
                                                                y_coordinate.integer? &&
                                                                colour.colour?
                                                            )
            true
        end

        def self.argument_parser(args)
            x_coordinate_start, x_coordinate_end, y_coordinate, colour = *args
            [x_coordinate_start.to_i, x_coordinate_end.to_i, y_coordinate.to_i, colour]
        end

    end
end