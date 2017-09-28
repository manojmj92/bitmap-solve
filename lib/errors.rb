class FileError < StandardError
    def initialize(msg = "The file is invalid or does not exist")
        super
    end
end

class InvalidCommand < StandardError
    def initialize(command, all_commands)
        super("Invalid command #{command} provided. Available commands are: #{all_commands.join(",").inspect}")
    end
end

class ImageNotInitialized < StandardError
    def initialize(msg = "The image is not initialized yet. Initialize the image using the 'I' command before proceeding")
        super
    end
end

class OutOfBounds < StandardError
    def initialize(msg = "The specified pixels are beyond the boundary of the image")
        super
    end
end

class InvalidArgument < StandardError
    def initialize(klass_name, max_arguments_count)
        super("Invalid number of arguments for #{klass_name}. Number of arguments needed is #{max_arguments_count}")
    end
end

class InvalidArgumentType < StandardError
    def initialize(klass_name)
        super("Invalid type of arguments supplied for #{klass_name}")
    end
end