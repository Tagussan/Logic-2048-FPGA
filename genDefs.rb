for i in 0...4 do
    print "logic2048SingleLine logicL#{i}("
    for j in 0...4 do
        print ".x#{j}(rotated[#{(i*4+j)*5+4}:#{(i*4+j)*5}]), "
    end
    for j in 0...4 do
        print ".y#{j}(merged[#{(i*4+j)*5+4}:#{(i*4+j)*5}]), "
    end
    print ".movable(movable#{i})"
    print ");\n"
end

for i in (0...4) do
    print '$display("%d %d %d %d",'
    for j in (0...4).to_a.reverse do
        print "board_in[#{(i*4+j)*5+4}:#{(i*4+j)*5}], "
    end
    print ");\n"
end
