

class Mlb::Scraper

	@@doc = Nokogiri::HTML(open("http://www.baseball-reference.com/boxes/"))


	def self.scrape_games
		#games = [] 

		the_game = nil 
		
		@@doc.css(".game_summary").each do |game|
			the_game = Mlb::Game.new 
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
			Mlb::Game.all << the_game 
		end 
	end 


end 