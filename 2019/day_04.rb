Θ = [*(235741..706948)].select { @1.digits.sort == @1.digits.reverse }
Δ = [*(0..9)]

WR = Δ.map { |δ| [ [nil, *(Δ-[δ])], [[δ,δ]], [nil, *(Δ-[δ])]].inject(&:product).map(&:flatten) }.flatten(1)

puts "Ans 1: %d" % Θ.select { (@1.to_s.each_char.each_cons(2).map(&:join) & ([Δ]*2).inject(:zip).map(&:join)).any? }.size
puts "Ans 2: %d" % Θ.select { ([nil, *(@1.to_s.each_char.map(&:to_i)), nil].each_cons(4).to_a & WR).any? }.size
