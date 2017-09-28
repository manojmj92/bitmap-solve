=begin
    Command::ColourVertical - Used to colour a vertical patch of pixels
=end

require_relative 'base'

module Command
    class ColourVertical < Base
        MAX_ARGUMENTS_COUNT = 4
        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.colour_vertical(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT) if args.size != MAX_ARGUMENTS_COUNT
            x_coordinate, y_coordinate_start, y_coordinate_end, colour = *args
            raise InvalidArgumentType.new(self.name) unless (
                                                                x_coordinate.integer? &&
                                                                y_coordinate_start.integer? &&
                                                                y_coordinate_end.integer? &&
                                                                colour.colour?
                                                            )
            true
        end

        def self.argument_parser(args)
            x_coordinate, y_coordinate_start, y_coordinate_end, colour = *args
            [x_coordinate.to_i, y_coordinate_start.to_i, y_coordinate_end.to_i, colour]
        end

    end
end