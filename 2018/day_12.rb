F = File.read("#{__dir__}/data/day12.txt").lines

T1    = 20
T2    = 50000000000
INPUT = F.first.split(": ").last.strip.each_char.to_a
MAP   = F[2..F.size].map(&:strip)
            .map{ |m| m.split(" => ") }
            .reject{ |m| m.last != '#'}
            .to_h

def transform(data)
    (['.']*4 + data + ['.']*4).each_cons(5).map{ |g| MAP[g.join] ? '#' : '.' }
end

def calculate(data, iters)
    (-2*(iters)).upto(data.size - 2*(iters)).map{ |i|
        data[i + 2*(iters)] == '#' ? i : 0
    }.sum
end

ξ = (1..T2).lazy.each_with_object([INPUT]).map { |π, dd|
    nxtObject = transform(dd.last)
    nxtValue  = calculate(nxtObject, π)

    doned = dd.size > 10 &&
                dd.last(10).reverse.each_with_index.map{ |m, idx|
                    calculate(m, π - idx)
                }.each_cons(2).map{ |a, b| a - b}.uniq.size == 1

    dd << nxtObject

    [
        π,
        nxtValue,
        doned,
        dd.last(2).reverse.each_with_index.map{ |m, idx| calculate(m, π - idx)}.reduce{ |a, b| a - b}
    ]
}.take_while{ |_, _, ϵ, _| !ϵ }.to_a

puts "Ans 1: %s" % ξ.take(T1).last[1]
puts "Ans 2: %s" % (ξ.last[1] + (T2 - ξ.last.first) * ξ.last.last)
