F = File.read("#{__dir__}/data/11.txt").split.map(&:chars)

# Can't make up my mind which one I like more
moves = ([*-1..1]*2).permutation(2).uniq-[[0,0]]
moves = [*[*-1..1].repeated_permutation(2)]-[[0,0]]

N1 = {}
N2 = {}

Λ = -> α, β, ϕ {
	moves.map { |a,b|
		c = 0

		loop {
			c += 1
			x = α + c*a
			y = β + c*b
			break nil   if [x,y].min < 0 or F[x].nil? or F[x][y].nil?
			break [x,y] if F[x][y] != ϕ
		}
	}.reject(&:nil?)
}

(0..F.size-1).each { |α| (0..F.first.size-1).each { |β|
	N1[[α, β]] = Λ.(α, β, nil)
	N2[[α, β]] = Λ.(α, β, '.')
}}

Ω = -> ξ, ω, π, ϕ {
	ϵ = ξ.dup.map(&:dup)

	ϵ.each_with_index { |x, α|
		x.each_with_index { |y, β|
			oc = π[[α, β]].count { |a,b| ξ[a][b] == '#' }
			ϵ[α][β] = '#' if ξ[α][β] == 'L' and oc == 0
			ϵ[α][β] = 'L' if ξ[α][β] == '#' and oc >= ϕ
		}
	}

	δ = ϵ.flatten.count('#')

	return δ if ω == δ
	return Ω.(ϵ, δ, π, ϕ)
}

puts "Ans 1: %d" % Ω.(F, 0, N1, 4)
puts "Ans 2: %d" % Ω.(F, 0, N2, 5)
