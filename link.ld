OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x80000000;
  .text.init : { *(.text.init) }
  . = ALIGN(0x1000);
  .text : { *(.text) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  . = ALIGN(0x1000);
  .far : { *(.far) }
  _end = .;
}
