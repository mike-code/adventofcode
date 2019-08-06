F = File.read("#{__dir__}/data/day05.txt").strip.each_char.to_a

ξ = F.uniq.sort.each_slice(26).reduce(&:zip).append(['Ω']).map { |ϵ|
     (F - ϵ).each_with_object([]) { |π, ϕ|
          ϕ.last && (π.ord - ϕ.last.ord).abs == 32 ? ϕ.pop : ϕ << π
     }.size
}

puts "Ans 1: %s" % ξ.max
puts "Ans 2: %s" % ξ.min
