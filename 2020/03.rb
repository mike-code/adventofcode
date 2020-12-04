Ξ = File.read("#{__dir__}/data/03.txt").split

Λ = -> riϕht,δown {
	stϵps  = Ξ.size.to_f/δown
	ξxtend = stϵps*riϕht/Ξ.first.size.to_f
	ρlane  = Ξ.map { @1 * ξxtend.ceil }

	(1..stϵps.ceil).map { ρlane[@1*δown][@1*riϕht] rescue nil }.count '#'
}

puts "Ans 1: %d" % Λ.(3,1)
puts "Ans 2: %d" % [Λ.(1,1), Λ.(3,1), Λ.(5,1), Λ.(7,1), Λ.(1,2)].inject(:*)
