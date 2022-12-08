F = File.read("#{__dir__}/data/03.txt").split.map { [*_1.chars.each_slice(_1.size/2)] }

Ξ = ([*('a'..'z')]+[*('A'..'Z')]).zip(1..52).to_h

puts "Ans 1: %d" % F.map { |α| Ξ[α.map(&:uniq).join.chars.tally.select{ _2 > 1}.first.first] }.sum
puts "Ans 2: %d" % F.each_slice(3).map { |α| Ξ[α.map { |β| β.join.chars.uniq }.join.chars.tally.select{ _2 == 3 }.first.first] }.sum
