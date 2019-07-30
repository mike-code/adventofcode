F = File.read("#{__dir__}/data/day01.txt").strip.each_char.map(&:to_i)

def solve(Θ)
	(F + F.first(Θ)).drop(Θ).zip(F).map{ |t| t.inject(:-) == 0 ? t.first : 0 }.sum
end

p "Ans 1: %s" % solve(1)
p "Ans 2: %s" % solve(F.count/2)
