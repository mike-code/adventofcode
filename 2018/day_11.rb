OFFSET = File.read("#{__dir__}/data/day11.txt").to_i

SIZE = 300
N = 3

V = Array.new(SIZE) { Array.new(SIZE, nil) }

(0..(SIZE-1)).each { |x| (0..(SIZE-1)).each { |y|
    V[x][y] = (((x+11)*(y+1)+OFFSET)*(x+11)/100).to_s.reverse[0].to_i - 5
}}

p V.map { |row| row.each_cons(N).to_a }
   .transpose
   .map { |q| q.each_cons(N).to_a }
   .each_with_index.map { |row, y|
    row.each_with_index.map { |vals, x|
        [vals.flatten.sum, [x+1, y+1]]
    }
   }
   .flatten(1)
   .max
