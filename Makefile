RISCV_GCC:=riscv64-unknown-elf-gcc
RISCV_FLAGS:=-O0 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -fno-pic  -I. -T./link.ld
RISCV_OBJDUMP:=riscv64-unknown-elf-objdump --disassemble-all --disassemble-zeroes -D
ELF2HEX:=/chipyard/scripts/smartelf2hex.sh
HEX2BIN:=/scripts/hex2bin

BUILDDIR = build
BINDIR = $(BUILDDIR)/bins
DUMPDIR = $(BUILDDIR)/dumps
NODATADIR = $(BUILDDIR)/nodata
SRCDIR = src

# Programs to compile
SOURCES = $(wildcard src/*.S)

DUMPS = $(patsubst $(SRCDIR)/%.S,$(DUMPDIR)/%.asm,$(SOURCES))
BINS = $(patsubst $(SRCDIR)/%.S,$(BINDIR)/%.bin,$(SOURCES))
NODATABINS = $(patsubst $(SRCDIR)/%.S,$(NODATADIR)/%.bin,$(SOURCES))

.PHONY: all
all: $(BINS) $(DUMPS) $(NODATABINS)

bin: $(BINS)
nodata: $(NODATABINS)
dumps: $(DUMPS)

$(BINDIR)/%.bin: $(BUILDDIR)/%.hex
	$(HEX2BIN) $< $@

$(BUILDDIR)/%.hex: $(BUILDDIR)/%.riscv
	$(ELF2HEX) $< > $@

$(DUMPDIR)/%.asm: $(BUILDDIR)/%.riscv
	$(RISCV_OBJDUMP) $< > $@

$(BUILDDIR)/%.riscv: $(SRCDIR)/%.S
	$(RISCV_GCC) $(RISCV_FLAGS) $< -o $@


$(NODATADIR)/%.bin: $(NODATADIR)/%.hex
	$(HEX2BIN) $< $@

$(NODATADIR)/%.hex: $(NODATADIR)/%.riscv
	$(ELF2HEX) $< > $@

$(NODATADIR)/%.riscv: $(SRCDIR)/%.S
	$(RISCV_GCC) $(RISCV_FLAGS) -DNO_DATA $< -o $@

.PHONY: clean

clean:
	rm -rf $(BUILDDIR)
	mkdir -p $(BUILDDIR)
	mkdir -p $(DUMPDIR)
	mkdir -p $(BINDIR)
	mkdir -p $(NODATADIR)
