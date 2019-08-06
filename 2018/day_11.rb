OFFSET = File.read("#{__dir__}/data/day11.txt").to_i

SIZE = 300

V = Array.new(SIZE) { Array.new(SIZE, nil) }

(0..(SIZE-1)).each { |x| (0..(SIZE-1)).each { |y|
    V[x][y] = (((x+11)*(y+1)+OFFSET)*(x+11)/100).to_s.reverse[0].to_i - 5
}}

def sol(τ)
  V.map { |row| row.each_cons(τ).to_a }
   .transpose
   .map { |q| q.each_cons(τ).to_a }
   .each_with_index.map { |row, y|
      row.each_with_index.map { |vals, x|
        [vals.map(&:sum).sum, [x+1, y+1]]
      }
   }
   .flatten(1)
   .max
end

puts "Ans 1: %s" % sol(9).last.join(',')
puts "Ans 2: %s" % (1..300).map { |n| sol(n) << n }.max[1..].flatten.join(',')
