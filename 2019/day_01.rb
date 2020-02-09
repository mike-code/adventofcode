F = File.open("#{__dir__}/data/day_01.txt").each_line.map(&:to_i)

Ξ = -> i { Enumerator.new { |y| loop { y << i=(i/3-2) }}}

puts "Ans 1: %d" % F.map { |m| Ξ.(m).first }.inject(:+)
puts "Ans 2: %d" % F.map { |m| Ξ.(m).take_while(&:positive?).sum }.inject(:+)


