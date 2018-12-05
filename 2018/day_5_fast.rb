F = File.read("#{__dir__}/data/day5.txt").strip.each_char.to_a

ξ = F.uniq.sort.each_slice(26).reduce(&:zip).append(['Ω']).map{ |ϵ|
     (F - ϵ).each_with_object([]) { |Ξ, ϕ|
          if(ϕ.last && Ξ != ϕ.last && (Ξ === ϕ.last.upcase || Ξ.upcase === ϕ.last))
               ϕ.pop
          else
               ϕ << Ξ
          end
     }.size
}

puts "Ans 1: %s" % ξ.max
puts "Ans 2: %s" % ξ.min
