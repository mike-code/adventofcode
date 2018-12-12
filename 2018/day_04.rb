F = File.read("#{__dir__}/data/day4.txt")
          .scan(/.+?#(\d+)(.+?)(?:G|\Z)/m).map{ |o| o[-1] = o.last.scan(/\:(\d+)\] f.+?\:(\d+)\] w/m); [*o]}
          .group_by(&:first).map{ |k, v|
               [k.to_i, v.map{ |i| i.last }.flatten(1).map(&->a { a.map(&:to_i) }).map(&->t { (t.first..t.last-1).to_a }).flatten]
          }.reject{ |v| v.last.empty? }

puts "Ans 1: %s" % F.max_by{|o| o.last.size}.yield_self{ |k, v| k * v.group_by(&:itself).values.max_by(&:size).first }
puts "Ans 2: %s" % F.max_by{|o| o.last.group_by(&:itself).values.max_by(&:size).size }.yield_self{ |k, v| k * v.group_by(&:itself).values.max_by(&:size).first }
