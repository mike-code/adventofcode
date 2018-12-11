F = File.read("#{__dir__}/data/day10.txt").scan(/position=<(.+?),(.+?)> velocity=<(.+?),(.+?)>/)
            .map{ |m| m.flatten.map(&:to_i) }

ITERS = (1..Float::INFINITY).lazy.each_with_object(F).
            map { |iter, acc|
                acc.map! { |m| # thx @KrzaQ
                    χ, γ, δχ, δγ = m.flatten.map(&:to_i)
                    [χ+δχ, γ+δγ, δχ, δγ]
                }

                ymin, ymax = acc.map{ |y| y[1] }.minmax
                [ymax - ymin, iter]
            }.take_while { |a| a.first > 15 }.to_a.last.last.to_i

COORDS     = F.map{|x| x.take(2) }
XMIN, XMAX = COORDS.map(&:first).minmax
YMIN, YMAX = COORDS.map(&:last).minmax

puts "Ans 1:"
(YMIN..YMAX).each do |y|
    (XMIN..XMAX).each do |x|
        print (COORDS.include? [x,y]) ? '###' : '   '
    end
    puts
end

puts "Ans 2: %s" % (ITERS + 1)
