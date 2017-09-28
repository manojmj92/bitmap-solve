class String

    def integer?
        (self =~ /\A\d+\z/) ? true : false
    end

end