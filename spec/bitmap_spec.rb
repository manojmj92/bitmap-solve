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

        describe "#set_pixel_colour" do
            it "sets specified colour at given coordinates" do
                @bitmap.set_pixel_colour(1, 1, 'M')
                @bitmap.set_pixel_colour(2, 2, 'N')
                expect(@bitmap.print).to eq("MOO\nONO\n")
            end
        end

        describe "#clear" do
            it "clears the bitmap" do
                @bitmap.set_pixel_colour(1, 1, 'M')
                expect(@bitmap.print).to eq("MOO\nOOO\n")
                @bitmap.clear
                expect(@bitmap.print).to eq("OOO\nOOO\n")
            end
        end

    end
end
