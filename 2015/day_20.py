from collections import Counter
from operator import mul
from functools import reduce
import itertools

NUM = 29000000

def prim_geb(n):
	i = 2
	while i * i <= n:
		while n % i == 0:
			yield i
			n /= i
		i += 1

	if n > 1:
		yield int(n)

for i in range(NUM):
	if NUM <= 10 * reduce(mul, [sum([num ** n for n in range(times+1)]) for num,times in Counter([x for x in prim_geb(i)]).items()], 1):
		break

print("Ans 1:", i)

for i in range(NUM):
	prims = list(prim_geb(i))
	if NUM <= 11 * sum([y for y in set([reduce(mul, p) for l in range(1, len(prims)+1) for p in itertools.combinations(prims, l)]) if i/y <= 50]):
		break

print("Ans 2:", i)
