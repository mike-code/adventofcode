MAP = {
	'(' => [:a, 1],
	')' => [:a, -1],
	'[' => [:b, 1],
	']' => [:b, -1],
	'{' => [:c, 1],
	'}' => [:c, -1],
	'<' => [:d, 1],
	'>' => [:d, -1],
}

DOWN = { ')' => '(', ']' => '[', '}' => '{', '>' => '<'}


T = -> s {
	top = ''
	s.each_char.each_with_object({a: 0, b: 0, c: 0}) { |a, o|
		p DOWN[a]
		break o if DOWN[a] && DOWN[a] != top
		top = a
		o[MAP[a].first] += MAP[a].last
		break o if o.map(&:last).any? -1

	}.map(&:last).inject(:+)
}


p T.('())(')

# p T.('()') == true
# p T.('(())') == true
# p T.('(()') == false
# p T.('())(') == false
# p T.('((()(())()))') == true
# p T.('(') == false
# p T.(')') == false
# p T.(')(') == false
# p T.('(())') == true
# p T.('(())())') == false
# p T.('') == true
