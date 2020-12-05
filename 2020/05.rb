Ξ = File.read("#{__dir__}/data/05.txt").split

Λ = Ξ.map { @1.gsub(/(R|B)/, '1').gsub(/\D/, '0') }
     .map { @1[..6].to_i(2) * 8 + @1[7..].to_i(2) }

puts "Ans 1: %d" % Λ.max
puts "Ans 2: %d" % ((Λ.min..Λ.max).sum - Λ.sum)
