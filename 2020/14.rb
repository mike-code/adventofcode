Ξ = File.read("#{__dir__}/data/14.txt").split('mask')[1..].map(&:lines).

map { |a, *b|
	[
		a.scan(/ = (.+)/).first.first,
		b.map { |e| e.scan(/mem\[([\d]+)\] = ([\d]+)/).first.map(&:to_i) }
	]
}

A1 = Ξ.each.with_object({}) { |(m, nums), res|
	and_ = m.gsub(/[0-9]/, '0').gsub('X', '1').to_i 2
	or_  = m.gsub('X', '0').to_i 2

	nums.each { |n|
		res[n.first] = n.last & and_ | or_
	}
}

A2 = Ξ.each.with_object({}) { |(m, nums), res|
	or_  = m.gsub('X', '0').to_i 2

	nums.each { |n|
		nstr = (n.first | or_).to_s(2).reverse
		(0..2**m.count('X')-1).each { |i|
			i = i.to_s(2).chars
			addr = m.chars.reverse.map.with_index { |c, idx|
				c == 'X' ? (i.pop || '0') : (nstr[idx] || '0')
			}.reverse.join.to_i(2)
			res[addr] = n.last
		}
	}
}

puts "Ans 1: %d" % A1.values.sum
puts "Ans 2: %d" % A2.values.sum
