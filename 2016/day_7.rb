F = File.read("#{__dir__}/data/day7.txt").lines.map{ |l| {
    :aba => l.scan(/[a-z]+(?=\[|$)/),
    :bab => l.scan(/(?<=\[)[a-z]+/),
}}

def Task1(arg)
    arg.map{ |w|
        w.each_char.each_cons(4).map{ |c|
            c[0] != c[1] and c[0..1] === c[2..3].reverse
        }
    }.flatten.any?
end

def Task2(abas, babs)
    abas.map{ |w|
        w.each_char.each_cons(3).map{ |c|
            c if c[0] != c[1] and c[0] == c[2]
        }.reject(&:nil?).map { |a|
            babs.map{ |bab| bab.include? (a[1] + a[0] + a[1]) }.any?
        }.any?
    }.any?
end

puts "Ans1: %s" % F.map{ |e| Task1(e[:bab]) ? false : Task1(e[:aba])}.count(true)
puts "Ans2: %s" % F.map{ |e| Task2(e[:aba], e[:bab]) }.count(true)
