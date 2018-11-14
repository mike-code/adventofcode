require 'digest'
F = File.read("#{__dir__}/data/day5.txt").scan(/\S+/m).first

def check(s, i)
	h = Digest::MD5.hexdigest(s + i.to_s)
	[h[5], h[6]] if h[0..4] === "00000"
end

puts "Ans1: %s" % (0..Float::INFINITY).lazy.collect{ |n| check(F, n) }.reject(&:nil?).map(&:first).first(8).join
puts "Ans2: %s" % (0..Float::INFINITY).lazy.collect{ |n| check(F, n) }.reject(&:nil?).select{ |a| Float(a.first) rescue false }.select{|a| (0..7).include? a.first.to_i }.map{ |k| [k.first, k.last] }.uniq(&:first).first(8).sort.map(&:last).join
