describe String do
    describe "#integer?" do
        it "returns true if a string can be converted to integer" do
            expect("123".integer?).to eq(true)
        end
        it "returns false if a string can't be converted to integer" do
            expect("abc".integer?).to eq(false)
        end
    end
    describe "#colour?" do
        it "returns true if a single capital letter" do
            expect("A".colour?).to eq(true)
        end
        it "returns false if string is not a capital letter or has more than 1 character" do
            expect("abc".colour?).to eq(false)
            expect("AB".colour?).to eq(false)
            expect("1".colour?).to eq(false)
        end
    end
end