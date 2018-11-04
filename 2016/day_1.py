import re, math, numpy as np

finder = re.compile(r'([LR]{1}\d+)(?:,)?')

with open('data/day1.txt') as fp:
	movements = finder.findall(fp.read())

looking = 0
pos     = (0, 0)
dual    = None
m_tbl   = [[0,1],[1,0],[0,-1],[-1,0]]
visited = []

for m in movements:
	looking = (looking + (1 if m[:1] == 'R' else -1)) % 4

	for i in range(1, int(m[1:]) + 1):
		pos = (pos[0] + m_tbl[looking][0], pos[1] + m_tbl[looking][1])

		if dual == None and pos in visited:
			dual = pos
		visited += [pos]


print("Ans 1:", abs(pos[0]) + abs(pos[1]))
print("Ans 2:", abs(dual[0]) + abs(dual[1]))
