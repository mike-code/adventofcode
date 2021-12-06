F = *File.read("#{__dir__}/data/05.txt").scan(/\d+/)
         .map(&:to_i).each_slice(2).each_slice(2)

Δ = F.map { |f| f.transpose.map { |α|
	# Ruby can't into reverse range...
	γ = *(α.min..α.max)
	α.last < α.first ? γ.reverse : γ
}}

Π = -> α { (α.flatten(1).tally.values-[1]).size }

A = Δ.select { |x| x.any? { |w| w.size == 1 } }.map { |y| y.inject(&:product) }
B = Δ.select { |x| x.map(&:size).inject(:-) == 0 }.map(&:transpose)

puts "Ans 1: %d" % Π.(A)
puts "Ans 2: %d" % Π.(A+B)
