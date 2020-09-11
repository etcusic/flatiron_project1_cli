require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'league_module.rb'
require_relative 'team.rb'
require_relative 'player.rb'

class League
    extend BigLeagues::ClassMethods
    include BigLeagues::InstanceMethods

    @@all = []
    attr_accessor :name, :url, :teams, :conferences, :divisions

    def initialize(hash)  
        super
        @teams = []
        self.assign_teams
        self.sort_teams_alphabetically_by_conference
    end

    def self.all
        @@all
    end

    def assign_teams
        Nokogiri::HTML(open(@url)).css("ul.d3-o-footer__panel-links").each do |tag|
            tag.css('li a').each do |a|
                if a.attribute('data-link_type').value == '_all-teams'
                    hash = {}
                    hash[:name] = a.attribute('data-link_name').value
                    hash[:division] = tag.text.strip
                    hash[:conference] = tag.text.strip.split(' ')[0]
                    hash[:url] = a.attribute('href').value + "team/players-roster/"
                    self.initialize_team(hash)
                end
            end
        end
    end
    
    def initialize_team(hash)
        hash[:league] = self
        new_team = Team.new(hash)
        @teams << new_team
    end 

    def sort_teams_alphabetically_by_conference
        conf_one = @teams.select{|team| team.conference == self.conferences[0]}
        conf_two = @teams.select{|team| team.conference == self.conferences[1]}
        @teams = [conf_one.sort_by{|team| team.name}, conf_two.sort_by{|team| team.name}].flatten!
    end

    def conferences
        @conferences = self.teams.map{|team| team.conference} .uniq
    end

    def divisions
        @divisions = self.teams.map{|team| team.division} .uniq
    end 

end


