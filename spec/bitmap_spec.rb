require 'spec_helper'

describe Bitmap do

    before do
        @bitmap = Bitmap.new(5,6)
    end

    describe "#new" do
        it 'creates a new  bitmap with empty image' do
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
        end
    end

    describe "#print" do
        it "prints the bitmap" do
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
        end
    end

    describe "#set_pixel_colour" do
        it "sets specified colour at given coordinates" do
            @bitmap.set_pixel_colour(1, 3, 'A')
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['A','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
        end
        it "raises OutOfBounds if coordinates are out of the area of bitmap" do
            expect {@bitmap.set_pixel_colour(1, 7, 'A')}.to raise_error(OutOfBounds)
        end
    end

    describe "#clear" do
        it "clears the bitmap" do
            @bitmap.set_pixel_colour(1, 3, 'A')
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['A','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
            @bitmap.clear
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
        end
    end

    describe "#colour horizontal" do
        it "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)." do
            @bitmap.colour_horizontal(3, 5, 2, 'Z')
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','Z','Z','Z'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O']

                                        ])
        end
    end

    describe "#colour vertical" do
        it "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)." do
            @bitmap.colour_vertical(2, 3, 6, 'W')
            expect(@bitmap.image).to eq([
                                            ['O','O','O','O','O'],
                                            ['O','O','O','O','O'],
                                            ['O','W','O','O','O'],
                                            ['O','W','O','O','O'],
                                            ['O','W','O','O','O'],
                                            ['O','W','O','O','O']

                                        ])
        end
    end
end
