Ξ = File.read("#{__dir__}/data/01.txt").split.map(&:to_i)

Λ = -> δ { δ.each_cons(2).map { |x| x.inject(:-) < 0 }.count true }

puts "Ans 1: %d" % Λ.(Ξ)
puts "Ans 2: %d" % Λ.(Ξ.each_cons(3).map { |x| x.inject(:+) })
