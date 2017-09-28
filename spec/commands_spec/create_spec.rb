require_relative '../spec_helper'

describe Command::Create do
    describe "#self.execute" do

        before do
            @screen = Screen.new
        end

        it "creates new bitmap image for valid arguments" do
            expect{ Command::Create.execute(@screen, ["5","6"]) }.to change{@screen.bitmap}.from(nil).to(Bitmap)
        end

        it "raises InvalidArgument for wrong number of arguments" do
        expect{ Command::Create.execute(@screen, ["5","6", "8"]) }.to raise_error(InvalidArgument)
        end

        it "raises InvalidArgumentType for invalid arguments" do
            expect{ Command::Create.execute(@screen, ["5","W"]) }.to raise_error(InvalidArgumentType)
        end

        it "raises OutOfBounds for invalid size of bitmap" do
            expect{ Command::Create.execute(@screen, ["251","1"]) }.to raise_error(OutOfBounds)
        end
    end
end