F = File.read("#{__dir__}/data/day1.txt").lines.map(&:strip).map(&:to_i)

puts "Ans 1: %s" % F.reduce(:+)

puts "Ans 2: %s" % (0..Float::INFINITY).lazy.each_with_object([]).map{ |i, gen|
	l = gen.last
    v = (gen.to_a.last || 0) + F[i % F.length]
    gen << v

    v if l.nil? || (not gen.take(gen.size-2).include? l)
}.take_while{ |m| not m.nil? }.force.last
