class Flyer
    attr_reader :name, :email, :miles_flown
    attr_accessor :status
  
    def initialize(name, email, miles_flown, status=:bronze)
      @name = name
      @email = email
      @miles_flown = miles_flown
      @status = status
    end
  
    def to_s
      "#{name} (#{email}): #{miles_flown} - #{status}"
    end
  end
  
  flyers = []
  flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
  flyers << Flyer.new("Moe", "moe@example.com", 1000)
  flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
  flyers << Flyer.new("Shemp", "shemp@example.com", 2000)
  
# puts flyers
# frequent_flyers= flyers.select {|f| f.miles_flown >= 3000}
# # puts frequent_flyers
# less_frequent_flyers= flyers.reject {|f| f.miles_flown >= 3000}
# # puts less_frequent_flyers
# platinum_flyers = flyers.any? {|f| f.status == :platinum}
# # puts platinum_flyers
# first_call = flyers.detect {|f| f.status == :bronze}
# puts first_call

plat_flyers, others = flyers.partition {|f| f.status == :platinum}

plat_flyers.each do |pf|
    puts "#{pf.name} (#{pf.status.upcase})" 
end

others.each do |o|
    puts "#{o.name} (#{o.status.upcase})" 
end

# name_tags = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})"}
# # p name_tags
# # Lufthansa is graphing their flyer data and has requested an array containing distances 
# # flown by each flyer, expressed in kilometers rather than miles. 
# # Make the array and print it out! (To convert miles to kilometers, multiply miles by 1.6.) 
# Lufthansa = flyers.map {|flyer| flyer.miles_flown * 1.6}.reduce(0,:+)
# puts Lufthansa

# Lufthansa has commissioned a bonus requirement for you: Tally up all the kilometers flown by bronze flyers. 
# Chain together several Enumerable methods to compute the total. 

Lufthansa_bonus= flyers.select {|f| f.status == :bronze}.map {|f| f.miles_flown * 1.6}.reduce(0,:+)
# puts Lufthansa_bonus

# The airline would also like to reward the flyer who has flown the most miles. 
# The Enumerable module offers a convenient method for finding an object that has the maximum value returned 
# from the given block: the max_by method. Use it to find the top flyer. 
Lufthansa_bonus_2 = flyers.max_by {|f| f.miles_flown * 1.6}
puts Lufthansa_bonus_2