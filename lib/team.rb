require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'league_module.rb'
require_relative 'league.rb'
require_relative 'player.rb'

class Team
    extend BigLeagues::ClassMethods
    include BigLeagues::InstanceMethods

    @@all = []
    attr_accessor :roster, :name, :url, :league, :conference, :division

    # @url = roster_url from team_hash in League class
    def initialize(hash)
        super
        @roster = []
    end

    def self.all
        @@all
    end

    #roster page url is needed, not team's home page
    def initialize_roster 
        Nokogiri::HTML(open(@url)).css("tbody tr").each do |tr|
            hash = {name: "", number: "", unit: "", position: "", height: "", weight: "", age: "", team: self, url: ""}
            array = tr.css("td")[0..5]
            hash[:name] = array[0].css('a').attribute('title').value
            hash[:number] = array[1].text.strip.to_i
            hash[:position] = array[2].text.strip
            hash[:height] = array[3].text.strip
            hash[:weight] = array[4].text.strip.to_i
            hash[:age] = array[5].text.strip.to_i
            hash[:url] = @url + tr.css("a").attribute("href").value.split("/")[-1] + "/"
            new_player = Player.new(hash)
            @roster << new_player
        end
        @roster
    end
    
end

