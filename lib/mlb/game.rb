require 'colorize'

class Mlb::Game

	attr_accessor :winner, :loser, :score_w, :score_l, :pitcher_w, :pitcher_l, :save

	def self.today 
		self.scrape_pitchers
	end 

	def self.scrape_pitchers 
		games = [] 
		
		#goto mlb, find pitchers for a current day 
		#extract the properties 
		#instantiate all picthers from current day 
		#doc = Nokogiri::HTML(open("https://www.mlb.com/scores/2017-07-06", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		#binding.pry 
		doc = Nokogiri::HTML(open("http://www.baseball-reference.com/boxes/"))
		the_game = nil 
		
		
		doc.css(".game_summary").each do |game|
			the_game = self.new 
		 	the_game.winner = game.css(".winner td[1]").text.green
		 	the_game.loser = game.css(".loser td[1]").text.red
		 	the_game.score_w = game.css(".winner td[2]").text.cyan
			the_game.score_l = game.css(".loser td[2]").text.cyan
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


	end 