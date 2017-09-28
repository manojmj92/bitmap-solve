require_relative 'base_command'

class Show < BaseCommand

    def self.execute(screen, args)
        super(screen)
        argument_validator(args)
        puts screen.bitmap.print
    end

    private

    def self.argument_validator(args)
        raise ArgumentError if args.size != 0
    end

end