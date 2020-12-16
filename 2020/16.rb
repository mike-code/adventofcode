(Rules, Mine, Others) = File.read("#{__dir__}/data/16.txt").split("\n\n").map(&:lines)

Mine.shift
Others.shift

ranges   = Rules.map { |l| l.scan(/([0-9]+)-([0-9]+)/).map { |a,b| [*a.to_i..b.to_i] } }
invalid  = Others.map(&:chomp).join(',').split(',').map(&:to_i).reject { |i| ranges.flatten(1).any? { |e| e.include?(i) } }
valids   = Others.reject { |r| invalid.any? { |e| r.chomp.split(',').include?(e.to_s) }}
reminder = valids.map { |valid| valid.chomp.split(',').map(&:to_i) }.transpose.map { |nums| ranges.each_with_index.select { |r, idx| nums.all? { |n| r.flatten.include?(n) }}.map(&:last) }

loop {
	break if reminder.all? { |e| e.size == 1 }
	reminder.select { |s| s.size == 1 }.each { |el| reminder.each { |r| r.delete(el.first) if r.size > 1 } }
}

puts "Ans 1: %d" % invalid.sum
puts "Ans 2: %d" % reminder.flatten.map.with_index.to_a.select { |a| (0..5).include?(a.first) }.map(&:last).map { |idx| Mine.first.split(',')[idx].to_i }.inject(:*)
