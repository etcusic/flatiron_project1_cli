require 'open-uri'
require 'nokogiri'
require 'pry'

class Player
    extend BigLeagues::ClassMethods
    include BigLeagues::InstanceMethods

    @@all = []
    attr_accessor :name, :team, :number, :unit, :position, :height, :weight, :age, :url

    def initialize(hash)
        super
    end

    def self.all
        @@all
    end

    def display_info
        puts "#{@name}, ##{@number}, pos:#{@position}, #{@height}, #{@weight}lbs, age:#{@age}"
    end

    
end