F = File.read("#{__dir__}/data/04.txt").split
Δ = F.shift.split ','

A = *F.each_slice(5).each_slice(5)
B = A.zip A.map(&:transpose)
Π = []

Δ.each { |α| B.each { |ε| ε.each { |γ| γ.each { |π|
	π.delete α
	Π << α.to_i * γ.flatten.map(&:to_i).sum and ε.clear if π.empty?
}}}}

puts "Ans 1: %s" % Π.first
puts "Ans 2: %s" % Π.last
