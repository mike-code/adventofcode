F = File.open("#{__dir__}/data/day_03.txt").each_line.map(&:strip).map { @1.split ?, }

Π = {"R"=>[1,0], "L"=>[-1,0], "U"=>[0,1], "D"=>[0,-1]}

Λ = F.map { |line|
	line.each.with_object([0,0]).map {
		λ,δ,ω = @1[0],@1[1..].to_i,@2.dup
		@2[0..1] = Π[λ].zip([δ,δ]).map{@1*@2}.zip(@2).map{@1+@2}
		ret = [ω,@2].sort.inject(&:zip).map{ |a| [*(a.first..a.last)] }.reduce(&:product)
		ret.reverse! unless Π[λ].any? 1
		ret[1..]
	}.flatten(1)
}

puts "Ans 1: %d" % Λ.inject(:&).map { |a| a.map(&:abs).sum }.min
puts "Ans 2: %d" % Λ.inject(:&).map { |a| Λ.map { |l| l.index(a)+1 }.sum }.min
