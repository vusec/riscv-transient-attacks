OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x80008000;
  .text : { *(.text) }
  . = 0x80009000;
  .data : { *(.data) }
  _end = .;
}
