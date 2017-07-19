
#our Cli Controller 
class Mlb::CLI 

	def call 
		puts "Today's final scores."
		list_games
		menu 
	end 

	def list_games
		@games = Mlb::Game.scrape_games
		@games.each.with_index(1) do |game, i|
			puts "#{i}) #{game.winner}:#{game.score_w} #{game.loser}:#{game.score_l}"
		end 

	end 

	def menu 
		puts "\nSelect 1 2 3 or exit to leave\n"
		puts "\n 1 - show more info on games"
		puts "\n 2 - show standings"
		puts "\n 3 - show biggest run differential"
		input = gets.strip
		if input.to_i == 1 
			puts "enter a game number 1 - #{@games.count} to see more info"
			input = gets.strip.to_i-1
			print_more_info(input)
			puts "\nWould you like to continue Y or N ? \n"
			  input = gets.strip.downcase
		    if input == "y"
		    	menu 
		    elsif input == 'n'
		    	goodbye
		    else
		      puts "\nPlease enter Y or N only"
		      menu 
		    end 
		elsif input.to_i == 2 
			Mlb::Game.scrape_standings
			menu 
		elsif input.to_i == 3 
			#Mlb::Game.find_lopside_score
			Mlb::Game.find_big_win
			menu 
		elsif input.downcase == "exit"
			goodbye	
		else 
			menu 
	    end	     	
	end 

	def print_more_info(input)
		puts "winning pitcher".green + ": #{@games[input].pitcher_w}".cyan + " losing pitcher".red + ": #{@games[input].pitcher_l}".cyan + " #{@games[input].save}" 
	end 

	def goodbye
		puts "Thankyou! Have a great day!".yellow 
		exit 
	end 

end 