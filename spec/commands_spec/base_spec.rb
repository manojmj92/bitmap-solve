require_relative '../spec_helper'

describe Command::Base do
    describe "#self.execute" do
        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ Command::Base.execute(Screen.new, []) }.to raise_error(ImageNotInitialized)
        end
    end
end