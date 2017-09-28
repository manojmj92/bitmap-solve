=begin
    Command::Create - Used to create a new bitmap image with specified height and width.
    This class does not inherit from Command::Base because an existing image is not a
    prerequisite for this command.
=end

module Command
    class Create
        MAX_ARGUMENTS_COUNT = 2
        def self.execute(screen, args)
            if valid_arguments?(args)
                screen.bitmap = Bitmap.new(*argument_parser(args))
            end
        end

        private

        def self.valid_arguments?(args)
            raise InvalidArgument.new(self.name, MAX_ARGUMENTS_COUNT) if args.size != MAX_ARGUMENTS_COUNT
            width, height = *args
            raise InvalidArgumentType.new(self.name) unless (width.integer? &&  height.integer?)
            raise OutOfBounds if (width.to_i > 250 || height.to_i > 250 || width.to_i < 1 || height.to_i < 1)
            true
        end

        def self.argument_parser(args)
            width, height = *args
            [width.to_i, height.to_i]
        end

    end
end