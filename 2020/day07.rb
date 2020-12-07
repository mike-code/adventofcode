F = File.read("foo.txt")

DATA     = F.scan(/^(.+?) bags contain(.+)$/).map { |a,b| [a, b.scan(/ ([\d]+)?(?: )?([a-z]+ [a-z]+) bag(?:s)?(?:.|,)/) ] }.to_h
REVERSED = DATA.map { |a| a.last.map { |b| [b.last, a.first] } }.flatten(1).group_by(&:first).map { |a,b| [a,b.map(&:last).uniq] }.to_h

# ---------------------------------------

queue   = ["shiny gold"]
visited = []

while (queue.any?) do
	now = queue.pop

	if visited.include?(now).! then
		queue += REVERSED.fetch(now, [])
		visited << now
	end
end

puts "Ans 1: %d" % (visited.size - 1)

queue = [[1, "shiny gold"]]
total = 0

while (queue.any?) do
	(mult, now) = queue.pop

	(DATA[now] || []).each { |num,name|
		queue << [num.to_i * mult, name]
		total += num.to_i * mult
	}
end

puts "Ans 2: %d" % total
