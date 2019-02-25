class FundingRound
  @@all = []
  attr_reader :startup, :venture_capitalist, :investment, :type, :domain

  def initialize(type, investment, startup, venture_capitalist)
    @type = type
    @investment = investment.to_f
    @startup = startup
    @domain = startup.domain
    @venture_capitalist = venture_capitalist
    @@all << self
  end

  def self.all
    @@all
  end

end
