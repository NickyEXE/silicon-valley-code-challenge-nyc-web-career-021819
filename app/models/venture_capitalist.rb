require "pry"

class VentureCapitalist
  @@all =[]
  attr_accessor :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type_of_investment, amount_invested)
    FundingRound.new(type_of_investment, amount_invested, startup, self)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.sort_by do |round|
      round.investment
    end[-1]
  end

  def startups
    funding_rounds.map do |round|
      round.startup
    end
  end

  def get_startup_by_domain(domain)
    startups.select do |startup|
      startup.domain == domain
    end
  end

  def invested_by_domain(domain)
    funding_rounds.select do |round|
      round.domain == domain
    end
  end

  def invested(domain)
    n = 0
    invested_by_domain(domain).each do |round|
      n += round.investment
    end
    n
  end
end
