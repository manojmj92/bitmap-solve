require_relative '../spec_helper'

describe Command::ColourHorizontal do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Command::Create.execute(@screen, ["5","6"])
        end

        it "Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)." do
            expect(@screen.bitmap.image).to eq([
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O']
                    ])
            Command::ColourHorizontal.execute(@screen, ["3","5","2","Z"])
            expect(@screen.bitmap.image).to eq([
                        ['O','O','O','O','O'],
                        ['O','O','Z','Z','Z'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O']
                    ])
        end

         it "raises InvalidArgument for wrong number of arguments" do
             expect{ Command::ColourHorizontal.execute(@screen, ["2","1", "X"]) }.to raise_error(InvalidArgument)
        end

        it "raises InvalidArgumentType for invalid arguments" do
            expect{ Command::ColourHorizontal.execute(@screen, ["2","3", "W", "W"]) }.to raise_error(InvalidArgumentType)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Command::ColourHorizontal.execute(Screen.new, ["1","1","2","W"]) }.to raise_error(ImageNotInitialized)
        end
    end
end