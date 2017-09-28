require_relative '../spec_helper'

describe ColourVertical do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Create.execute(@screen, ["5","6"])
        end

        it "sets the specified colour at the specified column X between coordinates Y1 and Y2 (inclusive)" do
            expect(@screen.bitmap.image).to eq([
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O']
                    ])
            ColourVertical.execute(@screen, ["2","3","6","W"])
            expect(@screen.bitmap.image).to eq([
                        ['O','O','O','O','O'],
                        ['O','O','O','O','O'],
                        ['O','W','O','O','O'],
                        ['O','W','O','O','O'],
                        ['O','W','O','O','O'],
                        ['O','W','O','O','O']
                    ])
        end

         it "raises ArgumentError for wrong number of arguments" do
             expect{ ColourVertical.execute(@screen, ["2","1", "X"]) }.to raise_error(ArgumentError)
        end

        it "raises ArgumentError for invalid arguments" do
            expect{ ColourVertical.execute(@screen, ["2","3", "W", "W"]) }.to raise_error(ArgumentError)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ ColourVertical.execute(Screen.new, ["1","1","2","W"]) }.to raise_error(ImageNotInitialized)
        end
    end
end