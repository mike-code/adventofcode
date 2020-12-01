F = File.open("#{__dir__}/data/day_02.txt").strip.split(',').map(&:to_i)

Ξ =-> x,y {
	i = 0; ω = F.dup; ω[1,2] = [x, y];
	loop { (f, a, b, c) = ω[i..i+3]; ω[c] = (f == 1 ? ω[a] + ω[b] : ω[a] * ω[b]); break ω.first if ω[i+=4] == 99 }
}

puts "Ans 1: %d" % Ξ[12,2]
puts "Ans 2: %d" % [*0..99].product([*0..99]).each { break @1, @2 if Ξ.(@1, @2) == 19690720 }.zip([100,1]).map{ @1*@2 }.inject(:+)
