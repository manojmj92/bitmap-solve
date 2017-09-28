class String

    def integer?
        (self =~ /\A\d+\z/) ? true : false
    end

    def colour?
        return false if self.size > 1
        ('A'..'Z').include? self
    end

end