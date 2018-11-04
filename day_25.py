import re, itertools, functools, operator

finder = re.compile(r'row (\d+), column (\d+).')

with open('data/day25.txt') as fp:
	row,col = [int(x) for x in finder.findall(fp.read())[0]]

now   = 20151125
mult  = 252533
divis = 33554393

for _ in range(int((col + row - 1)*(col + row)/2 - (row - 1)) - 1):
	now = now*mult%divis

print("Ans 1:", now)
