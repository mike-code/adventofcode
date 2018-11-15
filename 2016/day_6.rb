F = File.read("#{__dir__}/data/day6.txt").scan(/\S+/).map &->_ { _.each_char.to_a }

puts "Ans1: %s" % F.transpose.map{ |m| m.sort.chunk(&:itself).to_a.map{ |m| [m.last.length, m.first] }.sort.reverse.first.last }.join
puts "Ans2: %s" % F.transpose.map{ |m| m.sort.chunk(&:itself).to_a.map{ |m| [m.last.length, m.first] }.sort.first.last }.join
