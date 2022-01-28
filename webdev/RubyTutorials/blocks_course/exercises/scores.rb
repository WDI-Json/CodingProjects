scores = [83, 71, 92, 64, 98, 87, 75, 69]

doubled = scores.map {|score| score * 2}
results = scores.reduce(0,:+)

evens, odd = scores.partition {|s| s.even?}
puts evens 
puts "-----"
puts odd