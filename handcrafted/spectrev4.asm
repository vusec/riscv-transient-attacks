
handcrafted/spectrev4.riscv:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <setup>:
    80000000:	00001417          	auipc	s0,0x1
    80000004:	00040413          	mv	s0,s0
    80000008:	00001497          	auipc	s1,0x1
    8000000c:	07848493          	addi	s1,s1,120 # 80001080 <secret>
    80000010:	00001917          	auipc	s2,0x1
    80000014:	0f090913          	addi	s2,s2,240 # 80001100 <probe>
    80000018:	0004b283          	ld	t0,0(s1)
    8000001c:	0ff0000f          	fence

0000000080000020 <attack>:
    80000020:	00543023          	sd	t0,0(s0) # 80001000 <public>
    80000024:	4319                	li	t1,6
    80000026:	83a2                	mv	t2,s0
    80000028:	026383b3          	mul	t2,t2,t1
    8000002c:	0263c3b3          	div	t2,t2,t1
    80000030:	026383b3          	mul	t2,t2,t1
    80000034:	0263c3b3          	div	t2,t2,t1
    80000038:	4321                	li	t1,8
    8000003a:	0063b023          	sd	t1,0(t2)
    8000003e:	00043283          	ld	t0,0(s0)
    80000042:	0ff2f293          	andi	t0,t0,255
    80000046:	92ca                	add	t0,t0,s2
    80000048:	0002b303          	ld	t1,0(t0)
    8000004c:	0000                	unimp

Disassembly of section .data:

0000000080001000 <public>:
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

0000000080001080 <secret>:
    80001080:	c0c0                	sw	s0,4(s1)
    80001082:	cafe                	sw	t6,84(sp)
    80001084:	0000                	unimp
    80001086:	0000                	unimp
    80001088:	c0c0                	sw	s0,4(s1)
    8000108a:	cafe                	sw	t6,84(sp)
    8000108c:	0000                	unimp
    8000108e:	0000                	unimp
    80001090:	c0c0                	sw	s0,4(s1)
    80001092:	cafe                	sw	t6,84(sp)
    80001094:	0000                	unimp
    80001096:	0000                	unimp
    80001098:	c0c0                	sw	s0,4(s1)
    8000109a:	cafe                	sw	t6,84(sp)
    8000109c:	0000                	unimp
    8000109e:	0000                	unimp
    800010a0:	c0c0                	sw	s0,4(s1)
    800010a2:	cafe                	sw	t6,84(sp)
    800010a4:	0000                	unimp
    800010a6:	0000                	unimp
    800010a8:	c0c0                	sw	s0,4(s1)
    800010aa:	cafe                	sw	t6,84(sp)
    800010ac:	0000                	unimp
    800010ae:	0000                	unimp
    800010b0:	c0c0                	sw	s0,4(s1)
    800010b2:	cafe                	sw	t6,84(sp)
    800010b4:	0000                	unimp
    800010b6:	0000                	unimp
    800010b8:	c0c0                	sw	s0,4(s1)
    800010ba:	cafe                	sw	t6,84(sp)
    800010bc:	0000                	unimp
    800010be:	0000                	unimp
    800010c0:	c0c0                	sw	s0,4(s1)
    800010c2:	cafe                	sw	t6,84(sp)
    800010c4:	0000                	unimp
    800010c6:	0000                	unimp
    800010c8:	c0c0                	sw	s0,4(s1)
    800010ca:	cafe                	sw	t6,84(sp)
    800010cc:	0000                	unimp
    800010ce:	0000                	unimp
    800010d0:	c0c0                	sw	s0,4(s1)
    800010d2:	cafe                	sw	t6,84(sp)
    800010d4:	0000                	unimp
    800010d6:	0000                	unimp
    800010d8:	c0c0                	sw	s0,4(s1)
    800010da:	cafe                	sw	t6,84(sp)
    800010dc:	0000                	unimp
    800010de:	0000                	unimp
    800010e0:	c0c0                	sw	s0,4(s1)
    800010e2:	cafe                	sw	t6,84(sp)
    800010e4:	0000                	unimp
    800010e6:	0000                	unimp
    800010e8:	c0c0                	sw	s0,4(s1)
    800010ea:	cafe                	sw	t6,84(sp)
    800010ec:	0000                	unimp
    800010ee:	0000                	unimp
    800010f0:	c0c0                	sw	s0,4(s1)
    800010f2:	cafe                	sw	t6,84(sp)
    800010f4:	0000                	unimp
    800010f6:	0000                	unimp
    800010f8:	c0c0                	sw	s0,4(s1)
    800010fa:	cafe                	sw	t6,84(sp)
    800010fc:	0000                	unimp
    800010fe:	0000                	unimp

0000000080001100 <probe>:
    80001100:	deadbeef          	jal	t4,7ffdc6ea <setup-0x23916>
    80001104:	0000                	unimp
    80001106:	0000                	unimp
    80001108:	deadbeef          	jal	t4,7ffdc6f2 <setup-0x2390e>
    8000110c:	0000                	unimp
    8000110e:	0000                	unimp
    80001110:	deadbeef          	jal	t4,7ffdc6fa <setup-0x23906>
    80001114:	0000                	unimp
    80001116:	0000                	unimp
    80001118:	deadbeef          	jal	t4,7ffdc702 <setup-0x238fe>
    8000111c:	0000                	unimp
    8000111e:	0000                	unimp
    80001120:	deadbeef          	jal	t4,7ffdc70a <setup-0x238f6>
    80001124:	0000                	unimp
    80001126:	0000                	unimp
    80001128:	deadbeef          	jal	t4,7ffdc712 <setup-0x238ee>
    8000112c:	0000                	unimp
    8000112e:	0000                	unimp
    80001130:	deadbeef          	jal	t4,7ffdc71a <setup-0x238e6>
    80001134:	0000                	unimp
    80001136:	0000                	unimp
    80001138:	deadbeef          	jal	t4,7ffdc722 <setup-0x238de>
    8000113c:	0000                	unimp
    8000113e:	0000                	unimp
    80001140:	deadbeef          	jal	t4,7ffdc72a <setup-0x238d6>
    80001144:	0000                	unimp
    80001146:	0000                	unimp
    80001148:	deadbeef          	jal	t4,7ffdc732 <setup-0x238ce>
    8000114c:	0000                	unimp
    8000114e:	0000                	unimp
    80001150:	deadbeef          	jal	t4,7ffdc73a <setup-0x238c6>
    80001154:	0000                	unimp
    80001156:	0000                	unimp
    80001158:	deadbeef          	jal	t4,7ffdc742 <setup-0x238be>
    8000115c:	0000                	unimp
    8000115e:	0000                	unimp
    80001160:	deadbeef          	jal	t4,7ffdc74a <setup-0x238b6>
    80001164:	0000                	unimp
    80001166:	0000                	unimp
    80001168:	deadbeef          	jal	t4,7ffdc752 <setup-0x238ae>
    8000116c:	0000                	unimp
    8000116e:	0000                	unimp
    80001170:	deadbeef          	jal	t4,7ffdc75a <setup-0x238a6>
    80001174:	0000                	unimp
    80001176:	0000                	unimp
    80001178:	deadbeef          	jal	t4,7ffdc762 <setup-0x2389e>
    8000117c:	0000                	unimp
    8000117e:	0000                	unimp
    80001180:	deadbeef          	jal	t4,7ffdc76a <setup-0x23896>
    80001184:	0000                	unimp
    80001186:	0000                	unimp
    80001188:	deadbeef          	jal	t4,7ffdc772 <setup-0x2388e>
    8000118c:	0000                	unimp
    8000118e:	0000                	unimp
    80001190:	deadbeef          	jal	t4,7ffdc77a <setup-0x23886>
    80001194:	0000                	unimp
    80001196:	0000                	unimp
    80001198:	deadbeef          	jal	t4,7ffdc782 <setup-0x2387e>
    8000119c:	0000                	unimp
    8000119e:	0000                	unimp
    800011a0:	deadbeef          	jal	t4,7ffdc78a <setup-0x23876>
    800011a4:	0000                	unimp
    800011a6:	0000                	unimp
    800011a8:	deadbeef          	jal	t4,7ffdc792 <setup-0x2386e>
    800011ac:	0000                	unimp
    800011ae:	0000                	unimp
    800011b0:	deadbeef          	jal	t4,7ffdc79a <setup-0x23866>
    800011b4:	0000                	unimp
    800011b6:	0000                	unimp
    800011b8:	deadbeef          	jal	t4,7ffdc7a2 <setup-0x2385e>
    800011bc:	0000                	unimp
    800011be:	0000                	unimp
    800011c0:	deadbeef          	jal	t4,7ffdc7aa <setup-0x23856>
    800011c4:	0000                	unimp
    800011c6:	0000                	unimp
    800011c8:	deadbeef          	jal	t4,7ffdc7b2 <setup-0x2384e>
    800011cc:	0000                	unimp
    800011ce:	0000                	unimp
    800011d0:	deadbeef          	jal	t4,7ffdc7ba <setup-0x23846>
    800011d4:	0000                	unimp
    800011d6:	0000                	unimp
    800011d8:	deadbeef          	jal	t4,7ffdc7c2 <setup-0x2383e>
    800011dc:	0000                	unimp
    800011de:	0000                	unimp
    800011e0:	deadbeef          	jal	t4,7ffdc7ca <setup-0x23836>
    800011e4:	0000                	unimp
    800011e6:	0000                	unimp
    800011e8:	deadbeef          	jal	t4,7ffdc7d2 <setup-0x2382e>
    800011ec:	0000                	unimp
    800011ee:	0000                	unimp
    800011f0:	deadbeef          	jal	t4,7ffdc7da <setup-0x23826>
    800011f4:	0000                	unimp
    800011f6:	0000                	unimp
    800011f8:	deadbeef          	jal	t4,7ffdc7e2 <setup-0x2381e>
    800011fc:	0000                	unimp
    800011fe:	0000                	unimp

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	3241                	addiw	tp,tp,-16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <setup-0x7fffffec>
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

