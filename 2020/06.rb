F = File.read("#{__dir__}/data/06.txt").split("\n\n").map(&:split)

puts "Ans 1: %d" % F.map(&:join).map(&:chars).map(&:uniq).map(&:size).sum
puts "Ans 2: %d" % F.map { |a| a.map(&:chars).inject(:&).size }.sum
