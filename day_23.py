import re

finder = re.compile(r'(\w{3}) (a|b|(?:\-|\+)\d+)(?:, )?((?:\-|\+)\d+)?')

with open('data/day23.txt') as fp:
	program = finder.findall(fp.read())

def run(s):
	i   = 0
	reg = {'a': s, 'b': 0}

	while i < len(program):
		instr, p1, p2 = program[i]

		if instr == 'inc':
			reg[p1] += 1
		elif instr == 'hlf':
			reg[p1] /= 2
		elif instr == 'tpl':
			reg[p1] *= 3
		elif instr == 'jmp':
			i += int(p1)
			continue
		elif instr == 'jie':
			if reg[p1] % 2 == 0:
				i += int(p2)
				continue
		elif instr == 'jio':
			if reg[p1] == 1:
				i += int(p2)
				continue

		i += 1

	return reg['b']

print("Ans 1:", run(0))
print("Ans 2:", run(1))
