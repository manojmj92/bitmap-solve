require_relative '../spec_helper'

describe Show do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Create.execute(@screen, ["2","2"])
        end

        it "raises ArgumentError for wrong number of arguments" do
            expect{ Show.execute(@screen, ["X"]) }.to raise_error(ArgumentError)
        end

        it "prints the bitmap for correct number of arguments" do
            expect{ Show.execute(@screen, []) }.to output("OO\nOO\n").to_stdout
        end


    end
end