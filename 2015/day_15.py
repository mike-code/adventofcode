import re, numpy as np

finder = re.compile(r'(\w+): capacity (-?\d+), durability (-?\d+), flavor (-?\d+), texture (-?\d+), calories (-?\d+)')

def comp(num, len):
	if len == 1:
		return [[num]]

	return [([i] + j) for i in range(1, num - len + 2) for j in comp(num - i, len - 1)]

with open('data/day15.txt') as fp:
	ingredients = np.array([list(map(int, i[1:6])) for i in finder.findall(fp.read())])

options = np.array(comp(100, len(ingredients)))
results = np.array([[i if i > 0 else 0 for i in np.add.reduce(m)] for m in [ingredients * a[:, None] for a in options]])
print("Ans 1:", np.amax([np.multiply.reduce(m[:4]) for m in results]))
print("Ans 2:", np.amax([np.multiply.reduce(m[:4]) for m in results[[r[4] == 500 for r in results]]]))
