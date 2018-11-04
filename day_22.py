import re, numpy, math, itertools, copy, random

finder = re.compile(r'Hit Points: (\d+)[\S\s]+Damage: (\d+)')

with open('data/day22.txt') as fp:
	b_hp, b_dmg = [int(x) for x in finder.findall(fp.read())[0]]

#        cost, gain, dmg, life, shield, turns
missle  = [53,  0,   4, 0, 0, 1] # 0
drain   = [73,  0,   2, 2, 0, 1] # 1
shield  = [113, 0,   0, 0, 7, 6] # 2
poison  = [173, 0,   3, 0, 0, 6] # 3
regen   = [229, 101, 0, 0, 0, 5] # 4
spells  = [missle, drain, shield, poison, regen]

# DEBUG
# listme = ([3, 4, 2, 3, 4, 2, 3, 0, 0])
best   = 99999999

def go(p_hp, mana, b_hp, effects = [None, None, None, None, None], turn = 0, spent = 0):
	global b_dmg, spells, listme, best
	arm  = 0
	turn += 1

	# DEBUG
	# if turn % 2 == 0:
	# 	print("\nBoss's turn")
	# else:
	# 	print("\nPlayer's turn")
	# print("Upkeep effects:", effects)

	for idx, e in enumerate(effects):
		if e != None:
			cost, gain, dmg, life, shield, lasts = e
			mana  += gain
			b_hp  -= dmg
			p_hp  += life
			arm   +=  shield

			e[5] -= 1
			effects[idx]    = e if e[5] > 0 else None

	# DEBUG
	# print("Main phase effects:", effects)

	if spent >= best:
		return [(False, spent, turn)]

	# DEBUG
	# print("Boss hp after effects", b_hp)

	if b_hp <= 0:
		print ("WIN", spent, casted)
		best = spent
		return [(True, spent, turn)]

	if turn % 2 == 0: # even turns are boss' turns
		p_hp -= (b_dmg - arm)

	# DEBUG
	# print("Player's hp after fight", p_hp)

	if p_hp <= 0:
		return [(False, spent, turn)]

	if turn % 2 == 1:
		rr = []
		for idx, s in enumerate(spells):
			eff_now = copy.deepcopy(effects)
			mana_now = mana
			spent_now = spent
			casted_now = casted[:]

			# DEBUG
			# idx = random.randint(0, 2)
			# while eff_now[idx] != None:
			# 	idx = random.randint(0, 2)

			i = math.floor(turn/2)
			if i >= len(listme):
				print("out of scope")
				exit()

			idx = listme[i]

			if eff_now[idx] == None:
				mana_now         -= spells[idx][0]
				spent_now        += spells[idx][0]
				eff_now[idx] = spells[idx][:]
				casted_now += [idx]
			# else:
			# 	print("you can't")
			# 	exit()

			# DEBUG
			# print("Player casts", spells[idx][0], "remaining mana:", mana_now)

			if mana_now < 0:
				# print ("L - mana")
				rr += [(False, spent_now, turn)]
				# return [(False, spent_now, turn)]
			else:
				# print(eff_now)
				rr += go(p_hp, mana_now, b_hp, eff_now, turn, spent_now, casted_now)
				# return go(p_hp, mana_now, b_hp, eff_now, turn, spent_now)

		return rr
	else:
		return go(p_hp, mana, b_hp, copy.deepcopy(effects), turn, spent, casted[:])

print([x for x in go(50, 500, b_hp) if x[0] == True])
