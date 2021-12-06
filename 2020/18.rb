F = File.read("#{__dir__}/data/18.txt").lines.map(&:chomp)

class Fixnum
  def -(ϕ)
    return self * ϕ
  end

  def /(ϕ)
  	return self + ϕ
  end
end

puts "Ans 1: %d" %  F.map { |l| eval(l.gsub(/\*/,'-')) }.sum
puts "Ans 2: %d" %  F.map { |l| eval(l.gsub(/\*/,'-').gsub(/\+/, '/')) }.sum
