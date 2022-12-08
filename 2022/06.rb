F = File.read("#{__dir__}/data/06.txt").chars

Ξ = -> ε { F.each_cons(ε).take_while { _1.uniq.size < ε }.size + ε }

puts "Ans 1: %s" % Ξ[4]
puts "Ans 2: %s" % Ξ[14]
