F = File.read("#{__dir__}/data/day2.txt").lines.map(&:strip)

puts "Ans 1: %s" %  F.map(&->l {
                        [2, 3].map{ |c|
                            l.each_char.group_by(&->v {v}).values.map(&->i {i.count}).any? c
                        }
                    }).transpose.map{ |x| x.count true }.reduce(:*)

puts "Ans 2: %s" %  F.combination(2).select{ |m|
                        m.map{ |x|
                            x.each_char.to_a
                        }.transpose.map{ |c|
                            c.first == c.last
                        }.count(false) == 1
                    }.flatten.map{ |t|
                        t.each_char.with_index.map { |a,b| "#{a}#{b}" }
                    }.reduce(&:&).map{ |s| s.tr("0-9", "") }.join
