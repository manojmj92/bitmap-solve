=begin
    String
    Class is extended to include helper functions
=end

class String
    #checks whether string can be converted to integer
    def integer?
        (self =~ /\A\d+\z/) ? true : false
    end
    #checks if string is a colour(upper case alphabets only)
    def colour?
        self.size == 1 && ('A'..'Z').include?(self)
    end

end