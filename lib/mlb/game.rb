require 'colorize'

class Mlb::Game

	attr_accessor :winner, :loser, :score_w, :score_l, :pitcher_w, :pitcher_l, :save

	@doc = Nokogiri::HTML(open("http://www.baseball-reference.com/boxes/"))

	def self.scrape_games
		games = [] 

		the_game = nil 
		
		@doc.css(".game_summary").each do |game|
			the_game = self.new 
		 	the_game.winner = game.css(".winner td[1]").text.green
		 	the_game.loser = game.css(".loser td[1]").text.red
		 	the_game.score_w = game.css(".winner td[2]").text
			the_game.score_l = game.css(".loser td[2]").text
			the_game.pitcher_w = game.css("table:nth-child(2) tr:nth-child(1) td:nth-child(2)").text.light_green
			the_game.pitcher_l = game.css("table:nth-child(2) tr:nth-child(2) td:nth-child(2)").text.light_red
			the_game.save = game.css("table:nth-child(2) tr:nth-child(3) td:nth-child(2)").text.yellow
			if the_game.save != "" 
				the_game.save = the_game.save + (" S").yellow 
			end
			games << the_game 
		end 
		games 
	end 

	def self.scrape_standings
		puts "\n AL STANDINGS"
		puts "\n TM  W  L  WIN%  GB"
		@doc.css("#standings-upto-AL-overall tr").each do |row|
		 	title = row.css("tr:nth-child(1)").text
		 	team = row.css("th a").text
		 	wins = row.css("td:nth-child(2)").text.green 
		 	losses = row.css("td:nth-child(3)").text.red
		 	win_percentage = row.css("td:nth-child(4)").text.cyan
		 	games_back = row.css("td:nth-child(5)").text.yellow 
	 	puts " #{team} #{wins} #{losses} #{win_percentage} #{games_back}"
		end 

		puts "\n NL STANDINGS"
		puts "\n TM  W  L  WIN%  GB"
		@doc.css("#standings-upto-NL-overall tr").each do |row|
		 	team = row.css("th a").text
		 	wins = row.css("td:nth-child(2)").text.green 
		 	losses = row.css("td:nth-child(3)").text.red
		 	win_percentage = row.css("td:nth-child(4)").text.cyan
		 	games_back = row.css("td:nth-child(5)").text.yellow 
		 	puts " #{team} #{wins} #{losses} #{win_percentage} #{games_back}"
		 end 
	end 


	def self.find_lopside_score
		scores  = [] 
		games = self.scrape_games 
		games.each do | game | 
		 	scores << (game.score_w.to_i - game.score_l.to_i)
		end 
		puts "the biggest margin of victory today was #{scores.max} runs!".green 	
	end


	end 