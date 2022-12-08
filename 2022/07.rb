F = File.read("#{__dir__}/data/07.txt").lines

Π = F.each.with_object({:β => [], :dir => {}}) { |α,γ|
	γ[:β].pop                                    if α.match(/\.$/)
	γ[:β].push(α.split.last)                     if α.match(/cd [^\.]/)
	(γ[:dir][γ[:β].dup] ||= []) << α.split.first if α.match(/^[\d]+/)
}[:dir].each.with_object({}) { |(a,b),ε|
	(ε[a.dup] ||= []) << b.map(&:to_i).sum && a.pop until a.empty?
}.map(&:last).map(&:sum)

puts "Ans 1: %d" % Π.select { _1 <= 100000 }.sum
puts "Ans 2: %d" % Π.select { _1 >= Π.max - 40000000 }.min
