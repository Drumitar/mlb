class Mlb::Pitcher 

	attr_accessor :name, :team, :era, :url

	def self.today 
		#puts <<~'DOC'
			#1. Jesse Hanh
			#2. Sonny Gray
		#DOC

		pitcher_1 = self.new 
		pitcher_1.name = "Jesse Hanh"
		pitcher_1.team = "Oakland Athletics"
		pitcher_1.era  = "2.04"
		pitcher_1.url = "mlb.com/players/jessehann"

		pitcher_2 = self.new 
		pitcher_2.name = "Yu Darvish"
		pitcher_2.team = "Texas Rangers"
		pitcher_2.era  = "3.04"
		pitcher_2.url = "mlb.com/players/yudarvish"

		[pitcher_1, pitcher_2]
	end 

	def self.scrape_pitchers 
		pitchers = [] 
		#goto mlb, find pitchers for a current day 
		#extract the properties 
		#instantiate all picthers from current day 
		doc = Nokogiri::HTML(open("https://www.mlb.com/scores/2017-07-06", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		binding.pry 



		pitchers 

	end 

end 