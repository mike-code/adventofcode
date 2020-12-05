Ξ = File.read("#{__dir__}/data/04.txt").split("\n\n").map(&:split)

REQ = ['byr','iyr','eyr','hgt','hcl','ecl','pid']

Λ = Ξ.select { |f| (REQ - f.map { @1.split(':').first }).empty? }

puts "Ans 1: %d" % Λ.size
puts "Ans 2: %d" % Λ.select { |f|
	ξ = f.map { @1.split(':') }.to_h

	true and
		(1920..2002).include? ξ['byr'].to_i and
		(2010..2020).include? ξ['iyr'].to_i and
		(2020..2030).include? ξ['eyr'].to_i and
		(
			(150..193).include? (ξ['hgt'].scan(/(\d+)cm/).first.first.to_i rescue 0) or
			(59..76).include?   (ξ['hgt'].scan(/(\d+)in/).first.first.to_i rescue 0)
		) and
		ξ['hcl'].scan(/^#([0-9a-f]{6})$/).first.nil?.! and
		ξ['ecl'].scan(/^(amb|blu|brn|gry|grn|hzl|oth)$/).first.nil?.! and
		ξ['pid'].scan(/^([0-9]{9})$/).first.nil?.!
}.size
