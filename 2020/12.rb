F = File.read("#{__dir__}/data/12.txt").split.map(&:chars).map { |a,*b| [a, b.join.to_i] }

MMap = {
	'N' => [1,0],
	'E' => [0,1],
	'S' => [-1,0],
	'W' => [0,-1],
}

TMap = [
	nil,
	[1, [-1, 1]],
	[2, [-1, -1]],
	[1, [1, -1]],
]

Ψ = -> {
	coords = { :pos => [0, 0], :p => 90 }

	F.each { |k,v|
		coords[:p] = coords[:p] + v if k == 'R'
		coords[:p] = coords[:p] + (360 - v) if k == 'L'
		coords[:pos] = coords[:pos].zip(MMap[k].zip([v]*2).map{ |a| a.inject(:*) }).map(&:sum) if ['N', 'E', 'S', 'W'].include? k
		coords[:pos] = coords[:pos].zip([*MMap][coords[:p] / 90 % 4].last.zip([v]*2).map{ |a| a.inject(:*) }).map(&:sum) if k == 'F'
	}

	coords[:pos].map(&:abs).sum
}

Ω = -> {
	coords = { :pos => [0, 0], :way => [1, 10]}

	F.each { |k,v|
		if ['L', 'R'].include?(k) then
			turn = v
			turn = (360 - turn) if k == 'L'

			t = TMap[turn/90]
			coords[:way] = coords[:way].rotate(t.first).zip(t.last).map{ |a| a.inject(:*) }
		end

		coords[:way] = coords[:way].zip(MMap[k].zip([v]*2).map{ |a| a.inject(:*) }).map(&:sum) if ['N', 'E', 'S', 'W'].include? k
		coords[:pos] = coords[:pos].zip(coords[:way].zip([v]*2).map{ |a| a.inject(:*) }).map(&:sum) if k == 'F'
	}

	coords[:pos].map(&:abs).sum
}

puts "Ans 1: %d" % Ψ.()
puts "Ans 2: %d" % Ω.()
