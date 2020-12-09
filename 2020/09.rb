F = File.read("#{__dir__}/data/09.txt").split.map(&:to_i)
Ξ = 25

puts "Ans 1: %d" % err = F.each_cons(Ξ+1).find { |*ϵ,ϕ| ϵ.combination(2).map(&:sum).include?(ϕ).! }.last
puts "Ans 2: %d" % (2..F.find_index(err)).map { |i| [*F.each_cons(i)] }.flatten(1).find { |ϵ| ϵ.sum == err }.minmax.sum
