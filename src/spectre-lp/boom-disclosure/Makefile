RISCV_GCC:=riscv64-unknown-elf-gcc
RISCV_FLAGS:=-O0 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -fno-pic  -I. -T./link.ld -march=rv64g
RISCV_OBJDUMP:=riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes -D

# Programs to compile
SOURCES = poc.S

DUMPS = $(patsubst %.S,%.asm,$(SOURCES))
BINS = $(patsubst %.S,%.elf,$(SOURCES))

.PHONY: all
all: $(BINS) $(DUMPS)

bin: $(BINS)
dumps: $(DUMPS)

%.asm: %.elf
	$(RISCV_OBJDUMP) $< > $@

%.elf: %.S
	$(RISCV_GCC) $(RISCV_FLAGS) $< -o $@
