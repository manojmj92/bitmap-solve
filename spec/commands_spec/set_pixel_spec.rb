require_relative '../spec_helper'

describe Command::SetPixel do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Command::Create.execute(@screen, ["2","2"])
        end

        it "sets the pixel colour at the specified x,y coordinate" do
            expect(@screen.bitmap.image).to eq([
                        ['O','O'],
                        ['O','O']
                    ])
            Command::SetPixel.execute(@screen, ["1","1", "R"])
            expect(@screen.bitmap.image).to eq([
                        ['R','O'],
                        ['O','O']
                    ])
        end

         it "raises InvalidArgument for wrong number of arguments" do
             expect{ Command::SetPixel.execute(@screen, ["5","6"]) }.to raise_error(InvalidArgument)
        end

        it "raises InvalidArgumentType for invalid arguments" do
            expect{ Command::SetPixel.execute(@screen, ["5","5", "5"]) }.to raise_error(InvalidArgumentType)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Command::SetPixel.execute(Screen.new, ["1","1","R"]) }.to raise_error(ImageNotInitialized)
        end
    end
end