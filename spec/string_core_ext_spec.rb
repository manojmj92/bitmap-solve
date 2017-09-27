describe String do
    describe "#integer?" do
        it "returns true if a string can be converted to integer" do
            expect("123".integer?).to eq(true)
        end
        it "returns false if a string can't be converted to integer" do
            expect("abc".integer?).to eq(false)
        end
    end
end