RISCV_GCC:=riscv64-unknown-elf-gcc
RISCV_FLAGS:=-O0 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -fno-pic  -I. -T./link.ld
RISCV_OBJDUMP:=riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes -D
ELF2HEX:=/chipyard/scripts/smartelf2hex.sh
HEX2BIN:=/scripts/hex2bin

# Programs to compile
src = $(wildcard handcrafted/*.S) $(wildcard fuzzer/*.S)  $(wildcard ./*.S)
DUMPS = $(src:.S=.asm)
BINS = $(src:.S=.bin)

.PHONY: all
all: $(BINS) $(DUMPS)
bin: $(BINS)
dumps: $(DUMPS)

%.bin: %.hex
	$(HEX2BIN) $< $@

%.hex: %.riscv
	$(ELF2HEX) $< > $@

%.asm: %.riscv
	$(RISCV_OBJDUMP) $< > $@

%.riscv: %.S
	$(RISCV_GCC) $(RISCV_FLAGS) $< -o $@

.PHONY: clean

clean:
	rm -f *.asm *.hex *.bin *.riscv
	cd handcrafted && rm -f *.asm *.hex *.bin *.riscv
	cd fuzzer && rm -f *.asm *.hex *.bin *.riscv
