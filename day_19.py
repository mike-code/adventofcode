import re, random
from itertools import permutations

data_1 = {}
data_2 = {}

with open('data/day19.txt') as fp:
	for i in [i.split(' => ') for i in fp.read().splitlines()]:
		try:
			data_1[i[0]] = data_1.get(i[0], []) + [i[1]]
			data_2[i[1]] = i[0]
		except:
			in_str = i[0]

res = [re.sub("^(.*?)((%s.*?){%d})%s" % (key, i, key), "\\1\\2%s" % rep, in_str) for key, val in data_1.items() for rep in val for i in range(len(re.findall(key, in_str)))]
print("Ans 1:", len(set(res)))
