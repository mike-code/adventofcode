Ξ = File.read("#{__dir__}/data/02.txt").lines.map(&:split).map { |d,v|
	v = v.to_i
	case d
	when 'forward'
		[v,0,0]
	when 'up'
		[0,-v,0]
	when 'down'
		[0,v,0]
	end
}

A = -> α,β { [α,β].transpose.map(&:sum) }
B = -> α,β { [α[0] + β[0], α[1] + β[0] * α[2], α[2] + β[1]] }

puts "Ans 1: %d" % Ξ.inject(&A)[0..1].inject(&:*)
puts "Ans 2: %d" % Ξ.inject(&B)[0..1].inject(&:*)
