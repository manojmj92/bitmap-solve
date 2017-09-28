require_relative 'base_command'

class Clear < BaseCommand

    def self.execute(screen, args)
        super
        screen.bitmap.clear
    end

    private

    def self.valid_arguments?(args)
        args.size != 0 ? (raise ArgumentError) : true
    end

end