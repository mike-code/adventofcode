import numpy as np
from scipy.ndimage import convolve

with open('data/day18.txt') as fp:
    data = np.array([[1 if j == '#' else 0 for j in list(i)] for i in fp.read().splitlines()])

def showState(now, res, x, y, special = False):
	if special:
		if (x == 0 and y == 0) or (x == 0 and y == len(res) - 1) or (x == len(res) - 1 and y == 0) or (x == len(res) - 1 and y == len(res) - 1):
			return 1

	if res[x][y] == 3 or (res[x][y] == 2 and now == 1):
		return 1
	else:
		return 0

def iterateAll(data, times, special = False):
	if special:
		data[0][0] = 1
		data[0][len(data) - 1] = 1
		data[len(data) - 1][0] = 1
		data[len(data) - 1][len(data) - 1] = 1

	for _ in range(times):
		res  = convolve(data, [[1,1,1],[1,0,1],[1,1,1]], mode='constant')
		data = [[showState(now, res, x, y, special) for y, now in enumerate(row)] for x, row in enumerate(data)]

	return data

print("Ans 1:", np.sum(iterateAll(data, 100)))
print("Ans 2:", np.sum(iterateAll(data, 100, True)))
