F = File.read("#{__dir__}/data/day10.txt").scan(/position=<(.+?),(.+?)> velocity=<(.+?),(.+?)>/).map{|m| m.map(&:to_i) }

PTS = F.map{|p|
    {pos: [p[0], p[1]], move: [p[2], p[3]]}
}

xmin, xmax, ymin, ymax = [0,0,0,0]
coords = []
i = 0
loop do
    i+= 1
    PTS.each { |p|
        p[:pos][0] += p[:move][0]
        p[:pos][1] += p[:move][1]
    }

    coords = PTS.map{ |p|
        p[:pos]
    }

    xmin, xmax = coords.map(&:first).minmax
    ymin, ymax = coords.map(&:last).minmax

    # puts "%s %s" % [ymin, ymax]

    break if ymax - ymin < 15
end

board = Array.new(ymax - ymin + 1) { Array.new(xmax - xmin + 1) {'.'} }

coords.each{ |c|
    board[c.last - ymin][c.first - xmin] = '#'
}

board.each{ |b|
    p b
}

p i
