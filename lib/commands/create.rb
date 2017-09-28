class Create

    def self.execute(screen, args)
        if valid_arguments?(args)
            screen.bitmap = Bitmap.new(*argument_parser(args))
        end
    end

    private

    def self.valid_arguments?(args)
        raise ArgumentError, "wrong number of arguments for #{self.name}" if args.size != 2
        width, height = *args
        raise ArgumentError, "wrong type of arguments" unless (width.integer? &&  height.integer?)
        raise OutOfBoundsError if (width.to_i > 250 || height.to_i > 250 || width.to_i < 1 || height.to_i < 1)
        true
    end

    def self.argument_parser(args)
        width, height = *args
        [width.to_i, height.to_i]
    end

end