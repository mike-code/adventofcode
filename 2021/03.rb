F = File.read("#{__dir__}/data/03.txt").lines.map(&:chomp).map(&:each_char).map(&:to_a)
T = F.transpose

r8m8 = -> α { α.sort[α.size/2] }

γ = T.map(&r8m8).join.to_i 2
Δ = ("1" * T.size).to_i 2
ε = γ ^ Δ

puts "Ans 1: %s" % (γ * ε)

Π = -> α {
	(0..T.size-1).each.with_object(F.dup) { |idx, π|
		r = r8m8.(π.transpose[idx])
		π.select! { |x| x[idx].send(α, r) }
		break π.first.join.to_i(2) if π.size == 1
	}
}

puts "Ans 2: %s" % (Π.('==') * Π.('!='))
