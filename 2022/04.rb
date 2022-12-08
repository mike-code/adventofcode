F = File.read("#{__dir__}/data/04.txt").scan(/(\d+)-(\d+),(\d+)-(\d+)/)
		.map { |α| α.map(&:to_i).each_slice(2).map { [*(_1.._2)] }.sort_by(&:size) }

puts "Ans 1: %d" % F.map { _1.inject(:-) }.select(&:empty?).size
puts "Ans 2: %d" % F.map { _1.inject(:&) }.reject(&:empty?).size
