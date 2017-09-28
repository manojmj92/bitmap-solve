require_relative 'base'

module Command
    class ColourVertical < Base

        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.colour_vertical(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise ArgumentError, "wrong number of arguments for #{self.name}" if args.size != 4
            x_coordinate, y_coordinate_start, y_coordinate_end, colour = *args
            raise ArgumentError, "wrong type of arguments" unless (
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