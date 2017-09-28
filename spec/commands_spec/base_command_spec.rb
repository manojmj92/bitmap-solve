require_relative '../spec_helper'

describe BaseCommand do
    describe "#self.execute" do
        it "raises ImageNotInitialized if bitmap is empty" do
            expect{ BaseCommand.execute(Screen.new, []) }.to raise_error(ImageNotInitialized)
        end
    end
end