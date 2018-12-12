require 'set'
F = File.read("#{__dir__}/data/day1.txt").lines.map(&:strip).map(&:to_i)

puts "Ans 1: %s" % F.reduce(:+)

(0..Float::INFINITY)
    .inject(Set.new){ |gen, i|
        v = (gen.to_a.last || 0) + F[i % F.length]
        (puts "Ans 2: %s" % v; break) if not gen.add? v
        gen << v
    }
