require_relative '../spec_helper'

describe Clear do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Create.execute(@screen, ["2","2"])
            SetPixel.execute(@screen, ["1","1","A"])
        end

        it "clears the bitmap to original version" do
            expect(@screen.bitmap.image).to eq([
                                                ['A','O'],
                                                ['O','O']
                                                ])
            Clear.execute(@screen, [])
            expect(@screen.bitmap.image).to eq([
                                                ['O','O'],
                                                ['O','O']
                                                ])
        end

        it "raises ArgumentError for wrong number of arguments" do
            expect{ Clear.execute(@screen, ["X"]) }.to raise_error(ArgumentError)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Clear.execute(Screen.new, []) }.to raise_error(ImageNotInitialized)
        end

    end
end