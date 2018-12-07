F = File.read("#{__dir__}/data/day9.txt")

def decomp(ξ, Θ, special = false)
    pre, len, rep, Ψ = ξ.scan(/(?:(.*?)\((\d+)x(\d+)\))?(.*)/).first

    Θ = Θ + (len.nil? ?
        Ψ.size :
        pre.size + (special ? decomp(Ψ[0..len.to_i-1], 0, special) : len.to_i) * rep.to_i)

    len.nil? ? Θ : decomp(Ψ[len.to_i..Ψ.size], Θ, special)
end

puts "Ans 1: %s" % decomp(F, 0, false)
puts "Ans 2: %s" % decomp(F, 0, true)
