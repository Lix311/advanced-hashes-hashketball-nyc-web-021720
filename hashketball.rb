require 'pry'

def game_hash 
  hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => 
        [{:player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1 },
          
          {:player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7 },
          
          {:player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15 },
          
          {:player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26, 
          :rebounds => 11, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5 },
          
          {:player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1 }]},
    
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"],
      :players => 
        [{:player_name => "Jeff Adrien",
          :number => 4, 
          :shoe => 18,
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2},
          
          {:player_name => "Bismack Biyombo",
          :number => 0, 
          :shoe => 16,
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22, 
          :blocks => 15, 
          :slam_dunks => 10},
          
          {:player_name => "DeSagna Diop",
          :number => 2, 
          :shoe => 14,
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5},
          
          {:player_name => "Ben Gordon",
          :number => 8, 
          :shoe => 15,
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0},
          
          {:player_name => "Kemba Walker",
          :number => 33, 
          :shoe => 15,
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 7, 
          :blocks => 5, 
          :slam_dunks => 12}]}
}
end 

def num_points_scored(name)
  game_hash.each do |place,team|
    team.each do |team_info,player_info| 
      if team_info == :players
        player_info.each do |player|
          if player[:player_name] == name 
            return player[:points]
          end 
        end 
      end 
    end 
  end 
end 

def shoe_size(name)
  game_hash.each do |place,team|
    team.each do |team_info,player_info| 
      if team_info == :players
        player_info.each do |player|
          if player[:player_name] == name 
            return player[:shoe]
          end 
        end 
      end 
    end 
  end 
end 

def team_colors(name)
  game_hash.each do |place,team|
    if team[:team_name] == name 
      return team[:colors]
    end 
  end 
end 

def team_names
  teams = []
  game_hash.each do |place,team|
    teams.push(team[:team_name])
  end 
  return teams  
end 

def player_numbers(name)
jersey_numbers = []
  game_hash.each do |place,team|
    team.each do |team_info,player_info|
      if team[:team_name] == name && team_info == :players 
        player_info.each do |player|
          jersey_numbers.push(player[:number])
        end
      end 
    end
  end 
return jersey_numbers
end 

def player_stats(name)
  game_hash.each do |place,team|
    team.each do |team_info, player_info|
      if team_info == :players 
        player_info.each do |player|
          if player[:player_name] == name 
            player.delete(:player_name)
            return player  
          end 
        end 
      end 
    end 
  end 
end 

def big_shoe_rebounds 
  largest_shoe = {:lplayer => "", :lshoe => 0}
  game_hash.each do |place,team|
    team.each do |team_info, player_info|
      if team_info == :players 
        player_info.each do |player|
          current = shoe_size(player[:player_name])
          
          if current > largest_shoe[:lshoe]
            largest_shoe[:lplayer] = player[:player_name]
            largest_shoe[:lshoe] = current 
          end 
        end     
      end 
    end 
  end 

game_hash.each do |place,team|
    team.each do |team_info,player_info| 
      if team_info == :players
        player_info.each do |player|
          if player[:player_name] == largest_shoe[:lplayer]
            return player[:rebounds]
          end 
        end 
      end 
    end 
  end 
end 

def most_points_scored
  most_scored = {:msplayer => "", :mspoints => 0}
  game_hash.each do |place,team|
    team.each do |team_info, player_info|
      if team_info == :players 
        player_info.each do |player|
          current_player_points = num_points_scored(player[:player_name])
          current_player = player[:player_name]
          if current_player_points > most_scored[:mspoints]
            most_scored[:msplayer] = current_player
            most_scored[:mspoints] = current_player_points
          end 
        end     
      end 
    end 
  end 
return most_scored[:msplayer]
end 

def winning_team 
  home_points = 0 
  away_points = 0 
  game_hash.each do |place,team|
    team.each do |team_info,player_info| 
      if team_info == :players
        player_info.each do |player|
          if place == :home
            home_points += player[:points]
          else 
            away_points += player[:points]
          end 
        end 
      end 
    end 
  end 
  if home_points > away_points
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end 
end   

def player_with_longest_name 
  longest_name = {:player => "",:namelength => 0}
  game_hash.each do |place,team|
    team.each do |team_info, player_info|
      if team_info == :players 
        player_info.each do |player|
          current_player = player[:player_name]
          current_player_len = player[:player_name].length 
            if current_player_len > longest_name[:namelength]
              longest_name[:player] = current_player
              longest_name[:namelength] = current_player_len
            end 
          end     
        end 
      end 
    end 
   return longest_name[:player] 
  end 
 
def long_name_steals_a_ton?
  player_with_long_name = player_with_longest_name()
   player_stats = player_stats(player_with_long_name)
   long_steals = player_stats[:steals] 
   most_steals = {:msplayer => player_with_long_name, :msteals => 0}
  
  game_hash.each do |place,team|
    team.each do |team_info, player_info|
      if team_info == :players 
        player_info.each do |player|
          current_player_steals = player[:steals]
          current_player = player[:player_name]
          if current_player_steals > long_steals
            most_steals[:msplayer] = current_player
            most_steals[:msteals] = current_player_steals
          end 
        end     
      end 
    end 
  end 
most_steals[:msplayer] == player_with_long_name
end 



