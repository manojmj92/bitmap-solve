require_relative '../spec_helper'

describe Command::Clear do
    describe "#self.execute" do

        before do
            @screen = Screen.new
            Command::Create.execute(@screen, ["2","2"])
            Command::SetPixel.execute(@screen, ["1","1","A"])
        end

        it "clears the bitmap to original version" do
            expect(@screen.bitmap.image).to eq([
                                                ['A','O'],
                                                ['O','O']
                                                ])
            Command::Clear.execute(@screen, [])
            expect(@screen.bitmap.image).to eq([
                                                ['O','O'],
                                                ['O','O']
                                                ])
        end

        it "raises InvalidArgument for wrong number of arguments" do
            expect{ Command::Clear.execute(@screen, ["X"]) }.to raise_error(InvalidArgument)
        end

        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Command::Clear.execute(Screen.new, []) }.to raise_error(ImageNotInitialized)
        end

    end
end