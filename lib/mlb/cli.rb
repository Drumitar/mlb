
#our Cli Controller 

class Mlb::CLI 

	def call 
		puts "Today's pitchers."
		list_pitchers
		menu 
		goodbye
	end 

	def list_pitchers
		@pitchers = Mlb::Pitcher.today 
		@pitchers.each.with_index(1) do |pitcher, i|
			puts "#{i}. #{pitcher.name} - #{pitcher.team} - #{pitcher.era}"
		end 

	end 

	def menu 
		puts "\n find the best pitching match up or type exit to leave \n \n"
		input = ""
		while input != "exit"
			input = gets.strip.downcase
			case input 
			when "1"
				puts @pitchers[0]
			when "2"
				puts "more info on 2nd menu item"
			when "list"
				list_pitchers 
			else 
				puts "not sure what you want, type list or exit!"	
			end 
			
		end 
	end 

	def goodbye
		puts "later"
	end 

end 