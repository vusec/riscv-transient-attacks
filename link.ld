OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  . = ALIGN(0x60);
  .testdata : { *(.testdata) }
  . = ALIGN(0x1000);
  .melt_data : { *(.melt_data) }
  . = ALIGN(0x1000);
  .table1 : { *(.table1) }
  . = ALIGN(0x1000);
  .table2 : { *(.table2) }
  . = ALIGN(0x1000);
  .melt_utext : { *(.melt_utext) }
  . = ALIGN(0x1000);
  .melt_udata : { *(.melt_udata) }
  . = ALIGN(0x20000);
  .acode : { *(.acode) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  _end = .;
}
