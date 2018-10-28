import re, numpy as np

types = ['children', 'cats', 'samoyeds', 'pomeranians', 'akitas', 'vizslas', 'goldfish', 'trees', 'cars', 'perfumes']
d = [3, 7, 2, 3, 0, 0, 5, 3, 2, 1]

with open('data/day16.txt') as fp:
	rr = fp.read().splitlines()

for i,r in enumerate(rr):
	readval = [int(re.search("%s: (\\d+)" % t, r)[1]) if re.search("%s: (\\d+)" % t, r) else None for t in types]
	ans     = np.array([d[k] == v or v == None for k,v in enumerate(readval)])

	if (ans == True).sum() == len(d):
		print("Ans 1:", i+1)

	ans     = np.array([v == None or (d[k] < v if (k==1 or k==7) else d[k] > v if (k==3 or k==6) else d[k] == v) for k,v in enumerate(readval)])
	if (ans == True).sum() == len(d):
		print("Ans 2:" , i+1)
