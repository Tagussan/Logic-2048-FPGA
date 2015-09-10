MAIN = logic2048
BENCH = tb_logic2048SingleLine
SOURCES = *.v
VERILOG = iverilog
WAVE = gtkwave

.PHONY: all
all: $(TOP).vcd

$(TOP).vcd:
	$(VERILOG) -o $(MAIN).out -s $(BENCH) $(SOURCES)
	./$(MAIN).out

wave: $(TOP).vcd
	$(WAVE) $(MAIN).vcd > /dev/null 2>&1 &

.PHONY: clean
clean:
	rm -rf *.vcd $(MAIN).out
