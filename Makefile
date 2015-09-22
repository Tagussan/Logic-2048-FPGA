MAIN = logic2048
BENCH = tb_logic2048
SOURCES = random-seq-gen/*.v *.v
VERILOG = iverilog
WAVE = gtkwave

.PHONY: all
all: $(MAIN).out

.PHONY: wave
wave: $(MAIN).out
	./$(MAIN).out
	$(WAVE) $(BENCH).vcd > /dev/null 2>&1 &

$(MAIN).out: $(SOURCES)
	$(VERILOG) -o $(MAIN).out -s $(BENCH) $(SOURCES)

.PHONY: clean
clean:
	rm -rf *.vcd *.out
