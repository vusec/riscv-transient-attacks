#ifdef NODATA
  #padding
  .rep 64
  .dword 0x0
  .endr
#else
// this is the data section for user data
.section .data , "adw"
data:
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
  .dword 0xcacacafedeadbeef
#endif
