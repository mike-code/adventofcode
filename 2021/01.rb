F = File.read("#{__dir__}/data/01.txt").split.map &:to_i

Ξ = -> δ { δ.each_cons(2).select { _1.inject(:-) < 0 }.size }

puts "Ans 1: %d" % Ξ.(F)
puts "Ans 2: %d" % Ξ.(F.each_cons(3).map { _1.inject(:+) })
