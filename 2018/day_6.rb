F = File.read("#{__dir__}/data/day6.txt")
            .lines.map(&:strip).map(&:split)
            .map{|m| m.map(&:to_i)}

ω, Ω   = F.map(&:first).minmax
π, Π   = F.map(&:last).minmax
POINTS = F.zip([*('A'..'Z'),*('a'..'z')]).to_h

A1 = (π..Π).map{ |y|
        (ω..Ω).map{ |x|
            ξ = POINTS.map{ |coords, letter|
                [(coords.first - x).abs + (coords.last - y).abs, letter]
            }.sort_by(&:first).first(2)

            ξ.first.last if ξ.first.first != ξ.last.first
        }
    }

A2 = (π..Π).map{ |y|
        (ω..Ω).map{ |x|
            POINTS.map{ |coords, letter|
                (coords.first - x).abs + (coords.last - y).abs
            }.sum
        }
    }

puts "Ans 1: %s" % A1.flatten.group_by(&:itself).map{ |k, v| [v.size, k] }.reject{|v| v.first.nil? }.sort_by(&:first).last.first
puts "Ans 2: %s" % A2.flatten.count{|i| i < 10000 }
