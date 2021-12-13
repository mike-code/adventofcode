F = File.read("#{__dir__}/data/09.txt").scan(/\d+/).map { _1.each_char.map(&:to_i) }
V = []

Δ = -> α { [*[9, *α, 9].each_cons(3)] }

Π = [F.map(&Δ), F.transpose.map(&Δ).transpose].map { _1.flatten 1 }.inject(&:zip)
Λ = Π.select { |α,β| [α[0], α[2], β[0], β[2]].all? { α[1] < _1 } }

Ξ = -> ω { Enumerator.new { |γ|
	unless V.include?(ω)
		V << ω
		(α,β) = Π[ω]

		γ << [*Ξ.(ω-1)] if (α[0] > α[1] and α[0] < 9)
		γ << [*Ξ.(ω+1)] if (α[2] > α[1] and α[2] < 9)
		γ << [*Ξ.(ω-F.first.size)] if (β[0] > β[1] and β[0] < 9)
		γ << [*Ξ.(ω+F.first.size)] if (β[2] > β[1] and β[2] < 9)
		γ << '✓'
	end
}}

puts "Ans 1: %d" % Λ.map { _1[0][1]+1 }.sum
puts "Ans 2: %d" % Λ.map { Ξ.(Π.index(_1)).to_a.flatten.size }.sort.last(3).inject(:*)
