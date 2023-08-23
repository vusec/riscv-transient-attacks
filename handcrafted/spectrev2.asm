
handcrafted/spectrev2.riscv:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <setup>:
    80000000:	00001417          	auipc	s0,0x1
    80000004:	00040413          	mv	s0,s0
    80000008:	00000297          	auipc	t0,0x0
    8000000c:	07828293          	addi	t0,t0,120 # 80000080 <legit_target>
    80000010:	00543023          	sd	t0,0(s0) # 80001000 <jump_table>
    80000014:	00000297          	auipc	t0,0x0
    80000018:	07c28293          	addi	t0,t0,124 # 80000090 <leak_target>
    8000001c:	00543823          	sd	t0,16(s0)
    80000020:	0ff0000f          	fence

0000000080000024 <attacker>:
    80000024:	4541                	li	a0,16
    80000026:	00001597          	auipc	a1,0x1
    8000002a:	01a58593          	addi	a1,a1,26 # 80001040 <arr>
    8000002e:	0001                	nop
    80000030:	020000ef          	jal	ra,80000050 <victim>
    80000034:	4501                	li	a0,0
    80000036:	00001597          	auipc	a1,0x1
    8000003a:	00a58593          	addi	a1,a1,10 # 80001040 <arr>
    8000003e:	10058593          	addi	a1,a1,256
    80000042:	0001                	nop
    80000044:	00c000ef          	jal	ra,80000050 <victim>
    80000048:	0000                	unimp
    8000004a:	00000013          	nop
    8000004e:	0001                	nop

0000000080000050 <victim>:
    80000050:	8486                	mv	s1,ra
    80000052:	00001297          	auipc	t0,0x1
    80000056:	fae28293          	addi	t0,t0,-82 # 80001000 <jump_table>
    8000005a:	92aa                	add	t0,t0,a0
    8000005c:	0002b303          	ld	t1,0(t0)
    80000060:	4399                	li	t2,6
    80000062:	02730333          	mul	t1,t1,t2
    80000066:	02734333          	div	t1,t1,t2
    8000006a:	02730333          	mul	t1,t1,t2
    8000006e:	02734333          	div	t1,t1,t2
    80000072:	0001                	nop
    80000074:	000300e7          	jalr	t1
    80000078:	80a6                	mv	ra,s1
    8000007a:	8082                	ret
    8000007c:	00000013          	nop

0000000080000080 <legit_target>:
    80000080:	8082                	ret
    80000082:	0001                	nop
    80000084:	00000013          	nop
    80000088:	00000013          	nop
    8000008c:	00000013          	nop

0000000080000090 <leak_target>:
    80000090:	0005a283          	lw	t0,0(a1)
    80000094:	8082                	ret

Disassembly of section .data:

0000000080001000 <jump_table>:
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

0000000080001040 <arr>:
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
    80001080:	cafe                	sw	t6,84(sp)
    80001082:	caca                	sw	s2,84(sp)
    80001084:	0000                	unimp
    80001086:	0000                	unimp
    80001088:	cafe                	sw	t6,84(sp)
    8000108a:	caca                	sw	s2,84(sp)
    8000108c:	0000                	unimp
    8000108e:	0000                	unimp
    80001090:	cafe                	sw	t6,84(sp)
    80001092:	caca                	sw	s2,84(sp)
    80001094:	0000                	unimp
    80001096:	0000                	unimp
    80001098:	cafe                	sw	t6,84(sp)
    8000109a:	caca                	sw	s2,84(sp)
    8000109c:	0000                	unimp
    8000109e:	0000                	unimp
    800010a0:	cafe                	sw	t6,84(sp)
    800010a2:	caca                	sw	s2,84(sp)
    800010a4:	0000                	unimp
    800010a6:	0000                	unimp
    800010a8:	cafe                	sw	t6,84(sp)
    800010aa:	caca                	sw	s2,84(sp)
    800010ac:	0000                	unimp
    800010ae:	0000                	unimp
    800010b0:	cafe                	sw	t6,84(sp)
    800010b2:	caca                	sw	s2,84(sp)
    800010b4:	0000                	unimp
    800010b6:	0000                	unimp
    800010b8:	cafe                	sw	t6,84(sp)
    800010ba:	caca                	sw	s2,84(sp)
    800010bc:	0000                	unimp
    800010be:	0000                	unimp
    800010c0:	fff0                	sd	a2,248(a5)
    800010c2:	ffff                	0xffff
    800010c4:	ffff                	0xffff
    800010c6:	ffff                	0xffff
    800010c8:	fff1                	bnez	a5,800010a4 <arr+0x64>
    800010ca:	ffff                	0xffff
    800010cc:	ffff                	0xffff
    800010ce:	ffff                	0xffff
    800010d0:	fff2                	sd	t3,504(sp)
    800010d2:	ffff                	0xffff
    800010d4:	ffff                	0xffff
    800010d6:	ffff                	0xffff
    800010d8:	fffffff3          	csrrci	t6,0xfff,31
    800010dc:	ffff                	0xffff
    800010de:	ffff                	0xffff
    800010e0:	fff4                	sd	a3,248(a5)
    800010e2:	ffff                	0xffff
    800010e4:	ffff                	0xffff
    800010e6:	ffff                	0xffff
    800010e8:	fff5                	bnez	a5,800010e4 <arr+0xa4>
    800010ea:	ffff                	0xffff
    800010ec:	ffff                	0xffff
    800010ee:	ffff                	0xffff
    800010f0:	fff6                	sd	t4,504(sp)
    800010f2:	ffff                	0xffff
    800010f4:	ffff                	0xffff
    800010f6:	ffff                	0xffff
    800010f8:	fffffff7          	0xfffffff7
    800010fc:	ffff                	0xffff
    800010fe:	ffff                	0xffff
    80001100:	fff8                	sd	a4,248(a5)
    80001102:	ffff                	0xffff
    80001104:	ffff                	0xffff
    80001106:	ffff                	0xffff
    80001108:	fff9                	bnez	a5,800010e6 <arr+0xa6>
    8000110a:	ffff                	0xffff
    8000110c:	ffff                	0xffff
    8000110e:	ffff                	0xffff
    80001110:	fffa                	sd	t5,504(sp)
    80001112:	ffff                	0xffff
    80001114:	ffff                	0xffff
    80001116:	ffff                	0xffff
    80001118:	fffffffb          	0xfffffffb
    8000111c:	ffff                	0xffff
    8000111e:	ffff                	0xffff
    80001120:	fffc                	sd	a5,248(a5)
    80001122:	ffff                	0xffff
    80001124:	ffff                	0xffff
    80001126:	ffff                	0xffff
    80001128:	fffd                	bnez	a5,80001126 <arr+0xe6>
    8000112a:	ffff                	0xffff
    8000112c:	ffff                	0xffff
    8000112e:	ffff                	0xffff
    80001130:	fffe                	sd	t6,504(sp)
    80001132:	ffff                	0xffff
    80001134:	ffff                	0xffff
    80001136:	ffff                	0xffff
    80001138:	ffff                	0xffff
    8000113a:	ffff                	0xffff
    8000113c:	ffff                	0xffff
    8000113e:	ffff                	0xffff
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
    80001190:	deadbeef          	jal	t4,7ffdc77a <OOB_IDX+0x7ffdc67a>
    80001194:	0000                	unimp
    80001196:	0000                	unimp
    80001198:	deadbeef          	jal	t4,7ffdc782 <OOB_IDX+0x7ffdc682>
    8000119c:	0000                	unimp
    8000119e:	0000                	unimp
    800011a0:	deadbeef          	jal	t4,7ffdc78a <OOB_IDX+0x7ffdc68a>
    800011a4:	0000                	unimp
    800011a6:	0000                	unimp
    800011a8:	deadbeef          	jal	t4,7ffdc792 <OOB_IDX+0x7ffdc692>
    800011ac:	0000                	unimp
    800011ae:	0000                	unimp
    800011b0:	deadbeef          	jal	t4,7ffdc79a <OOB_IDX+0x7ffdc69a>
    800011b4:	0000                	unimp
    800011b6:	0000                	unimp
    800011b8:	deadbeef          	jal	t4,7ffdc7a2 <OOB_IDX+0x7ffdc6a2>
    800011bc:	0000                	unimp
    800011be:	0000                	unimp
    800011c0:	deadbeef          	jal	t4,7ffdc7aa <OOB_IDX+0x7ffdc6aa>
    800011c4:	0000                	unimp
    800011c6:	0000                	unimp
    800011c8:	deadbeef          	jal	t4,7ffdc7b2 <OOB_IDX+0x7ffdc6b2>
    800011cc:	0000                	unimp
    800011ce:	0000                	unimp

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3241                	addiw	tp,tp,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <LEAK_FUNC_IDX+0x4>
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

