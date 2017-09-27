require 'spec_helper'

describe Bitmap do
    it 'creates a new empty bitmap' do
        @bitmap = Bitmap.new(2, 2)
        expect(@bitmap.image).to eq([['O','O'], ['O','O']])
    end

    context "for every bitmap" do
        before do
            @bitmap = Bitmap.new(5,6)
        end

        describe "#print" do
            it "prints the bitmap" do
                expect(@bitmap.print).to eq("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n")
            end
        end

        describe "#set_pixel_colour" do
            it "sets specified colour at given coordinates" do
                @bitmap.set_pixel_colour(1, 3, 'A')
                expect(@bitmap.print).to eq("OOOOO\nOOOOO\nAOOOO\nOOOOO\nOOOOO\nOOOOO\n")
            end
        end

        describe "#clear" do
            it "clears the bitmap" do
                @bitmap.set_pixel_colour(1, 3, 'A')
                expect(@bitmap.print).to eq("OOOOO\nOOOOO\nAOOOO\nOOOOO\nOOOOO\nOOOOO\n")
                @bitmap.clear
                expect(@bitmap.print).to eq("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n")
            end
        end

        describe "#colour horizontal" do
            it "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)." do
                @bitmap.colour_horizontal(2, 3, 5, 'Z')
                expect(@bitmap.print).to eq("OOOOO\nOOZZZ\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n")
            end
        end

        describe "#colour vertical" do
            it "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)." do
                @bitmap.colour_vertical(2, 3, 6, 'W')
                expect(@bitmap.print).to eq("OOOOO\nOOOOO\nOWOOO\nOWOOO\nOWOOO\nOWOOO\n")
            end
        end
    end
end
