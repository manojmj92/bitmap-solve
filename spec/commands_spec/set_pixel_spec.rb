require_relative '../spec_helper'

describe SetPixel do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Create.execute(@screen, ["2","2"])
        end

        it "sets the pixel colour at the specified x,y coordinate" do
            expect(@screen.bitmap.image).to eq([
                        ['O','O'],
                        ['O','O']
                    ])
            SetPixel.execute(@screen, ["1","1", "R"])
            expect(@screen.bitmap.image).to eq([
                        ['R','O'],
                        ['O','O']
                    ])
        end

         it "raises ArgumentError for wrong number of arguments" do
             expect{ SetPixel.execute(@screen, ["5","6"]) }.to raise_error(ArgumentError)
        end

        it "raises ArgumentError for invalid arguments" do
            expect{ Create.execute(@screen, ["5","5", "5"]) }.to raise_error(ArgumentError)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ SetPixel.execute(Screen.new, ["1","1","R"]) }.to raise_error(ImageNotInitialized)
        end
    end
end