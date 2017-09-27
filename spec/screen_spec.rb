require 'spec_helper'


describe Screen do
    before do
        @screen = Screen.new
    end
    describe "#new" do
        it 'creates a new screen with empty bitmap' do
            expect(@screen.bitmap).to eq(nil)
        end
    end
    describe "#execute" do
        it 'it creates new bitmap when command is Create' do
            expect{@screen.execute(OpenStruct.new(klass: Create, args: ["5","6"]))}.to change{@screen.bitmap}.from(nil).to(Bitmap)
        end
    end
end