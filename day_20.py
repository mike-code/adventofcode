from collections import Counter
from operator import mul
from functools import reduce


def prim_geb(n):
	i = 2
	while i * i < n:
		while n % i == 0:
			yield i
			n /= i
		i += 1

	if n > 1:
		yield int(n)

i = 0
res = 0
while res < 2900000:
	i += 1
	res = reduce(mul, [sum([num ** n for n in range(times+1)]) for num,times in Counter([x for x in prim_geb(i)]).items()], 1)

print(i)
