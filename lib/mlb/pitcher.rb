class Mlb::Pitcher 

	attr_accessor :name, :team, :era, :url

	def self.today 
		self.scrape_pitchers
	end 

	def self.scrape_pitchers 
		pitchers = [] 
		
		#goto mlb, find pitchers for a current day 
		#extract the properties 
		#instantiate all picthers from current day 
		#doc = Nokogiri::HTML(open("https://www.mlb.com/scores/2017-07-06", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		#binding.pry 

		doc.css(".game_summary").each do |game|
 	winner = game.css(".winner td[1]").text.green
 	loser = game.css(".loser td[1]").text.red
 	score_w = game.css(".winner td[2]").text.cyan
	score_l = game.css(".loser td[2]").text.cyan
	pitcher_w = game.css("table:nth-child(2) tr:nth-child(1) td:nth-child(2)").text.light_green
	pitcher_l = game.css("table:nth-child(2) tr:nth-child(2) td:nth-child(2)").text.light_red
	save = game.css("table:nth-child(2) tr:nth-child(3) td:nth-child(2)").text.yellow
	if save != "" 
		save = save + (" S").yellow 
	end 

	
end 
	end 


end 