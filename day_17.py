from itertools import chain

def comp(num, siz):
	if len(siz) == 0 or num - siz[0] < 0:
		return [[None]]

	rem = num - siz[0]

	return [[siz[0]]] if rem == 0 else [[siz[0]] + j for i in range(1, len(siz)) for j in comp(rem, siz[i:])]

with open('data/day17.txt') as fp:
	sizes = sorted([int(i) for i in fp.read().splitlines()], reverse=True)

res = [el for el in chain(*[comp(150, sizes[i:]) for i in range(0, len(sizes))]) if None not in el ]

print("Ans 1:", len(res))
print("Ans 2:", len([el for el in res if len(el) == min([len(i) for i in res])]))
