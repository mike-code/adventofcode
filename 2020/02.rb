Ξ = File.read("#{__dir__}/data/02.txt").scan(/([\d]+)-([\d]+) ([\w]): ([\w]+)/)

puts "Ans 1: %d" % Ξ.select { (@1.to_i..@2.to_i) === @4.scan(/#{@3}/).size }.size
puts "Ans 2: %d" % Ξ.select { 1 == [@4[@1.to_i-1], @4[@2.to_i-1]].count(@3) }.size
