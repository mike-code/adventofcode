F = File.read("#{__dir__}/data/08.txt").lines.map(&:chomp).map{ _1.split('|').map(&:split) }
Δ = -> α, β, γ { β.size == α and ([*"a".."g"] - β).any? { |λ| (γ - [β]).all? { _1.include?(λ) } } }

Ξ = F.map { |α,β|
	ω = α.map(&:each_char).map(&:to_a)
	δ = {}

	δ[1],    ω = ω.partition { |x| x.size == 2}
	δ[4],    ω = ω.partition { |x| x.size == 4}
	δ[7],    ω = ω.partition { |x| x.size == 3}
	δ[8],    ω = ω.partition { |x| x.size == 7}
	δ[0],    ω = ω.partition { |x| Δ.(6, x, ω) }
	δ[2],    ω = ω.partition { |x| Δ.(5, x, ω) }
	δ[3],    ω = ω.partition { |x| Δ.(5, x, ω) }
	δ[5],    ω = ω.partition { |x| x.size == 5}
	δ[9], δ[6] = ω.partition { |x| (δ[1].first - x).size == 0 }

	γ = δ.map { |k,v| [v.first.sort.join, k] }.to_h
	β.map { γ[_1.each_char.sort.join] }.join.to_i
}

puts "Ans 1: %d" % Ξ.join.each_char.map(&:to_i).count(&[1,4,7,8].method(:include?))
puts "Ans 2: %d" % Ξ.sum
