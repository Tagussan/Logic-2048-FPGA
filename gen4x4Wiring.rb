left = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]
right = left.map {|i| i.reverse }
up = left.transpose
down = left.transpose.map{|i| i.reverse}
def showMapping(ary)
    ary.each do |row|
        p row
    end
    puts ""
end
showMapping left
showMapping right
showMapping up
showMapping down
moves = [left, up, right, down]
moves.map! {|i|
    i.flatten
}
puts "4x4 -> left merge map"
for i in 0 ... moves.length
    puts "if (move == #{i}) begin" if i == 0
    puts " else if (move == #{i}) begin" if i != 0
    for j in 0 ... moves[i].length
        puts "    Y_all[#{j*5+4}:#{j*5}] <= X_all[#{moves[i][j]*5+4}:#{moves[i][j]*5}];"
    end
    print "end"
end
puts ""
puts "left merge map -> 4x4"
for i in 0 ... moves.length
    puts "if (move == #{i}) begin" if i == 0
    puts " else if (move == #{i}) begin" if i != 0
    for j in 0 ... moves[i].length
        puts "    Y_all[#{moves[i][j]*5+4}:#{moves[i][j]*5}] <= X_all[#{j*5+4}:#{j*5}];"
    end
    print "end"
end
puts ""
