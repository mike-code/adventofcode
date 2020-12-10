F = File.read("#{__dir__}/data/10.txt").split.map(&:to_i)
Ξ = (F + [0, F.max+3]).sort.reverse
Λ = {}

puts "Ans 1: %d" % Ξ.each_cons(2).map { |a| a.inject(:-) }.tally.values.inject(:*)

δ = -> ϕ {
	return 1 if ϕ == Ξ.size-1
	return Λ[ϕ] if Λ[ϕ] # memłaz

	Λ[ϕ] = (ϕ+1..ϕ+3).map { |n|
		δ.(n) unless Ξ[n].nil? or Ξ[ϕ] - Ξ[n] > 3
	}.reject(&:nil?).inject(:+)
}

puts "Ans 2: %d" % δ.(0)
