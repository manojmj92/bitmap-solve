require 'spec_helper'

describe BitmapEditor do
    describe "#execute" do
        before do
            @bitmap_editor = BitmapEditor.new
        end
        it "raises FileError is file is nil or not valid" do
            expect{@bitmap_editor.run(nil)}.to raise_error(FileError)
            expect{@bitmap_editor.run('/lib/non_existent_file.txt')}.to raise_error(FileError)
        end
        it "opens the file and executes commands" do
            expect{@bitmap_editor.run('spec/show_spec.txt')}.to output("OO\nOO\n").to_stdout
        end
    end
end