F = File.read("#{__dir__}/data/day8.txt").split.map(&:to_i)

def P1(Θ)
    child, meta = Θ.shift(2)

    (1..child).map { P1(Θ) } + Θ.shift(meta)
end

def P2(Θ)
    child, meta = Θ.shift(2)

    out  = (1..child).map { P2(Θ) }
    mData = Θ.shift(meta)

    child > 0 ? mData.map{ |g| out[g-1] } : mData.sum
end

puts "Ans1: %s" % P1(F.dup).flatten.sum
puts "Ans2: %s" % P2(F).flatten.reject(&:nil?).sum
