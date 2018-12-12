F = File.read("#{__dir__}/data/day7.txt")
            .scan(/Step (\w+) must.+? step (\w+) can/)

Timer   = {t: -1}
Workers = Array.new(5) { [nil, 0] }

V = F.group_by(&:first).map{|k, v| [k, v.map(&:last).sort] }.to_h
V.to_a.transpose.map(&:flatten).reverse.reduce(:-).uniq.sort.each{ |λ|
    V[λ] = []
}

def P1(stack)
    Timer[:t] += 1

    Workers.select(&:first).each{ |ω|
        ω[1] -= 1

        if(ω.last == 0)
            stack.append(ω.first)
            V.delete(ω.first)
            ω[0] = nil
        end
    }

    if V.any?
        Ξ = Workers.reject(&:first)

        V.to_a.transpose
            .map(&:flatten)
            .append(Workers.map(&:first))
            .reduce(:-)
            .sort
            .take(Ξ.size)
            .each_with_index.each{ |letter, idx|
                Ξ[idx][0] = letter
                Ξ[idx][1] = letter.ord - 64 + 60
            }

        P1(stack)
    end

    stack
end

puts "Ans1: %s" % P1([]).join
puts "Ans2: %s" % Timer[:t]
