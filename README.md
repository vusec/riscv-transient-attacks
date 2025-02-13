# RISC-V Samples

Various samples used to test the [Phantom Trails](https://github.com/vusec/phantom-trails)
pre-silicon detector on [BOOM](https://github.com/riscv-boom/riscv-boom).

## Building

```bash
make
```

For each `.S` file inside of `src/*` 3 outputs are produced:

- `build/bins/` contains the compiled RISC-V flat binary ready to be copied into the simulation DRAM
- `build/nodata/` contains a version of the flat binary that is stripped of any data section
- `build/dumps/` contains the objdump of the samples

See `link.ld` for more information about the layout of the output binaries.

## Transient Leakage PoCs

See `src/pocs`. All PoCs are meant to run _after_ initialization.

## Spectre-LP

See `src/spectre-lp`. All PoCs are meant to run _after_ initialization.

See `src/spectre-lp/boom-disclosure/README.md` to reproduce on "stock" BOOM.
