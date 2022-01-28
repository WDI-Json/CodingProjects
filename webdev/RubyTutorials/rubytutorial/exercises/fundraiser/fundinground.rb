require_relative 'project'
require_relative 'die'
require_relative 'pledgepool'

module FundingRound
  
  def self.one_round(project)
    die = Die.new
    number_rolled = die.roll
    if number_rolled.odd?
      project.remove_funds
    else
      project.add_funds
    end
    
    pledge = Pledgepool.random
    puts "#{project.name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    project.received_pledge(pledge)
  end
  
end
