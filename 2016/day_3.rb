F = File.read('data/day3.txt').scan(/\s*(\d+)\s*(\d+)\s*(\d+)/m)
D = F.map(&->_ { _.map &:to_i })

def is_triangle(t)
	t[0] + t[1] > t[2] and
	t[1] + t[2] > t[0] and
	t[0] + t[2] > t[1]
end

puts "Ans 1: %s" % D.map(&->t { is_triangle(t) }).count(true)
puts "Ans 2: %s" % D.each_slice(3).to_a.map(&:transpose).flatten(1).map(&->t { is_triangle(t) }).count(true)
