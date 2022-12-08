F = File.read("#{__dir__}/data/01.txt").split($/+$/)
		 .map { _1.split.map(&:to_i).sum }.sort

puts "Ans 1: %d" % F.last
puts "Ans 2: %d" % F.last(3).sum
