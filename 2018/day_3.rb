F = File.read("#{__dir__}/data/day3.txt").lines.map{ |l|
     l.scan(/#(\d+) @ (\d+)\,(\d+): (\d+)x(\d+)/).flatten(1).map(&:to_i)
}

board1 = Array.new(1000) { Array.new(1000, 0) }
board2 = Array.new(1000) { Array.new(1000, 0) }
checks = {}

F.each{ |e|
     claim, x, y, lX, lY = e
     checks[claim] = lX * lY

     for a in (y..(y + lY - 1))
          for b in (x..(x + lX - 1))
               board1[a][b] += 1
               board2[a][b] = board2[a][b] > 0 ? 9999 : claim
          end
     end
}

puts "Ans 1: %s" % board1.flatten.count{ |x| x > 1 }
puts "Ans 2: %s" % board2.flatten.group_by{ |x| x }.map{ |k, v| [k, v.length] }.select{ |k, v| checks[k] == v }.first.first
