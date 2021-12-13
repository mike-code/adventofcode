F = File.read("#{__dir__}/data/06.txt").scan(/\d+/).map(&:to_i).tally.to_h

# Well.. that obviously doesn't scale :)
#
# Δ = -> α {
# 	α.times {
# 		F.each_with_index { |v, idx|
# 			F << 9 and F[idx] = 6 if 0 > F[idx] -= 1
# 		}
# 	}
# }

Δ = -> α {
	# memłaz
	γ = [*-1..8].zip([0]*10).to_h.merge(F)
	α.times {
		γ.each { γ[_1-1] = _2 unless _1 < 0 }
		γ[8] = γ[-1] and γ[6] += γ[-1]
	}
	γ.map(&:last)[1..].inject(:+)
}

puts "Ans 1: %d" % Δ.(80)
puts "Ans 2: %d" % Δ.(256)
