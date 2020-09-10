require 'open-uri'
require 'nokogiri'
require 'pry'

module BigLeagues
    module ClassMethods
        def reset_all
            self.all.clear
        end
    
        def count
            self.all.count
        end

        def find_by_name(name)
            self.all.detect{|a| a.name == name}
        end
    end

    module InstanceMethods
        def initialize(hash)
            hash.each{|key, value| self.send(("#{key}="), value)}
            self.class.all << self
        end       
    end

end