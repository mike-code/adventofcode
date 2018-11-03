import re, numpy
from math import ceil
from functools import reduce
from itertools import combinations

finder = re.compile(r'Hit Points: (\d+)[\S\s]+Damage: (\d+)[\S\s]+Armor: (\d+)')

with open('data/day21.txt') as fp:
	b_hp, b_dmg, b_arm = [int(x) for x in finder.findall(fp.read())[0]]

W = [(8,4,0),(10,5,0),(25,6,0),(40,7,0),(74,8,0)]
A = [(0,0,0),(13,0,1),(31,0,2),(53,0,3),(75,0,4),(102,0,5)]
R = list(combinations([(0,0,0), (25,1,0),(50,2,0),(100,3,0),(20,0,1),(40,0,2),(80,0,3)], 2))

C = [sum(com) for com in numpy.array([(w,a,r[0],r[1]) for w in W for a in A for r in R])]
CALC = [(c[0], ceil(b_hp/max(1, c[1] - b_arm)), ceil(100/max(1, b_dmg - c[2]))) for c in C]

print("Ans 1:", [x for x in sorted(CALC, key=lambda x: x[0]) if x[1] <= x[2]][0][0])
print("Ans 2:", [x for x in sorted(CALC, key=lambda x: x[0], reverse=True) if x[1] > x[2]][0][0])
