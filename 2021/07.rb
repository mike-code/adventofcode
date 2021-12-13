F = File.read("#{__dir__}/data/07.txt").scan(/\d+/).map(&:to_i)

Δ = (1..F.max).map { |α| F.map { |β| (α - β).abs } }

puts "Ans 1: %d" % Δ.map(&:sum).min
puts "Ans 2: %d" % Δ.map { |α| α.map { _1*(_1+1)/2 }.sum }.min
