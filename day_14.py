import re, math
from collections import Counter

MY_TIME = 2503
finder = re.compile(r'(\w+) can fly (\d+) km/s for (\d+) seconds, but then must rest for (\d+) seconds.')

def findDist(r, time):
	name, speed, motion_time, rest_time = r[0], int(r[1]), int(r[2]), int(r[3])

	full_iterations = math.floor(time / (motion_time + rest_time))
	remain_motion   = min(motion_time, time % (motion_time + rest_time))
	dist            = speed * (full_iterations * motion_time + remain_motion)

	return (name, dist)

with open('data/day14.txt') as fp:
	reindeers = finder.findall(fp.read())

	list1 = [findDist(r, MY_TIME) for r in reindeers]

	list2 = []
	for time in range(1, MY_TIME):
		list2.append(sorted((findDist(r, time) for r in reindeers), key=lambda t: t[1], reverse = True)[0][0])

	print('Ans 1:', sorted(list1, key=lambda t: t[1], reverse = True)[0])
	print('Ans 2:', Counter(list2).most_common(1)[0])
