
handcrafted/spectreRSB.riscv:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <context_1>:
    80000000:	00001417          	auipc	s0,0x1
    80000004:	00040413          	mv	s0,s0
    80000008:	00001497          	auipc	s1,0x1
    8000000c:	07848493          	addi	s1,s1,120 # 80001080 <arr2>
    80000010:	4521                	li	a0,8
    80000012:	0001                	nop
    80000014:	008000ef          	jal	ra,8000001c <spec_code>
    80000018:	018000ef          	jal	ra,80000030 <context_switch>

000000008000001c <spec_code>:
    8000001c:	00a482b3          	add	t0,s1,a0
    80000020:	0002b283          	ld	t0,0(t0)
    80000024:	8082                	ret
    80000026:	00000013          	nop
    8000002a:	00000013          	nop
    8000002e:	0001                	nop

0000000080000030 <context_switch>:
    80000030:	00040503          	lb	a0,0(s0) # 80001000 <arr>
    80000034:	0ff57513          	andi	a0,a0,255
    80000038:	00000097          	auipc	ra,0x0
    8000003c:	0c808093          	addi	ra,ra,200 # 80000100 <context_2>
    80000040:	4299                	li	t0,6
    80000042:	025080b3          	mul	ra,ra,t0
    80000046:	0250c0b3          	div	ra,ra,t0
    8000004a:	025080b3          	mul	ra,ra,t0
    8000004e:	0250c0b3          	div	ra,ra,t0
    80000052:	8082                	ret
    80000054:	00000013          	nop
    80000058:	00000013          	nop
    8000005c:	00000013          	nop
    80000060:	00000013          	nop
    80000064:	00000013          	nop
    80000068:	00000013          	nop
    8000006c:	00000013          	nop
    80000070:	00000013          	nop
    80000074:	00000013          	nop
    80000078:	00000013          	nop
    8000007c:	00000013          	nop
    80000080:	00000013          	nop
    80000084:	00000013          	nop
    80000088:	00000013          	nop
    8000008c:	00000013          	nop
    80000090:	00000013          	nop
    80000094:	00000013          	nop
    80000098:	00000013          	nop
    8000009c:	00000013          	nop
    800000a0:	00000013          	nop
    800000a4:	00000013          	nop
    800000a8:	00000013          	nop
    800000ac:	00000013          	nop
    800000b0:	00000013          	nop
    800000b4:	00000013          	nop
    800000b8:	00000013          	nop
    800000bc:	00000013          	nop
    800000c0:	00000013          	nop
    800000c4:	00000013          	nop
    800000c8:	00000013          	nop
    800000cc:	00000013          	nop
    800000d0:	00000013          	nop
    800000d4:	00000013          	nop
    800000d8:	00000013          	nop
    800000dc:	00000013          	nop
    800000e0:	00000013          	nop
    800000e4:	00000013          	nop
    800000e8:	00000013          	nop
    800000ec:	00000013          	nop
    800000f0:	00000013          	nop
    800000f4:	00000013          	nop
    800000f8:	00000013          	nop
    800000fc:	00000013          	nop

0000000080000100 <context_2>:
    80000100:	0505                	addi	a0,a0,1
    80000102:	00a40023          	sb	a0,0(s0)
    80000106:	0000                	unimp
    80000108:	0000                	unimp
    8000010a:	0000                	unimp
    8000010c:	0000                	unimp
    8000010e:	0000                	unimp
    80000110:	0000                	unimp
    80000112:	0000                	unimp
    80000114:	0000                	unimp
    80000116:	0000                	unimp
    80000118:	0000                	unimp
    8000011a:	0000                	unimp
    8000011c:	0000                	unimp
    8000011e:	0000                	unimp
    80000120:	0000                	unimp
    80000122:	0000                	unimp
    80000124:	0000                	unimp
    80000126:	0000                	unimp
    80000128:	0000                	unimp
    8000012a:	0000                	unimp
    8000012c:	0000                	unimp
    8000012e:	0000                	unimp
    80000130:	0000                	unimp
    80000132:	0000                	unimp
    80000134:	0000                	unimp
    80000136:	0000                	unimp
    80000138:	0000                	unimp
    8000013a:	0000                	unimp
    8000013c:	0000                	unimp
    8000013e:	0000                	unimp
    80000140:	0000                	unimp
    80000142:	0000                	unimp
    80000144:	0000                	unimp
    80000146:	0000                	unimp
    80000148:	0000                	unimp
    8000014a:	0000                	unimp
    8000014c:	0000                	unimp
    8000014e:	0000                	unimp
    80000150:	0000                	unimp
    80000152:	0000                	unimp
    80000154:	0000                	unimp
    80000156:	0000                	unimp
    80000158:	0000                	unimp
    8000015a:	0000                	unimp
    8000015c:	0000                	unimp
    8000015e:	0000                	unimp
    80000160:	0000                	unimp
    80000162:	0000                	unimp
    80000164:	0000                	unimp
    80000166:	0000                	unimp
    80000168:	0000                	unimp
    8000016a:	0000                	unimp
    8000016c:	0000                	unimp
    8000016e:	0000                	unimp
    80000170:	0000                	unimp
    80000172:	0000                	unimp
    80000174:	0000                	unimp
    80000176:	0000                	unimp
    80000178:	0000                	unimp
    8000017a:	0000                	unimp
    8000017c:	0000                	unimp
    8000017e:	0000                	unimp
    80000180:	0000                	unimp
    80000182:	0000                	unimp
    80000184:	0000                	unimp
    80000186:	0000                	unimp
    80000188:	0000                	unimp
    8000018a:	0000                	unimp
    8000018c:	0000                	unimp
    8000018e:	0000                	unimp
    80000190:	0000                	unimp
    80000192:	0000                	unimp
    80000194:	0000                	unimp
    80000196:	0000                	unimp
    80000198:	0000                	unimp
    8000019a:	0000                	unimp
    8000019c:	0000                	unimp
    8000019e:	0000                	unimp
    800001a0:	0000                	unimp

Disassembly of section .data:

0000000080001000 <arr>:
    80001000:	0000                	unimp
    80001002:	0000                	unimp
    80001004:	0000                	unimp
    80001006:	0000                	unimp
    80001008:	0000                	unimp
    8000100a:	0000                	unimp
    8000100c:	0000                	unimp
    8000100e:	0000                	unimp
    80001010:	0000                	unimp
    80001012:	0000                	unimp
    80001014:	0000                	unimp
    80001016:	0000                	unimp
    80001018:	0000                	unimp
    8000101a:	0000                	unimp
    8000101c:	0000                	unimp
    8000101e:	0000                	unimp
    80001020:	0000                	unimp
    80001022:	0000                	unimp
    80001024:	0000                	unimp
    80001026:	0000                	unimp
    80001028:	0000                	unimp
    8000102a:	0000                	unimp
    8000102c:	0000                	unimp
    8000102e:	0000                	unimp
    80001030:	0000                	unimp
    80001032:	0000                	unimp
    80001034:	0000                	unimp
    80001036:	0000                	unimp
    80001038:	0000                	unimp
    8000103a:	0000                	unimp
    8000103c:	0000                	unimp
    8000103e:	0000                	unimp
    80001040:	0000                	unimp
    80001042:	0000                	unimp
    80001044:	0000                	unimp
    80001046:	0000                	unimp
    80001048:	0000                	unimp
    8000104a:	0000                	unimp
    8000104c:	0000                	unimp
    8000104e:	0000                	unimp
    80001050:	0000                	unimp
    80001052:	0000                	unimp
    80001054:	0000                	unimp
    80001056:	0000                	unimp
    80001058:	0000                	unimp
    8000105a:	0000                	unimp
    8000105c:	0000                	unimp
    8000105e:	0000                	unimp
    80001060:	0000                	unimp
    80001062:	0000                	unimp
    80001064:	0000                	unimp
    80001066:	0000                	unimp
    80001068:	0000                	unimp
    8000106a:	0000                	unimp
    8000106c:	0000                	unimp
    8000106e:	0000                	unimp
    80001070:	0000                	unimp
    80001072:	0000                	unimp
    80001074:	0000                	unimp
    80001076:	0000                	unimp
    80001078:	0000                	unimp
    8000107a:	0000                	unimp
    8000107c:	0000                	unimp
    8000107e:	0000                	unimp

0000000080001080 <arr2>:
    80001080:	deadbeef          	jal	t4,7ffdc66a <context_1-0x23996>
    80001084:	0000                	unimp
    80001086:	0000                	unimp
    80001088:	deadbeef          	jal	t4,7ffdc672 <context_1-0x2398e>
    8000108c:	0000                	unimp
    8000108e:	0000                	unimp
    80001090:	deadbeef          	jal	t4,7ffdc67a <context_1-0x23986>
    80001094:	0000                	unimp
    80001096:	0000                	unimp
    80001098:	deadbeef          	jal	t4,7ffdc682 <context_1-0x2397e>
    8000109c:	0000                	unimp
    8000109e:	0000                	unimp
    800010a0:	deadbeef          	jal	t4,7ffdc68a <context_1-0x23976>
    800010a4:	0000                	unimp
    800010a6:	0000                	unimp
    800010a8:	deadbeef          	jal	t4,7ffdc692 <context_1-0x2396e>
    800010ac:	0000                	unimp
    800010ae:	0000                	unimp
    800010b0:	deadbeef          	jal	t4,7ffdc69a <context_1-0x23966>
    800010b4:	0000                	unimp
    800010b6:	0000                	unimp
    800010b8:	deadbeef          	jal	t4,7ffdc6a2 <context_1-0x2395e>
    800010bc:	0000                	unimp
    800010be:	0000                	unimp
    800010c0:	deadbeef          	jal	t4,7ffdc6aa <context_1-0x23956>
    800010c4:	0000                	unimp
    800010c6:	0000                	unimp
    800010c8:	deadbeef          	jal	t4,7ffdc6b2 <context_1-0x2394e>
    800010cc:	0000                	unimp
    800010ce:	0000                	unimp
    800010d0:	deadbeef          	jal	t4,7ffdc6ba <context_1-0x23946>
    800010d4:	0000                	unimp
    800010d6:	0000                	unimp
    800010d8:	deadbeef          	jal	t4,7ffdc6c2 <context_1-0x2393e>
    800010dc:	0000                	unimp
    800010de:	0000                	unimp
    800010e0:	deadbeef          	jal	t4,7ffdc6ca <context_1-0x23936>
    800010e4:	0000                	unimp
    800010e6:	0000                	unimp
    800010e8:	deadbeef          	jal	t4,7ffdc6d2 <context_1-0x2392e>
    800010ec:	0000                	unimp
    800010ee:	0000                	unimp
    800010f0:	deadbeef          	jal	t4,7ffdc6da <context_1-0x23926>
    800010f4:	0000                	unimp
    800010f6:	0000                	unimp
    800010f8:	deadbeef          	jal	t4,7ffdc6e2 <context_1-0x2391e>
    800010fc:	0000                	unimp
    800010fe:	0000                	unimp
    80001100:	deadbeef          	jal	t4,7ffdc6ea <context_1-0x23916>
    80001104:	0000                	unimp
    80001106:	0000                	unimp
    80001108:	deadbeef          	jal	t4,7ffdc6f2 <context_1-0x2390e>
    8000110c:	0000                	unimp
    8000110e:	0000                	unimp

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3241                	addiw	tp,tp,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <context_1-0x7fffffec>
   c:	0028                	addi	a0,sp,8
   e:	0000                	unimp
  10:	7205                	lui	tp,0xfffe1
  12:	3676                	fld	fa2,376(sp)
  14:	6934                	ld	a3,80(a0)
  16:	7032                	0x7032
  18:	5f30                	lw	a2,120(a4)
  1a:	326d                	addiw	tp,tp,-5
  1c:	3070                	fld	fa2,224(s0)
  1e:	615f 7032 5f30      	0x5f307032615f
  24:	3266                	fld	ft4,120(sp)
  26:	3070                	fld	fa2,224(s0)
  28:	645f 7032 5f30      	0x5f307032645f
  2e:	30703263          	0x30703263
  32:	00              	Address 0x0000000000000032 is out of bounds.

