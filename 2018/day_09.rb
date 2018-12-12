P, ξ = File.read("#{__dir__}/data/day9.txt").scan(/(\d+) play.+?th (\d+)/).first.map(&:to_i)

def go(Ω)
    scores = (1..P).map{|p| [p, 0]}.to_h

    (1..Ω).zip((1..P).cycle.take(Ω)).each_with_object({α: [0], β: []}) { |item, acc|
        if item.first % 23 === 0
            7.times {
                acc[:α] = acc[:β].shift(acc[:β].size) if acc[:α].empty?
                acc[:β].unshift(acc[:α].pop)
            }

            scores[item.last] += (item.first + acc[:α].pop)
        end

        acc[:β] = acc[:α].shift(acc[:α].size) if acc[:β].empty?
        acc[:α] << acc[:β].shift

        acc[:α] << item.first if item.first % 23 != 0
    }

    scores.max_by(&:last).last
end

puts "Ans 1: %s" % go(ξ)
puts "Ans 2: %s" % go(ξ * 100)
