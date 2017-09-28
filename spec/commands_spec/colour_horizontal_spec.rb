require_relative '../spec_helper'

describe ColourHorizontal do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Create.execute(@screen, ["5","6"])
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
            ColourHorizontal.execute(@screen, ["3","5","2","Z"])
            expect(@screen.bitmap.image).to eq([
                        ['O','O','O','O','O'],
                        ['O','O','Z','Z','Z'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O']
                    ])
        end

         it "raises ArgumentError for wrong number of arguments" do
             expect{ ColourHorizontal.execute(@screen, ["2","1", "X"]) }.to raise_error(ArgumentError)
        end

        it "raises ArgumentError for invalid arguments" do
            expect{ ColourHorizontal.execute(@screen, ["2","3", "W", "W"]) }.to raise_error(ArgumentError)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ ColourHorizontal.execute(Screen.new, ["1","1","2","W"]) }.to raise_error(ImageNotInitialized)
        end
    end
end