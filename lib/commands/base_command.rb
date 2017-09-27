require_relative '../errors'

class BaseCommand
    def self.execute(screen)
        raise ImageNotInitialized if screen.bitmap.nil?
    end
end