F = File.read("#{__dir__}/data/day02.txt").lines.map{ |l|
	l.strip.split("\t").map(&:to_i)
}

puts "Ans 1: %s" % F.map{ |l| l.minmax.inject(:-).abs }.sum
puts "Ans 2: %s" % F.map{ |l| l.permutation(2).lazy.reject{ |x| x.inject(:%) != 0 }.first.inject(:/) }.sum

=begin
Q:

sum {max x - min x} each F:"J"$"\t" vs ' read0 `:data/test_day02.txt


=end

1
8
16
24



46009
