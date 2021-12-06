F = File.read("#{__dir__}/data/19.txt").split("\n\n")
Rules = F.first.scan(/([\d]+): (?:\"([\w])\"|(.+))/).map { |a, *b| [a, b.join] }.to_h

p Rules

def go(s)
  return s if s.match?(/^[a-z]$/)
  return go(Rules[s]) if s.match?(/^[0-9]+$/)

  s.split(' | ').map { |r|
    r.split.map { |x|
      go(Rules[x])
    }
  }
end

def merge(a)
  return '' if a.empty?
  el = a.shift
  return merge(el) + merge(a) if el.is_a? Array
  return el + merge(a)
end

R = go(Rules['0'])
p R
p merge(R)
