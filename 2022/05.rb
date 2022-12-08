A,B = File.read("#{__dir__}/data/05.txt").split $/+$/

Δ = A.lines.map { |α| α.scan(/\s\s\s\s|\[\S\]/).map { _1.scan(/[^\[\]]/).first } }
Ξ = Δ.each.with_object([*[[]]*Δ[..-2].map(&:size).max]).map { _2.zip(_1).map(&:last) }
     .transpose.map(&:reverse).map(&:compact).map { _1 - [' '] }

Π = -> ε {
  B.scan(/\d+/).map(&:to_i).each_slice(3).each.with_object(Ξ.map(&:dup)) { |(t,x,y),α|
    ε ? t.times { α[y-1] << α[x-1].pop } : α[y-1] += α[x-1].pop(t)
  }.map(&:last).join
}

puts "Ans 1: %s" % Π.('(′ꈍωꈍ‵)')
puts "Ans 2: %s" % Π.(nil)
