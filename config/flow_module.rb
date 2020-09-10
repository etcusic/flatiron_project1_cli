module FlowModule

    def first_move(input)
        case input
        when "1"
            self.all_teams
        when "2"
            self.simulation_options
        when "3"
            line
            puts "No hablo español. Press enter to try again."
            gets.strip
            self.page_one
        when "4"
            self.exit
        else
            self.invalid_input
            self.page_one
        end
    end
    
    def all_teams
        self.show_teams_by_conference
        input = gets.strip
        if (1..32).include? input.to_i 
            self.get_team(input) 
        else
            self.invalid_input
            self.first_move('1')
        end
    end

    def get_team(input)
        team = @league.teams[input.to_i - 1]
        line
        puts team.name + ":"
        team_options
        initialize_team(team)
    end

    def initialize_team(team)
        roster = team.initialize_roster
        input = gets.strip
        line
        execute_roster(input, roster)
    end

    def execute_roster(input, roster)
        case input
        when '1'
            roster.sort_by(&:number).each{|player| puts "#{player.display_info}"}
            self.next
        when '2'    
            roster.sort_by(&:number).each{|player| puts "##{player.number} #{player.name}"}
            self.next
        when '3'
            roster.sort_by(&:weight).each{|player| puts "#{player.weight} lbs - #{player.name}"}
            self.next
        when '7'
            self.all_teams
        when '8'
            self.page_one
        when '9'
            self.exit
        else
            self.invalid_input
            self.all_teams
        end
    end

    def next
        puts "Press enter for more options"
        gets.strip
        puts "7. Return to all teams" ; self.final_options
        self.go_to
    end

    def go_to
        input = gets.strip
        case input
        when '7'
            self.all_teams
        when '9'
            self.exit
        else
            self.page_one
        end
    end

    def team_options
        puts "1. Display entire roster"
        puts "2. Look roster by jersey number"
        puts "3. Look at team by weight"
        line
        self.final_options
    end

# Simulation narrative. Need more data to work with.
    def simulation_options
        line ; puts "What simulation would you like to run?"; line
        puts "1. See which team will win the Super Bowl"
        input = gets.strip
        run_simulation(input)
    end

    def sb_winner
        puts "Titans WIN!!!"
        puts "YAY!!!"
    end

    def run_simulation(input)
        if input == '1'
            line ; self.sb_winner ; line
            puts "Press enter to return to beginning"
            gets.strip
            self.page_one
        else
            self.invalid_input
            self.page_one
        end
    end

end
