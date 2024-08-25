OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  . = 0x80001000;
  .data : { *(.data) }
  _end = .;
}
