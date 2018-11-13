F = File.read('data/day2.txt')

keypad1 = [
	[1,2,3],
	[4,5,6],
	[7,8,9]
]

keypad2 = [
	[nil, nil,  1 , nil, nil],
	[nil,  2 ,  3 ,  4 , nil],
	[ 5 ,  6 ,  7 ,  8 ,  9 ],
	[nil, 'A', 'B', 'C', nil],
	[nil, nil, 'D', nil, nil],
]

moves = {
	'L' => [-1, 0],
	'U' => [0, -1],
	'R' => [1, 0],
	'D' => [0, 1],
}

pos1 = [1,1]
pos2 = [0,2]

def getMe(keypad, pos, moves)
	i_min = 0
	i_max = keypad[0].length - 1
	F.lines.map { |line|
		line.chop.each_char { |chr|
			move = moves[chr]
			min =
			x = (pos[0] + move[0]) < i_min || (pos[0] + move[0]) > i_max || keypad[pos[1]][pos[0] + move[0]].nil? ? pos[0] : pos[0] + move[0]
			y = (pos[1] + move[1]) < i_min || (pos[1] + move[1]) > i_max || keypad[pos[1] + move[1]][pos[0]].nil? ? pos[1] : pos[1] + move[1]

			pos = [x, y]
		}

		keypad[pos[1]][pos[0]]
	}
end

puts "Ans1: " + getMe(keypad1, pos1, moves).join
puts "Ans2: " + getMe(keypad2, pos2, moves).join
