F = File.read("#{__dir__}/data/02.txt").split.each_slice(2).map { [_1.ord - 64, _2.ord - 87] }

puts "Ans 1: %d" % F.map { _1.last + (_1.reverse.inject(:-) % 3 + 1) % 3 * 3 }.sum
puts "Ans 2: %d" % F.map { (_1.last - 1) * 3 + [3,1,2].rotate(_1.first).rotate(_1.last + 1).first }.sum
