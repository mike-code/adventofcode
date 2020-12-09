F = File.read("#{__dir__}/data/08.txt").split.each_slice(2).map { |a| a << false}

ξ = -> idx, acc, prog, fix {
	(ins, mod, r) = prog[idx]
	return acc,idx if r.nil?

	prog[idx].pop

	ins = 'jmpnop'.gsub(ins, '') unless idx != fix or ins =~ /a/

	acc = eval(acc.to_s + mod) if ins == "acc"
	idx = ins == "jmp" ? eval(idx.to_s + mod) : idx + 1

	return ξ.(idx, acc, prog, fix)
}

ϕ = -> iSwitch {
	ξ.(0, 0, F.dup.map(&:dup), iSwitch)
}

puts "Ans 1: %d" % ϕ.(nil).first
puts "Ans 2: %d" % (0..F.size).map(&ϕ).select { @2 == F.size }.first.first
