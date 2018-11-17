F = File.read("#{__dir__}/data/day8.txt").lines
            .map{ |l| (l.scan(/(?:(rect) (\d+)x(\d+))/) + l.scan(/rotate (row|column) \w=(\d+) by (\d+)/)).flatten(1) }

disp = Array.new(6) { Array.new(50) {0} }

for item in F do
    action, f1, f2 = item[0].to_sym, item[1].to_i, item[2].to_i

    case action
        when :rect
            disp[0..f2-1].each{ |e| e.fill(1, 0, f1) }
        when :row
            disp[f1] = disp[f1].rotate -f2
        when :column
            a     = disp.transpose
            a[f1] = a[f1].rotate -f2
            disp  = a.transpose
    end
end

puts "Ans 1: %s" % disp.flatten.sum
puts "Ans 2:"
disp.each{ |row| puts row.map{ |i| i == 1 ? "█" : " "}.join }
