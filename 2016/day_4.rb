F = File.read('data/day4.txt').scan(/([a-z\-]+)-(\d+)\[([a-z]+)\]/m)
Valid = F.select{ |i| i.last === i.first.gsub('-', '').each_char.sort.chunk(&:itself).to_a.map { |k,v| [k, v.length]}.sort_by { |t| [-t.last, t.first] }.map(&:first).first(5).join }

northpole = Valid.select { |e|
				e.first.each_char.map { |c|
					((c.ord - 97 + e[1].to_i) % 26 + 97).chr unless c === '-'
				}.join.include?('northpole')
			}

puts "Ans 1: %s" % Valid.map{ |i| i[1] }.map(&:to_i).sum
puts "Ans 2: %s" % northpole.first[1]
