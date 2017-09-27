require 'spec_helper'

describe CommandParser do

    describe "#self.parse" do

        it "raises InvalidCommand for invalid command input" do
            expect{ CommandParser.parse(command_string: "X Y Z") }.to raise_error(InvalidCommand)
        end

        it "returns a struct with 2 attributes for a valid input" do
            command_string = "I 5 6"
            result = CommandParser.parse(command_string: command_string)
            expect(result).to have_attributes(klass: Create, args: ["5","6"])
        end

    end
end