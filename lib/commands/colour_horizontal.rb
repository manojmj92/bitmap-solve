require_relative 'base'

module Command
    class ColourHorizontal < Base

        def self.execute(screen, args)
            super(screen, args)
            screen.bitmap.colour_horizontal(*argument_parser(args))
        end

        private

        def self.valid_arguments?(args)
            raise ArgumentError, "wrong number of arguments for #{self.name}" if args.size != 4
            x_coordinate_start, x_coordinate_end, y_coordinate, colour = *args
            raise ArgumentError, "wrong type of arguments" unless (
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