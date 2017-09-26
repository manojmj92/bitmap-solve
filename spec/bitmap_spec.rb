require 'spec_helper'

describe Bitmap do
    it 'creates a new empty bitmap' do
        @bitmap = Bitmap.new(2,2)
        expect(@bitmap.image).to eq([['O','O'], ['O','O']])
    end

    context "for every bitmap" do
        before do
            @bitmap = Bitmap.new(2,3)
        end

        describe "#print" do
            it "prints the bitmap" do
                expect(@bitmap.print).to eq("OOO\nOOO\n")
            end
        end

        describe "#clear" do
            it "clears the bitmap" do
                @bitmap.clear
                expect(@bitmap.print).to eq("OOO\nOOO\n")
            end
        end
    end
end
