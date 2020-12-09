F = File.read("#{__dir__}/data/09.txt").split.map(&:to_i)
Ξ = 25

puts "Ans 1: %d" % err = F.each_cons(Ξ+1).reject { |a| a[0..Ξ-1].combination(2).map { |i| i.sum }.include?(a[Ξ]) }.first.last
puts "Ans 2: %d" % (2..F.find_index(err)).map { |i| [*F.each_cons(i)] }.flatten(1).select { |a| a.sum == err }.first.minmax.sum
