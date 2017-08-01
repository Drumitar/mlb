require 'colorize'

class Mlb::Game

	attr_accessor :winner, :loser, :score_w, :score_l, :pitcher_w, :pitcher_l, :save

	@@doc = Nokogiri::HTML(open("http://www.baseball-reference.com/boxes/"))

	@@games = [] 

	def self.all 
		@@games 
	end 

	def self.scrape_standings
		puts "\n AL STANDINGS"
		puts "\n TM  W  L  WIN%  GB"
		@@doc.css("#standings-upto-AL-overall tr").each do |row|
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
		@@doc.css("#standings-upto-NL-overall tr").each do |row|
		 	team = row.css("th a").text
		 	wins = row.css("td:nth-child(2)").text.green 
		 	losses = row.css("td:nth-child(3)").text.red
		 	win_percentage = row.css("td:nth-child(4)").text.cyan
		 	games_back = row.css("td:nth-child(5)").text.yellow 
		 	puts " #{team} #{wins} #{losses} #{win_percentage} #{games_back}"
		 end 
	end 

	def difference 
		self.score_w.to_i  - self.score_l.to_i 
	end 

	def self.find_big_win
		self.all.sort { |a, b| b.difference <=> a.difference}.first  
	end

end