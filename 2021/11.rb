F = File.read("#{__dir__}/data/11.txt").scan(/\d/).map(&:to_i)

class Integer
  def inc; self + 1; end
  def res; self < 0 ? 0 : self; end
  def L?;  self % 10 == 0; end
  def R?;  self % 10 == 9; end
  def U?;  self < 10; end
  def D?;  self > 89; end
end

Ξ = -> ω {
	F[ω]     = -999
	F[ω-1]  += 1 unless ω.L?
	F[ω+1]  += 1 unless ω.R?
	F[ω-10] += 1 unless ω.U?
	F[ω+10] += 1 unless ω.D?
	F[ω-11] += 1 unless ω.U? or ω.L?
	F[ω+11] += 1 unless ω.D? or ω.R?
	F[ω-9]  += 1 unless ω.U? or ω.R?
	F[ω+9]  += 1 unless ω.D? or ω.L?
}

(1..Float::INFINITY).lazy.each_with_object([]) { |β, δ|
	F.map!(&:res).map!(&:inc)

	loop until F.size.times.select { F[_1] > 9 }.each { δ << Ξ.(_1) }.empty?

	(puts "Ans 1: %d" % δ.size) if β == 100
	(puts "Ans 2: %d" % β; break) if F.select(&:negative?).size == 100
}
