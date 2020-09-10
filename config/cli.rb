require 'bundler'
Bundler.require
require_all 'lib'
require_relative 'flow_module.rb'


class Interaction
    include FlowModule
    attr_accessor :league
    
    def initialize(league)
        @league = league
        self.greeting
        gets.strip
        self.page_one
    end

    def page_one
        self.initial_options
        input = gets.strip
        self.first_move(input)
    end

    def greeting
        self.line
        puts "Greetings, humanoid being."
        puts "Would you like some information about the footballs?"
        puts "Press 'enter' for some options."
    end

    def initial_options
        line
        puts "1. Inspect a team." 
        puts "2. Run a simulation."
        puts "3. Para español..."
        puts "4. Exit and leave me alone. (chef's choice)"
        line
        puts "-- type 1, 2, 3, or 4 and press enter --"
    end
    
    def line
        puts " "
    end

    def invalid_input
        line
        puts "Sorry, I could not understand that."
        puts "Press 'enter' to try again."
        gets.strip
    end

    def final_options
        puts "8. Return to the beginning of the application"
        puts "9. Exit application"
    end

    def exit
        line
        puts "Goodbye!"
        return 
    end

    def show_teams_by_conference 
        i = 0
        array = @league.teams.map.with_index{|team,i| "#{i+1}. #{team.name}"}
        half = array.length / 2
        conf = @league.conferences
        line
        puts "       (#{conf[0]})            |         (#{conf[1]})         "
        while i < half
            x = 24 - array[i].length
            spaces = Array.new(x, " ").join('')
            puts "#{array[i] + spaces}| #{array[i+half]}"
            i+=1
        end
        line
        puts "Which team would you like to see?"
        puts "(press 1 - 32 to indicate team)"
    end
end
 