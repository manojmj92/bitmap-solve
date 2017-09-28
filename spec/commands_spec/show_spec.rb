require_relative '../spec_helper'

describe Command::Show do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Command::Create.execute(@screen, ["2","2"])
        end

        it "raises ArgumentError for wrong number of arguments" do
            expect{ Command::Show.execute(@screen, ["X"]) }.to raise_error(ArgumentError)
        end

        it "prints the bitmap for correct number of arguments" do
            expect{ Command::Show.execute(@screen, []) }.to output("OO\nOO\n").to_stdout
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Command::Show.execute(Screen.new, []) }.to raise_error(ImageNotInitialized)
        end

    end
end