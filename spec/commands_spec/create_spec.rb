require_relative '../spec_helper'

describe Create do
    describe "#self.execute" do

        before do
            @screen = Screen.new
        end

        it "creates new bitmap image for valid arguments" do
            expect{ Create.execute(@screen, ["5","6"]) }.to change{@screen.bitmap}.from(nil).to(Bitmap)
        end

        it "raises ArgumentError for wrong number of arguments" do
            expect{ Create.execute(@screen, ["5","6", "8"]) }.to raise_error(ArgumentError)
        end

        it "raises ArgumentError for invalid arguments" do
            expect{ Create.execute(@screen, ["5","W"]) }.to raise_error(ArgumentError)
        end

        it "raises OutOfBoundsError for invalid size of bitmap" do
            expect{ Create.execute(@screen, ["251","1"]) }.to raise_error(OutOfBoundsError)
        end
    end
end