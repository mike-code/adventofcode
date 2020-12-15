Ξ = File.read("#{__dir__}/data/15.txt").chomp.split(',').map(&:to_i)

Ω = -> max {
	visited = Ξ.map.with_index.first(Ξ.size-1).to_h

	(Ξ.size-1..max-2).each_with_object(Ξ) { |idx|
		num = idx - (visited[Ξ[idx]] || idx)
		Ξ << num
		visited[Ξ[idx]] = idx
	}.last
}

puts "Ans 1: %d" % Ω.(2020)
puts "Ans 2: %d" % Ω.(30000000)
