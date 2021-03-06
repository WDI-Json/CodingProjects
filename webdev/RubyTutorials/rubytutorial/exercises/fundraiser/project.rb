class Project

  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target_funding_amount, funding=0)
    @name = name
    @target = target_funding_amount
    @funding = funding
    @received_pledges = Hash.new(0)
  end
  
  def to_s
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target}." 
  end

  def remove_funds
    @funding -= 15
    puts "#{@name} lost some funds!"
  end
  
  def add_funds
    @funding += 25
    puts "#{@name} got more funds!"
  end
  
  def total_funding_outstanding
    @target - @funding
  end
  
  def fully_funded?
    total_funding_outstanding <= 0
  end

  def received_pledge(pledge)
    @received_pledge[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@received_pledge}"
  end
  
  def pledges
    @received_pledge.values.reduce(0, :+)
  end
  
  def total_funds
    @funding + pledges
  end
  
end

if __FILE__ == $0
  project = Project.new("Project ABC", 5000, 1000)
  puts project.name
  puts project.funding
  project.remove_funds
  puts project.funding
  project.add_funds
  puts project.funding
end