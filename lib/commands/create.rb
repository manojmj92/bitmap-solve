require_relative 'base_command'

class Create < BaseCommand
    def self.execute(screen, args)
        screen.bitmap = Bitmap.new(*argument_validator(args))
    end

    private

    def self.argument_validator(args)
        raise ArgumentError, "wrong number of arguments for #{self.name}" if args.size != 2
        width, height = *args
        raise ArgumentError, "wrong type of arguments" unless (width.integer? &&  height.integer?)
        raise OutOfBoundsError if (width.to_i > 250 || height.to_i > 250 || width.to_i < 1 || height.to_i < 1)
        [width.to_i, height.to_i]
    end
end