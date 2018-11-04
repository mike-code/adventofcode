import re, itertools, functools, operator

finder = re.compile(r'(\d+)')

with open('data/day24.txt') as fp:
	parcels = sorted([int(x) for x in finder.findall(fp.read())], reverse=True)

def comp(d):
	for l in range(len(parcels)+1):
		for att in itertools.combinations(parcels, l):
			if sum(att) == sum(parcels)/d:
				return functools.reduce(operator.mul, att)

print("Ans 1:", comp(3))
print("Ans 2:", comp(4))
