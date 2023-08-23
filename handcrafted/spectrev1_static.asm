
handcrafted/spectrev1_static.riscv:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <attacker>:
    80000000:	4501                	li	a0,0
    80000002:	0001                	nop
    80000004:	01c000ef          	jal	ra,80000020 <victim>
    80000008:	10000513          	li	a0,256
    8000000c:	014000ef          	jal	ra,80000020 <victim>

0000000080000010 <end>:
    80000010:	0000                	unimp
    80000012:	0001                	nop
    80000014:	00000013          	nop
    80000018:	00000013          	nop
    8000001c:	00000013          	nop

0000000080000020 <victim>:
    80000020:	00001297          	auipc	t0,0x1
    80000024:	fe028293          	addi	t0,t0,-32 # 80001000 <arr>
    80000028:	92aa                	add	t0,t0,a0
    8000002a:	4319                	li	t1,6
    8000002c:	02650533          	mul	a0,a0,t1
    80000030:	02654533          	div	a0,a0,t1
    80000034:	02650533          	mul	a0,a0,t1
    80000038:	02654533          	div	a0,a0,t1
    8000003c:	02000393          	li	t2,32
    80000040:	00755863          	bge	a0,t2,80000050 <func_end>
    80000044:	0002a283          	lw	t0,0(t0)
    80000048:	0285                	addi	t0,t0,1
    8000004a:	00000013          	nop
    8000004e:	0001                	nop

0000000080000050 <func_end>:
    80000050:	8082                	ret

Disassembly of section .data:

0000000080001000 <arr>:
    80001000:	cafe                	sw	t6,84(sp)
    80001002:	caca                	sw	s2,84(sp)
    80001004:	0000                	unimp
    80001006:	0000                	unimp
    80001008:	cafe                	sw	t6,84(sp)
    8000100a:	caca                	sw	s2,84(sp)
    8000100c:	0000                	unimp
    8000100e:	0000                	unimp
    80001010:	cafe                	sw	t6,84(sp)
    80001012:	caca                	sw	s2,84(sp)
    80001014:	0000                	unimp
    80001016:	0000                	unimp
    80001018:	cafe                	sw	t6,84(sp)
    8000101a:	caca                	sw	s2,84(sp)
    8000101c:	0000                	unimp
    8000101e:	0000                	unimp
    80001020:	cafe                	sw	t6,84(sp)
    80001022:	caca                	sw	s2,84(sp)
    80001024:	0000                	unimp
    80001026:	0000                	unimp
    80001028:	cafe                	sw	t6,84(sp)
    8000102a:	caca                	sw	s2,84(sp)
    8000102c:	0000                	unimp
    8000102e:	0000                	unimp
    80001030:	cafe                	sw	t6,84(sp)
    80001032:	caca                	sw	s2,84(sp)
    80001034:	0000                	unimp
    80001036:	0000                	unimp
    80001038:	cafe                	sw	t6,84(sp)
    8000103a:	caca                	sw	s2,84(sp)
    8000103c:	0000                	unimp
    8000103e:	0000                	unimp
    80001040:	cafe                	sw	t6,84(sp)
    80001042:	caca                	sw	s2,84(sp)
    80001044:	0000                	unimp
    80001046:	0000                	unimp
    80001048:	cafe                	sw	t6,84(sp)
    8000104a:	caca                	sw	s2,84(sp)
    8000104c:	0000                	unimp
    8000104e:	0000                	unimp
    80001050:	cafe                	sw	t6,84(sp)
    80001052:	caca                	sw	s2,84(sp)
    80001054:	0000                	unimp
    80001056:	0000                	unimp
    80001058:	cafe                	sw	t6,84(sp)
    8000105a:	caca                	sw	s2,84(sp)
    8000105c:	0000                	unimp
    8000105e:	0000                	unimp
    80001060:	cafe                	sw	t6,84(sp)
    80001062:	caca                	sw	s2,84(sp)
    80001064:	0000                	unimp
    80001066:	0000                	unimp
    80001068:	cafe                	sw	t6,84(sp)
    8000106a:	caca                	sw	s2,84(sp)
    8000106c:	0000                	unimp
    8000106e:	0000                	unimp
    80001070:	cafe                	sw	t6,84(sp)
    80001072:	caca                	sw	s2,84(sp)
    80001074:	0000                	unimp
    80001076:	0000                	unimp
    80001078:	cafe                	sw	t6,84(sp)
    8000107a:	caca                	sw	s2,84(sp)
    8000107c:	0000                	unimp
    8000107e:	0000                	unimp
    80001080:	fff0                	sd	a2,248(a5)
    80001082:	ffff                	0xffff
    80001084:	ffff                	0xffff
    80001086:	ffff                	0xffff
    80001088:	fff1                	bnez	a5,80001064 <arr+0x64>
    8000108a:	ffff                	0xffff
    8000108c:	ffff                	0xffff
    8000108e:	ffff                	0xffff
    80001090:	fff2                	sd	t3,504(sp)
    80001092:	ffff                	0xffff
    80001094:	ffff                	0xffff
    80001096:	ffff                	0xffff
    80001098:	fffffff3          	csrrci	t6,0xfff,31
    8000109c:	ffff                	0xffff
    8000109e:	ffff                	0xffff
    800010a0:	fff4                	sd	a3,248(a5)
    800010a2:	ffff                	0xffff
    800010a4:	ffff                	0xffff
    800010a6:	ffff                	0xffff
    800010a8:	fff5                	bnez	a5,800010a4 <arr+0xa4>
    800010aa:	ffff                	0xffff
    800010ac:	ffff                	0xffff
    800010ae:	ffff                	0xffff
    800010b0:	fff6                	sd	t4,504(sp)
    800010b2:	ffff                	0xffff
    800010b4:	ffff                	0xffff
    800010b6:	ffff                	0xffff
    800010b8:	fffffff7          	0xfffffff7
    800010bc:	ffff                	0xffff
    800010be:	ffff                	0xffff
    800010c0:	fff8                	sd	a4,248(a5)
    800010c2:	ffff                	0xffff
    800010c4:	ffff                	0xffff
    800010c6:	ffff                	0xffff
    800010c8:	fff9                	bnez	a5,800010a6 <arr+0xa6>
    800010ca:	ffff                	0xffff
    800010cc:	ffff                	0xffff
    800010ce:	ffff                	0xffff
    800010d0:	fffa                	sd	t5,504(sp)
    800010d2:	ffff                	0xffff
    800010d4:	ffff                	0xffff
    800010d6:	ffff                	0xffff
    800010d8:	fffffffb          	0xfffffffb
    800010dc:	ffff                	0xffff
    800010de:	ffff                	0xffff
    800010e0:	fffc                	sd	a5,248(a5)
    800010e2:	ffff                	0xffff
    800010e4:	ffff                	0xffff
    800010e6:	ffff                	0xffff
    800010e8:	fffd                	bnez	a5,800010e6 <arr+0xe6>
    800010ea:	ffff                	0xffff
    800010ec:	ffff                	0xffff
    800010ee:	ffff                	0xffff
    800010f0:	fffe                	sd	t6,504(sp)
    800010f2:	ffff                	0xffff
    800010f4:	ffff                	0xffff
    800010f6:	ffff                	0xffff
    800010f8:	ffff                	0xffff
    800010fa:	ffff                	0xffff
    800010fc:	ffff                	0xffff
    800010fe:	ffff                	0xffff
    80001100:	deadbeef          	jal	t4,7ffdc6ea <OOB_IDX+0x7ffdc5ea>
    80001104:	0000                	unimp
    80001106:	0000                	unimp
    80001108:	deadbeef          	jal	t4,7ffdc6f2 <OOB_IDX+0x7ffdc5f2>
    8000110c:	0000                	unimp
    8000110e:	0000                	unimp
    80001110:	deadbeef          	jal	t4,7ffdc6fa <OOB_IDX+0x7ffdc5fa>
    80001114:	0000                	unimp
    80001116:	0000                	unimp
    80001118:	deadbeef          	jal	t4,7ffdc702 <OOB_IDX+0x7ffdc602>
    8000111c:	0000                	unimp
    8000111e:	0000                	unimp
    80001120:	deadbeef          	jal	t4,7ffdc70a <OOB_IDX+0x7ffdc60a>
    80001124:	0000                	unimp
    80001126:	0000                	unimp
    80001128:	deadbeef          	jal	t4,7ffdc712 <OOB_IDX+0x7ffdc612>
    8000112c:	0000                	unimp
    8000112e:	0000                	unimp
    80001130:	deadbeef          	jal	t4,7ffdc71a <OOB_IDX+0x7ffdc61a>
    80001134:	0000                	unimp
    80001136:	0000                	unimp
    80001138:	deadbeef          	jal	t4,7ffdc722 <OOB_IDX+0x7ffdc622>
    8000113c:	0000                	unimp
    8000113e:	0000                	unimp
    80001140:	deadbeef          	jal	t4,7ffdc72a <OOB_IDX+0x7ffdc62a>
    80001144:	0000                	unimp
    80001146:	0000                	unimp
    80001148:	deadbeef          	jal	t4,7ffdc732 <OOB_IDX+0x7ffdc632>
    8000114c:	0000                	unimp
    8000114e:	0000                	unimp
    80001150:	deadbeef          	jal	t4,7ffdc73a <OOB_IDX+0x7ffdc63a>
    80001154:	0000                	unimp
    80001156:	0000                	unimp
    80001158:	deadbeef          	jal	t4,7ffdc742 <OOB_IDX+0x7ffdc642>
    8000115c:	0000                	unimp
    8000115e:	0000                	unimp
    80001160:	deadbeef          	jal	t4,7ffdc74a <OOB_IDX+0x7ffdc64a>
    80001164:	0000                	unimp
    80001166:	0000                	unimp
    80001168:	deadbeef          	jal	t4,7ffdc752 <OOB_IDX+0x7ffdc652>
    8000116c:	0000                	unimp
    8000116e:	0000                	unimp
    80001170:	deadbeef          	jal	t4,7ffdc75a <OOB_IDX+0x7ffdc65a>
    80001174:	0000                	unimp
    80001176:	0000                	unimp
    80001178:	deadbeef          	jal	t4,7ffdc762 <OOB_IDX+0x7ffdc662>
    8000117c:	0000                	unimp
    8000117e:	0000                	unimp
    80001180:	deadbeef          	jal	t4,7ffdc76a <OOB_IDX+0x7ffdc66a>
    80001184:	0000                	unimp
    80001186:	0000                	unimp
    80001188:	deadbeef          	jal	t4,7ffdc772 <OOB_IDX+0x7ffdc672>
    8000118c:	0000                	unimp
    8000118e:	0000                	unimp

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3241                	addiw	tp,tp,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <NON_POWER_OF_2+0xe>
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

