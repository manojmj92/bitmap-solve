require_relative '../errors'
require_relative '../string_core_ext'

class BaseCommand
    def self.execute(screen)
        raise ImageNotInitialized if screen.bitmap.nil?
    end
end