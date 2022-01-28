require_relative 'player'
require_relative 'die'
require_relative 'GameTurn'
require_relative 'treasure_trove'
require_relative 'clumsy_player'
require_relative 'berserk_player'

module StudioGame
    class Game
        attr_reader :title

        def initialize(title)
            @title = title
            @playerlist = []
        end

        def add_player(player)
            @playerlist. << player
        end

        def load_player(from_file)
            File.readlines(from_file).each do |line| 
                add_player(Player.from_csv(line))
            end
        end
        
        def play(rounds)
            puts "There are #{@playerlist.size} players in #{@title}"
            print_players_in_game(@playerlist)

            1.upto(rounds) do |round|
                if block_given?
                    break if yield
                end

                puts "\nRound #{round}:"
                @playerlist.each do |player|
                    GameTurn.take_turn(player)
                end
            end
            treasure_stats()
        end

        def treasure_stats()
            treasures = TreasureTrove::TREASURES
            puts "There are #{treasures.length} treasures to be found:"
            
            treasures.each do |treasure|
                puts "A #{treasure.name} is worth #{treasure.points} points"
            end
        end

        def print_stats
            puts "\n#{@title} Statistics:"
            strong_players, wimpy_players = @playerlist.partition {|player| player.strong?}  
            
            puts "\n#{strong_players.size} are strong players"

            strong_players.each do |player|
                puts print_name_and_health(player)
            end

            puts "\n#{wimpy_players.size} are weak players"

            wimpy_players.each do |player|
                puts print_name_and_health(player)
            end
            
            puts "\n#{@title} Highscores:"

            @playerlist.each do |player|
                puts "\n#{player.name}'s point totals:"
                player.each_found_treasure do |treasure|
                    puts "#{treasure.points} total #{treasure.name} points"
                end
                puts "#{player.points} grand total points"
            end

            @playerlist.sort.each do |player|
                high_score_entry(player)
            end
            puts "#{total_points} total points from treasures found" 
        end

        def high_score_entry(player)
            formatted_name = player.name.ljust(20, '.')
            "#{formatted_name}#{player.score}"
        end 

        def save_high_scores(to_file="high_scores.txt")
            File.open(to_file, "w") do |file|
                file.puts "#{@title} High Scores:"
                @playerlist.sort.each do |player|
                    file.puts(high_score_entry(player))
                end
            end
        end
        
        def print_name_and_health(player)
            "#{player.name} (#{player.health})"
        end

        def print_players_in_game(playerlist)
            @playerlist.each do |player|
                puts player
            end
        end

        def total_points
            @playerlist.reduce(0) { |sum, player| sum + player.points }
        end
        
    end
end

if __FILE__ == $0

    player4 = Player.new("Alvin", 100)
    player5 = Player.new("Simon", 60)
    player6 = Player.new("Theo", 125)

    chipmunks = Game.new("Chipmunks")
    chipmunks.add_player(player4)
    chipmunks.add_player(player5)
    chipmunks.add_player(player6)
    chipmunks.play(3)
    chipmunks.print_stats
end