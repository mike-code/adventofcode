F = File.read("#{__dir__}/data/day05.txt").strip

ξ = F.each_char.uniq.sort.each_slice(26).reduce(&:zip).map(&:join).append('Ω').map{ |ϵ|
     (0..Float::INFINITY).lazy.each_with_object({}).take_while{ |ψ, π|
          Λ = (π[:α] || F.gsub(/[#{ϵ}]/, '') + '.').each_char.each_cons(2).map{|m|
               m unless m.first != m.last && (m.first === m.last.upcase || m.first.upcase === m.last)
          }.map{ |m| m.nil? ? '_' : m.first }.join.gsub(/\_./, '') + '.'

          π.merge! ({α: Λ, β: (π[:α].size unless π[:α].nil?)})

          Λ.size != π[:β]
     }.force.last.last[:β]-1
}

puts "Ans 1: %s" % ξ.max
puts "Ans 2: %s" % ξ.min
