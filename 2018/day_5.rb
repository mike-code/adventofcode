F = File.read("#{__dir__}/data/day5.txt").strip

ξ = F.each_char.uniq.sort.each_slice(26).reduce(&:zip).map(&:join).append('Ω').map{ |ϵ|
     (0..Float::INFINITY).lazy.each_with_object({}).take_while{ |ψ, Ξ|
          Λ = (Ξ[:α] || F.gsub(/[#{ϵ}]/, '') + '.').each_char.each_cons(2).map{|m|
               m unless m.first != m.last && (m.first === m.last.upcase || m.first.upcase === m.last)
          }.map{ |m| m.nil? ? '_' : m.first }.join.gsub(/\_./, '') + '.'

          Ξ.merge! ({α: Λ, β: (Ξ[:α].size unless Ξ[:α].nil?)})

          Λ.size != Ξ[:β]
     }.force.last.last[:β]-1
}

puts "Ans 1: %s" % ξ.max
puts "Ans 2: %s" % ξ.min
