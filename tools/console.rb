require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

chuckecheese = Startup.new("chuckecheese", "Chuck", "Cheese")
flatiron = Startup.new("flatiron", "Avi", "Nerds")
apple = Startup.new("apple", "Steve", "Computers")
howie = VentureCapitalist.new("howie", 4000000000)
bill = VentureCapitalist.new("bill", 200)
guy = VentureCapitalist.new("guy", 666666666666666)
round1 = FundingRound.new("Angel", 35000000, chuckecheese, guy)
round2 = FundingRound.new("Pre-Seed", 20, apple, bill)
round3 = FundingRound.new("Seed", 50000000000, flatiron, bill)
round4 = FundingRound.new("Round A", 5000,chuckecheese,guy)
round5 = FundingRound.new("Round B", 2000,chuckecheese,bill)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
