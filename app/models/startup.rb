require 'pry'
class Startup

  @@all = []
  attr_reader :name, :founder, :domain

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(name)
    self.all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type_of_investment, amount_invested)
    new_funding_round = FundingRound.new(type_of_investment, amount_invested, self, venture_capitalist)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    n = 0
    self.funding_rounds.each do |funding_round|
      n += funding_round.investment
    end
    n
  end
    #    funding_rounds.inject(0) {|sum, n| binding.pry sum + n.investment}

  def investors
    self.funding_rounds.map do |funding_round|
      funding_round.venture_capitalist
    end.uniq
  end

  def big_investors
    self.investors.select do |investor|
      VentureCapitalist.tres_commas_club.include?(investor)
    end
  end
end
