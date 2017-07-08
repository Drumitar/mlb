
#our Cli Controller 

class Mlb::CLI 

	def call 
		puts "Today's final scores."
		list_games
		menu 
		goodbye
	end 

	def list_games
		@games = Mlb::Game.today 
		@games.each.with_index(1) do |game, i|
			puts "#{i}. #{game.winner}:#{game.score_w} #{game.loser}:#{game.score_l}"
		end 

	end 

	def menu 
		puts "\n find more information about a game\n \n"
		input = ""
		while input != "exit"
			input = gets.strip.downcase
			case input 
			when "1"
				print_more_info("1")
			when "2"
				print_more_info("2")
			when "list"
				list_games
			else 
				puts ("[[".red + "not sure what you want, please type list or exit".white + "]]".red)			
			end 
		end 
	end 

	def print_more_info(input)
		input = input.to_i-1
		puts "winning pitcher:#{@games[input].pitcher_w} losing pitcher:#{@games[input].pitcher_l} #{@games[input].save}" 
	end 


	def goodbye
		puts "goodbye!".yellow 
	end 

end 