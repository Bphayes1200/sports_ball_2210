class Team
    attr_reader :team_name, :city, :roster, :player_count
    def initialize(team_name, city)
        @team_name = team_name
        @city = city
        @roster = []
        @player_count = 0
    end 

    def add_player(player)
        new_player = player
        @roster << new_player
        @player_count += 1
    end  

    def long_term_players
        @roster.find_all do |player|
            player.contract_length > 24
        end 
    end

    def short_term_players 
        @roster.find_all do |player|
            player.contract_length <= 24
        end 
    end 

    def total_value
        @total_value = 0
        @roster.each do |player| 
           @total_value += player.total_cost
        end 
        @total_value
    end    

    def details
        details = {
            "total_value" => @total_value,
            "player_count" => player_count
        }
    end 

    def average_cost_of_player
       average = @total_value / player_count
       
       average_cost = "$#{average}"
    end 

    def players_by_last_name
       last_names = roster.map do |player|
           player.last_name
        end 
            last_names.sort. join(", ")
    
    end 
    

end 