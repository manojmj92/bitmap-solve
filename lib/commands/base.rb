require_relative '../errors'
require_relative '../string_core_ext'

module Command
    class Base

        def self.execute(screen, args)
            raise ImageNotInitialized if screen.bitmap.nil?
            valid_arguments?(args)
        end

        private

        def self.valid_arguments?(args)
            raise NotImplementedError, "inheriting class did not implment #argument_validator"
        end

    end
end