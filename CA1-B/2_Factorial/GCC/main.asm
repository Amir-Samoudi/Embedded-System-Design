
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

000100b4 <exit>:
   100b4:	ff010113          	addi	sp,sp,-16
   100b8:	00000593          	li	a1,0
   100bc:	00812423          	sw	s0,8(sp)
   100c0:	00112623          	sw	ra,12(sp)
   100c4:	00050413          	mv	s0,a0
   100c8:	2fd000ef          	jal	10bc4 <__call_exitprocs>
   100cc:	d481a783          	lw	a5,-696(gp) # 13638 <__stdio_exit_handler>
   100d0:	00078463          	beqz	a5,100d8 <exit+0x24>
   100d4:	000780e7          	jalr	a5
   100d8:	00040513          	mv	a0,s0
   100dc:	64d010ef          	jal	11f28 <_exit>

000100e0 <register_fini>:
   100e0:	00000793          	li	a5,0
   100e4:	00078863          	beqz	a5,100f4 <register_fini+0x14>
   100e8:	00012537          	lui	a0,0x12
   100ec:	df050513          	addi	a0,a0,-528 # 11df0 <__libc_fini_array>
   100f0:	4090006f          	j	10cf8 <atexit>
   100f4:	00008067          	ret

000100f8 <_start>:
   100f8:	00003197          	auipc	gp,0x3
   100fc:	7f818193          	addi	gp,gp,2040 # 138f0 <__global_pointer$>
   10100:	00003517          	auipc	a0,0x3
   10104:	53850513          	addi	a0,a0,1336 # 13638 <__stdio_exit_handler>
   10108:	00004617          	auipc	a2,0x4
   1010c:	85860613          	addi	a2,a2,-1960 # 13960 <__BSS_END__>
   10110:	40a60633          	sub	a2,a2,a0
   10114:	00000593          	li	a1,0
   10118:	1d1000ef          	jal	10ae8 <memset>
   1011c:	00001517          	auipc	a0,0x1
   10120:	bdc50513          	addi	a0,a0,-1060 # 10cf8 <atexit>
   10124:	00050863          	beqz	a0,10134 <_start+0x3c>
   10128:	00002517          	auipc	a0,0x2
   1012c:	cc850513          	addi	a0,a0,-824 # 11df0 <__libc_fini_array>
   10130:	3c9000ef          	jal	10cf8 <atexit>
   10134:	119000ef          	jal	10a4c <__libc_init_array>
   10138:	00012503          	lw	a0,0(sp)
   1013c:	00410593          	addi	a1,sp,4
   10140:	00000613          	li	a2,0
   10144:	06c000ef          	jal	101b0 <main>
   10148:	f6dff06f          	j	100b4 <exit>

0001014c <__do_global_dtors_aux>:
   1014c:	ff010113          	addi	sp,sp,-16
   10150:	00812423          	sw	s0,8(sp)
   10154:	d641c783          	lbu	a5,-668(gp) # 13654 <completed.1>
   10158:	00112623          	sw	ra,12(sp)
   1015c:	02079263          	bnez	a5,10180 <__do_global_dtors_aux+0x34>
   10160:	00000793          	li	a5,0
   10164:	00078a63          	beqz	a5,10178 <__do_global_dtors_aux+0x2c>
   10168:	00012537          	lui	a0,0x12
   1016c:	0a450513          	addi	a0,a0,164 # 120a4 <__EH_FRAME_BEGIN__>
   10170:	00000097          	auipc	ra,0x0
   10174:	000000e7          	jalr	zero # 0 <exit-0x100b4>
   10178:	00100793          	li	a5,1
   1017c:	d6f18223          	sb	a5,-668(gp) # 13654 <completed.1>
   10180:	00c12083          	lw	ra,12(sp)
   10184:	00812403          	lw	s0,8(sp)
   10188:	01010113          	addi	sp,sp,16
   1018c:	00008067          	ret

00010190 <frame_dummy>:
   10190:	00000793          	li	a5,0
   10194:	00078c63          	beqz	a5,101ac <frame_dummy+0x1c>
   10198:	00012537          	lui	a0,0x12
   1019c:	d6818593          	addi	a1,gp,-664 # 13658 <object.0>
   101a0:	0a450513          	addi	a0,a0,164 # 120a4 <__EH_FRAME_BEGIN__>
   101a4:	00000317          	auipc	t1,0x0
   101a8:	00000067          	jr	zero # 0 <exit-0x100b4>
   101ac:	00008067          	ret

000101b0 <main>:
   101b0:	fd010113          	addi	sp,sp,-48
   101b4:	02112623          	sw	ra,44(sp)
   101b8:	02812423          	sw	s0,40(sp)
   101bc:	03010413          	addi	s0,sp,48
   101c0:	00a00593          	li	a1,10
   101c4:	fcb42e23          	sw	a1,-36(s0)
   101c8:	00100513          	li	a0,1
   101cc:	00000593          	li	a1,0
   101d0:	fea42023          	sw	a0,-32(s0)
   101d4:	feb42223          	sw	a1,-28(s0)
   101d8:	00100593          	li	a1,1
   101dc:	feb42623          	sw	a1,-20(s0)
   101e0:	05c0006f          	j	1023c <main+0x8c>
   101e4:	fec42583          	lw	a1,-20(s0)
   101e8:	00058713          	mv	a4,a1
   101ec:	41f5d593          	srai	a1,a1,0x1f
   101f0:	00058793          	mv	a5,a1
   101f4:	fe442583          	lw	a1,-28(s0)
   101f8:	02e58533          	mul	a0,a1,a4
   101fc:	fe042583          	lw	a1,-32(s0)
   10200:	02f585b3          	mul	a1,a1,a5
   10204:	00b50533          	add	a0,a0,a1
   10208:	fe042583          	lw	a1,-32(s0)
   1020c:	02e58833          	mul	a6,a1,a4
   10210:	02e5b6b3          	mulhu	a3,a1,a4
   10214:	00080613          	mv	a2,a6
   10218:	00d505b3          	add	a1,a0,a3
   1021c:	00058693          	mv	a3,a1
   10220:	fec42023          	sw	a2,-32(s0)
   10224:	fed42223          	sw	a3,-28(s0)
   10228:	fec42023          	sw	a2,-32(s0)
   1022c:	fed42223          	sw	a3,-28(s0)
   10230:	fec42583          	lw	a1,-20(s0)
   10234:	00158593          	addi	a1,a1,1
   10238:	feb42623          	sw	a1,-20(s0)
   1023c:	fec42503          	lw	a0,-20(s0)
   10240:	fdc42583          	lw	a1,-36(s0)
   10244:	faa5d0e3          	bge	a1,a0,101e4 <main+0x34>
   10248:	00000793          	li	a5,0
   1024c:	00078513          	mv	a0,a5
   10250:	02c12083          	lw	ra,44(sp)
   10254:	02812403          	lw	s0,40(sp)
   10258:	03010113          	addi	sp,sp,48
   1025c:	00008067          	ret

00010260 <__fp_lock>:
   10260:	00000513          	li	a0,0
   10264:	00008067          	ret

00010268 <stdio_exit_handler>:
   10268:	00013637          	lui	a2,0x13
   1026c:	000125b7          	lui	a1,0x12
   10270:	00013537          	lui	a0,0x13
   10274:	0f060613          	addi	a2,a2,240 # 130f0 <__sglue>
   10278:	94458593          	addi	a1,a1,-1724 # 11944 <_fclose_r>
   1027c:	10050513          	addi	a0,a0,256 # 13100 <_impure_data>
   10280:	3480006f          	j	105c8 <_fwalk_sglue>

00010284 <cleanup_stdio>:
   10284:	00452583          	lw	a1,4(a0)
   10288:	ff010113          	addi	sp,sp,-16
   1028c:	00812423          	sw	s0,8(sp)
   10290:	00112623          	sw	ra,12(sp)
   10294:	d8018793          	addi	a5,gp,-640 # 13670 <__sf>
   10298:	00050413          	mv	s0,a0
   1029c:	00f58463          	beq	a1,a5,102a4 <cleanup_stdio+0x20>
   102a0:	6a4010ef          	jal	11944 <_fclose_r>
   102a4:	00842583          	lw	a1,8(s0)
   102a8:	de818793          	addi	a5,gp,-536 # 136d8 <__sf+0x68>
   102ac:	00f58663          	beq	a1,a5,102b8 <cleanup_stdio+0x34>
   102b0:	00040513          	mv	a0,s0
   102b4:	690010ef          	jal	11944 <_fclose_r>
   102b8:	00c42583          	lw	a1,12(s0)
   102bc:	e5018793          	addi	a5,gp,-432 # 13740 <__sf+0xd0>
   102c0:	00f58c63          	beq	a1,a5,102d8 <cleanup_stdio+0x54>
   102c4:	00040513          	mv	a0,s0
   102c8:	00812403          	lw	s0,8(sp)
   102cc:	00c12083          	lw	ra,12(sp)
   102d0:	01010113          	addi	sp,sp,16
   102d4:	6700106f          	j	11944 <_fclose_r>
   102d8:	00c12083          	lw	ra,12(sp)
   102dc:	00812403          	lw	s0,8(sp)
   102e0:	01010113          	addi	sp,sp,16
   102e4:	00008067          	ret

000102e8 <__fp_unlock>:
   102e8:	00000513          	li	a0,0
   102ec:	00008067          	ret

000102f0 <global_stdio_init.part.0>:
   102f0:	fe010113          	addi	sp,sp,-32
   102f4:	00812c23          	sw	s0,24(sp)
   102f8:	000107b7          	lui	a5,0x10
   102fc:	d8018413          	addi	s0,gp,-640 # 13670 <__sf>
   10300:	00112e23          	sw	ra,28(sp)
   10304:	00912a23          	sw	s1,20(sp)
   10308:	01212823          	sw	s2,16(sp)
   1030c:	01312623          	sw	s3,12(sp)
   10310:	01412423          	sw	s4,8(sp)
   10314:	00400713          	li	a4,4
   10318:	26878793          	addi	a5,a5,616 # 10268 <stdio_exit_handler>
   1031c:	00800613          	li	a2,8
   10320:	00000593          	li	a1,0
   10324:	ddc18513          	addi	a0,gp,-548 # 136cc <__sf+0x5c>
   10328:	d4f1a423          	sw	a5,-696(gp) # 13638 <__stdio_exit_handler>
   1032c:	00e42623          	sw	a4,12(s0)
   10330:	00042023          	sw	zero,0(s0)
   10334:	00042223          	sw	zero,4(s0)
   10338:	00042423          	sw	zero,8(s0)
   1033c:	06042223          	sw	zero,100(s0)
   10340:	00042823          	sw	zero,16(s0)
   10344:	00042a23          	sw	zero,20(s0)
   10348:	00042c23          	sw	zero,24(s0)
   1034c:	79c000ef          	jal	10ae8 <memset>
   10350:	000107b7          	lui	a5,0x10
   10354:	00010a37          	lui	s4,0x10
   10358:	000109b7          	lui	s3,0x10
   1035c:	00010937          	lui	s2,0x10
   10360:	000104b7          	lui	s1,0x10
   10364:	67ca0a13          	addi	s4,s4,1660 # 1067c <__sread>
   10368:	6e098993          	addi	s3,s3,1760 # 106e0 <__swrite>
   1036c:	76890913          	addi	s2,s2,1896 # 10768 <__sseek>
   10370:	7cc48493          	addi	s1,s1,1996 # 107cc <__sclose>
   10374:	00978793          	addi	a5,a5,9 # 10009 <exit-0xab>
   10378:	00800613          	li	a2,8
   1037c:	00000593          	li	a1,0
   10380:	e4418513          	addi	a0,gp,-444 # 13734 <__sf+0xc4>
   10384:	06f42a23          	sw	a5,116(s0)
   10388:	03442023          	sw	s4,32(s0)
   1038c:	03342223          	sw	s3,36(s0)
   10390:	03242423          	sw	s2,40(s0)
   10394:	02942623          	sw	s1,44(s0)
   10398:	00842e23          	sw	s0,28(s0)
   1039c:	06042423          	sw	zero,104(s0)
   103a0:	06042623          	sw	zero,108(s0)
   103a4:	06042823          	sw	zero,112(s0)
   103a8:	0c042623          	sw	zero,204(s0)
   103ac:	06042c23          	sw	zero,120(s0)
   103b0:	06042e23          	sw	zero,124(s0)
   103b4:	08042023          	sw	zero,128(s0)
   103b8:	730000ef          	jal	10ae8 <memset>
   103bc:	000207b7          	lui	a5,0x20
   103c0:	01278793          	addi	a5,a5,18 # 20012 <__BSS_END__+0xc6b2>
   103c4:	de818713          	addi	a4,gp,-536 # 136d8 <__sf+0x68>
   103c8:	eac18513          	addi	a0,gp,-340 # 1379c <__sf+0x12c>
   103cc:	00800613          	li	a2,8
   103d0:	00000593          	li	a1,0
   103d4:	09442423          	sw	s4,136(s0)
   103d8:	09342623          	sw	s3,140(s0)
   103dc:	09242823          	sw	s2,144(s0)
   103e0:	08942a23          	sw	s1,148(s0)
   103e4:	0cf42e23          	sw	a5,220(s0)
   103e8:	0c042823          	sw	zero,208(s0)
   103ec:	0c042a23          	sw	zero,212(s0)
   103f0:	0c042c23          	sw	zero,216(s0)
   103f4:	12042a23          	sw	zero,308(s0)
   103f8:	0e042023          	sw	zero,224(s0)
   103fc:	0e042223          	sw	zero,228(s0)
   10400:	0e042423          	sw	zero,232(s0)
   10404:	08e42223          	sw	a4,132(s0)
   10408:	6e0000ef          	jal	10ae8 <memset>
   1040c:	e5018793          	addi	a5,gp,-432 # 13740 <__sf+0xd0>
   10410:	0f442823          	sw	s4,240(s0)
   10414:	0f342a23          	sw	s3,244(s0)
   10418:	0f242c23          	sw	s2,248(s0)
   1041c:	0e942e23          	sw	s1,252(s0)
   10420:	01c12083          	lw	ra,28(sp)
   10424:	0ef42623          	sw	a5,236(s0)
   10428:	01812403          	lw	s0,24(sp)
   1042c:	01412483          	lw	s1,20(sp)
   10430:	01012903          	lw	s2,16(sp)
   10434:	00c12983          	lw	s3,12(sp)
   10438:	00812a03          	lw	s4,8(sp)
   1043c:	02010113          	addi	sp,sp,32
   10440:	00008067          	ret

00010444 <__sfp>:
   10444:	d481a783          	lw	a5,-696(gp) # 13638 <__stdio_exit_handler>
   10448:	fe010113          	addi	sp,sp,-32
   1044c:	01312623          	sw	s3,12(sp)
   10450:	00112e23          	sw	ra,28(sp)
   10454:	00812c23          	sw	s0,24(sp)
   10458:	00912a23          	sw	s1,20(sp)
   1045c:	01212823          	sw	s2,16(sp)
   10460:	00050993          	mv	s3,a0
   10464:	0e078863          	beqz	a5,10554 <__sfp+0x110>
   10468:	00013937          	lui	s2,0x13
   1046c:	0f090913          	addi	s2,s2,240 # 130f0 <__sglue>
   10470:	fff00493          	li	s1,-1
   10474:	00492783          	lw	a5,4(s2)
   10478:	00892403          	lw	s0,8(s2)
   1047c:	fff78793          	addi	a5,a5,-1
   10480:	0007d863          	bgez	a5,10490 <__sfp+0x4c>
   10484:	0800006f          	j	10504 <__sfp+0xc0>
   10488:	06840413          	addi	s0,s0,104
   1048c:	06978c63          	beq	a5,s1,10504 <__sfp+0xc0>
   10490:	00c41703          	lh	a4,12(s0)
   10494:	fff78793          	addi	a5,a5,-1
   10498:	fe0718e3          	bnez	a4,10488 <__sfp+0x44>
   1049c:	ffff07b7          	lui	a5,0xffff0
   104a0:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdc6a1>
   104a4:	06042223          	sw	zero,100(s0)
   104a8:	00042023          	sw	zero,0(s0)
   104ac:	00042423          	sw	zero,8(s0)
   104b0:	00042223          	sw	zero,4(s0)
   104b4:	00042823          	sw	zero,16(s0)
   104b8:	00042a23          	sw	zero,20(s0)
   104bc:	00042c23          	sw	zero,24(s0)
   104c0:	00f42623          	sw	a5,12(s0)
   104c4:	00800613          	li	a2,8
   104c8:	00000593          	li	a1,0
   104cc:	05c40513          	addi	a0,s0,92
   104d0:	618000ef          	jal	10ae8 <memset>
   104d4:	02042823          	sw	zero,48(s0)
   104d8:	02042a23          	sw	zero,52(s0)
   104dc:	04042223          	sw	zero,68(s0)
   104e0:	04042423          	sw	zero,72(s0)
   104e4:	01c12083          	lw	ra,28(sp)
   104e8:	00040513          	mv	a0,s0
   104ec:	01812403          	lw	s0,24(sp)
   104f0:	01412483          	lw	s1,20(sp)
   104f4:	01012903          	lw	s2,16(sp)
   104f8:	00c12983          	lw	s3,12(sp)
   104fc:	02010113          	addi	sp,sp,32
   10500:	00008067          	ret
   10504:	00092403          	lw	s0,0(s2)
   10508:	00040663          	beqz	s0,10514 <__sfp+0xd0>
   1050c:	00040913          	mv	s2,s0
   10510:	f65ff06f          	j	10474 <__sfp+0x30>
   10514:	1ac00593          	li	a1,428
   10518:	00098513          	mv	a0,s3
   1051c:	419000ef          	jal	11134 <_malloc_r>
   10520:	00050413          	mv	s0,a0
   10524:	02050c63          	beqz	a0,1055c <__sfp+0x118>
   10528:	00400793          	li	a5,4
   1052c:	00c50513          	addi	a0,a0,12
   10530:	00042023          	sw	zero,0(s0)
   10534:	00f42223          	sw	a5,4(s0)
   10538:	00a42423          	sw	a0,8(s0)
   1053c:	1a000613          	li	a2,416
   10540:	00000593          	li	a1,0
   10544:	5a4000ef          	jal	10ae8 <memset>
   10548:	00892023          	sw	s0,0(s2)
   1054c:	00040913          	mv	s2,s0
   10550:	f25ff06f          	j	10474 <__sfp+0x30>
   10554:	d9dff0ef          	jal	102f0 <global_stdio_init.part.0>
   10558:	f11ff06f          	j	10468 <__sfp+0x24>
   1055c:	00092023          	sw	zero,0(s2)
   10560:	00c00793          	li	a5,12
   10564:	00f9a023          	sw	a5,0(s3)
   10568:	f7dff06f          	j	104e4 <__sfp+0xa0>

0001056c <__sinit>:
   1056c:	03452783          	lw	a5,52(a0)
   10570:	00078463          	beqz	a5,10578 <__sinit+0xc>
   10574:	00008067          	ret
   10578:	000107b7          	lui	a5,0x10
   1057c:	d481a703          	lw	a4,-696(gp) # 13638 <__stdio_exit_handler>
   10580:	28478793          	addi	a5,a5,644 # 10284 <cleanup_stdio>
   10584:	02f52a23          	sw	a5,52(a0)
   10588:	fe0716e3          	bnez	a4,10574 <__sinit+0x8>
   1058c:	d65ff06f          	j	102f0 <global_stdio_init.part.0>

00010590 <__sfp_lock_acquire>:
   10590:	00008067          	ret

00010594 <__sfp_lock_release>:
   10594:	00008067          	ret

00010598 <__fp_lock_all>:
   10598:	00013637          	lui	a2,0x13
   1059c:	000105b7          	lui	a1,0x10
   105a0:	0f060613          	addi	a2,a2,240 # 130f0 <__sglue>
   105a4:	26058593          	addi	a1,a1,608 # 10260 <__fp_lock>
   105a8:	00000513          	li	a0,0
   105ac:	01c0006f          	j	105c8 <_fwalk_sglue>

000105b0 <__fp_unlock_all>:
   105b0:	00013637          	lui	a2,0x13
   105b4:	000105b7          	lui	a1,0x10
   105b8:	0f060613          	addi	a2,a2,240 # 130f0 <__sglue>
   105bc:	2e858593          	addi	a1,a1,744 # 102e8 <__fp_unlock>
   105c0:	00000513          	li	a0,0
   105c4:	0040006f          	j	105c8 <_fwalk_sglue>

000105c8 <_fwalk_sglue>:
   105c8:	fd010113          	addi	sp,sp,-48
   105cc:	03212023          	sw	s2,32(sp)
   105d0:	01312e23          	sw	s3,28(sp)
   105d4:	01412c23          	sw	s4,24(sp)
   105d8:	01512a23          	sw	s5,20(sp)
   105dc:	01612823          	sw	s6,16(sp)
   105e0:	01712623          	sw	s7,12(sp)
   105e4:	02112623          	sw	ra,44(sp)
   105e8:	02812423          	sw	s0,40(sp)
   105ec:	02912223          	sw	s1,36(sp)
   105f0:	00050b13          	mv	s6,a0
   105f4:	00058b93          	mv	s7,a1
   105f8:	00060a93          	mv	s5,a2
   105fc:	00000a13          	li	s4,0
   10600:	00100993          	li	s3,1
   10604:	fff00913          	li	s2,-1
   10608:	004aa483          	lw	s1,4(s5)
   1060c:	008aa403          	lw	s0,8(s5)
   10610:	fff48493          	addi	s1,s1,-1
   10614:	0204c863          	bltz	s1,10644 <_fwalk_sglue+0x7c>
   10618:	00c45783          	lhu	a5,12(s0)
   1061c:	00f9fe63          	bgeu	s3,a5,10638 <_fwalk_sglue+0x70>
   10620:	00e41783          	lh	a5,14(s0)
   10624:	00040593          	mv	a1,s0
   10628:	000b0513          	mv	a0,s6
   1062c:	01278663          	beq	a5,s2,10638 <_fwalk_sglue+0x70>
   10630:	000b80e7          	jalr	s7
   10634:	00aa6a33          	or	s4,s4,a0
   10638:	fff48493          	addi	s1,s1,-1
   1063c:	06840413          	addi	s0,s0,104
   10640:	fd249ce3          	bne	s1,s2,10618 <_fwalk_sglue+0x50>
   10644:	000aaa83          	lw	s5,0(s5)
   10648:	fc0a90e3          	bnez	s5,10608 <_fwalk_sglue+0x40>
   1064c:	02c12083          	lw	ra,44(sp)
   10650:	02812403          	lw	s0,40(sp)
   10654:	02412483          	lw	s1,36(sp)
   10658:	02012903          	lw	s2,32(sp)
   1065c:	01c12983          	lw	s3,28(sp)
   10660:	01412a83          	lw	s5,20(sp)
   10664:	01012b03          	lw	s6,16(sp)
   10668:	00c12b83          	lw	s7,12(sp)
   1066c:	000a0513          	mv	a0,s4
   10670:	01812a03          	lw	s4,24(sp)
   10674:	03010113          	addi	sp,sp,48
   10678:	00008067          	ret

0001067c <__sread>:
   1067c:	ff010113          	addi	sp,sp,-16
   10680:	00812423          	sw	s0,8(sp)
   10684:	00058413          	mv	s0,a1
   10688:	00e59583          	lh	a1,14(a1)
   1068c:	00112623          	sw	ra,12(sp)
   10690:	2ec000ef          	jal	1097c <_read_r>
   10694:	02054063          	bltz	a0,106b4 <__sread+0x38>
   10698:	05042783          	lw	a5,80(s0)
   1069c:	00c12083          	lw	ra,12(sp)
   106a0:	00a787b3          	add	a5,a5,a0
   106a4:	04f42823          	sw	a5,80(s0)
   106a8:	00812403          	lw	s0,8(sp)
   106ac:	01010113          	addi	sp,sp,16
   106b0:	00008067          	ret
   106b4:	00c45783          	lhu	a5,12(s0)
   106b8:	fffff737          	lui	a4,0xfffff
   106bc:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb69f>
   106c0:	00e7f7b3          	and	a5,a5,a4
   106c4:	00c12083          	lw	ra,12(sp)
   106c8:	00f41623          	sh	a5,12(s0)
   106cc:	00812403          	lw	s0,8(sp)
   106d0:	01010113          	addi	sp,sp,16
   106d4:	00008067          	ret

000106d8 <__seofread>:
   106d8:	00000513          	li	a0,0
   106dc:	00008067          	ret

000106e0 <__swrite>:
   106e0:	00c59783          	lh	a5,12(a1)
   106e4:	fe010113          	addi	sp,sp,-32
   106e8:	00812c23          	sw	s0,24(sp)
   106ec:	00912a23          	sw	s1,20(sp)
   106f0:	01212823          	sw	s2,16(sp)
   106f4:	01312623          	sw	s3,12(sp)
   106f8:	00112e23          	sw	ra,28(sp)
   106fc:	1007f713          	andi	a4,a5,256
   10700:	00058413          	mv	s0,a1
   10704:	00060913          	mv	s2,a2
   10708:	00068993          	mv	s3,a3
   1070c:	00050493          	mv	s1,a0
   10710:	04071063          	bnez	a4,10750 <__swrite+0x70>
   10714:	fffff737          	lui	a4,0xfffff
   10718:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb69f>
   1071c:	00e7f7b3          	and	a5,a5,a4
   10720:	00e41583          	lh	a1,14(s0)
   10724:	00f41623          	sh	a5,12(s0)
   10728:	01812403          	lw	s0,24(sp)
   1072c:	01c12083          	lw	ra,28(sp)
   10730:	00098693          	mv	a3,s3
   10734:	00090613          	mv	a2,s2
   10738:	00c12983          	lw	s3,12(sp)
   1073c:	01012903          	lw	s2,16(sp)
   10740:	00048513          	mv	a0,s1
   10744:	01412483          	lw	s1,20(sp)
   10748:	02010113          	addi	sp,sp,32
   1074c:	2980006f          	j	109e4 <_write_r>
   10750:	00e59583          	lh	a1,14(a1)
   10754:	00200693          	li	a3,2
   10758:	00000613          	li	a2,0
   1075c:	1b8000ef          	jal	10914 <_lseek_r>
   10760:	00c41783          	lh	a5,12(s0)
   10764:	fb1ff06f          	j	10714 <__swrite+0x34>

00010768 <__sseek>:
   10768:	ff010113          	addi	sp,sp,-16
   1076c:	00812423          	sw	s0,8(sp)
   10770:	00058413          	mv	s0,a1
   10774:	00e59583          	lh	a1,14(a1)
   10778:	00112623          	sw	ra,12(sp)
   1077c:	198000ef          	jal	10914 <_lseek_r>
   10780:	fff00713          	li	a4,-1
   10784:	00c41783          	lh	a5,12(s0)
   10788:	02e50263          	beq	a0,a4,107ac <__sseek+0x44>
   1078c:	00001737          	lui	a4,0x1
   10790:	00e7e7b3          	or	a5,a5,a4
   10794:	00c12083          	lw	ra,12(sp)
   10798:	04a42823          	sw	a0,80(s0)
   1079c:	00f41623          	sh	a5,12(s0)
   107a0:	00812403          	lw	s0,8(sp)
   107a4:	01010113          	addi	sp,sp,16
   107a8:	00008067          	ret
   107ac:	fffff737          	lui	a4,0xfffff
   107b0:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb69f>
   107b4:	00e7f7b3          	and	a5,a5,a4
   107b8:	00c12083          	lw	ra,12(sp)
   107bc:	00f41623          	sh	a5,12(s0)
   107c0:	00812403          	lw	s0,8(sp)
   107c4:	01010113          	addi	sp,sp,16
   107c8:	00008067          	ret

000107cc <__sclose>:
   107cc:	00e59583          	lh	a1,14(a1)
   107d0:	0040006f          	j	107d4 <_close_r>

000107d4 <_close_r>:
   107d4:	ff010113          	addi	sp,sp,-16
   107d8:	00812423          	sw	s0,8(sp)
   107dc:	00912223          	sw	s1,4(sp)
   107e0:	00050413          	mv	s0,a0
   107e4:	00058513          	mv	a0,a1
   107e8:	00112623          	sw	ra,12(sp)
   107ec:	d401a623          	sw	zero,-692(gp) # 1363c <errno>
   107f0:	6f4010ef          	jal	11ee4 <_close>
   107f4:	fff00793          	li	a5,-1
   107f8:	00f50c63          	beq	a0,a5,10810 <_close_r+0x3c>
   107fc:	00c12083          	lw	ra,12(sp)
   10800:	00812403          	lw	s0,8(sp)
   10804:	00412483          	lw	s1,4(sp)
   10808:	01010113          	addi	sp,sp,16
   1080c:	00008067          	ret
   10810:	d4c1a783          	lw	a5,-692(gp) # 1363c <errno>
   10814:	fe0784e3          	beqz	a5,107fc <_close_r+0x28>
   10818:	00c12083          	lw	ra,12(sp)
   1081c:	00f42023          	sw	a5,0(s0)
   10820:	00812403          	lw	s0,8(sp)
   10824:	00412483          	lw	s1,4(sp)
   10828:	01010113          	addi	sp,sp,16
   1082c:	00008067          	ret

00010830 <_reclaim_reent>:
   10830:	d3c1a783          	lw	a5,-708(gp) # 1362c <_impure_ptr>
   10834:	0ca78e63          	beq	a5,a0,10910 <_reclaim_reent+0xe0>
   10838:	04452583          	lw	a1,68(a0)
   1083c:	fe010113          	addi	sp,sp,-32
   10840:	00912a23          	sw	s1,20(sp)
   10844:	00112e23          	sw	ra,28(sp)
   10848:	00812c23          	sw	s0,24(sp)
   1084c:	00050493          	mv	s1,a0
   10850:	04058863          	beqz	a1,108a0 <_reclaim_reent+0x70>
   10854:	01212823          	sw	s2,16(sp)
   10858:	01312623          	sw	s3,12(sp)
   1085c:	00000913          	li	s2,0
   10860:	08000993          	li	s3,128
   10864:	012587b3          	add	a5,a1,s2
   10868:	0007a403          	lw	s0,0(a5)
   1086c:	00040e63          	beqz	s0,10888 <_reclaim_reent+0x58>
   10870:	00040593          	mv	a1,s0
   10874:	00042403          	lw	s0,0(s0)
   10878:	00048513          	mv	a0,s1
   1087c:	5c8000ef          	jal	10e44 <_free_r>
   10880:	fe0418e3          	bnez	s0,10870 <_reclaim_reent+0x40>
   10884:	0444a583          	lw	a1,68(s1)
   10888:	00490913          	addi	s2,s2,4
   1088c:	fd391ce3          	bne	s2,s3,10864 <_reclaim_reent+0x34>
   10890:	00048513          	mv	a0,s1
   10894:	5b0000ef          	jal	10e44 <_free_r>
   10898:	01012903          	lw	s2,16(sp)
   1089c:	00c12983          	lw	s3,12(sp)
   108a0:	0384a583          	lw	a1,56(s1)
   108a4:	00058663          	beqz	a1,108b0 <_reclaim_reent+0x80>
   108a8:	00048513          	mv	a0,s1
   108ac:	598000ef          	jal	10e44 <_free_r>
   108b0:	0404a403          	lw	s0,64(s1)
   108b4:	00040c63          	beqz	s0,108cc <_reclaim_reent+0x9c>
   108b8:	00040593          	mv	a1,s0
   108bc:	00042403          	lw	s0,0(s0)
   108c0:	00048513          	mv	a0,s1
   108c4:	580000ef          	jal	10e44 <_free_r>
   108c8:	fe0418e3          	bnez	s0,108b8 <_reclaim_reent+0x88>
   108cc:	04c4a583          	lw	a1,76(s1)
   108d0:	00058663          	beqz	a1,108dc <_reclaim_reent+0xac>
   108d4:	00048513          	mv	a0,s1
   108d8:	56c000ef          	jal	10e44 <_free_r>
   108dc:	0344a783          	lw	a5,52(s1)
   108e0:	00078e63          	beqz	a5,108fc <_reclaim_reent+0xcc>
   108e4:	01812403          	lw	s0,24(sp)
   108e8:	01c12083          	lw	ra,28(sp)
   108ec:	00048513          	mv	a0,s1
   108f0:	01412483          	lw	s1,20(sp)
   108f4:	02010113          	addi	sp,sp,32
   108f8:	00078067          	jr	a5
   108fc:	01c12083          	lw	ra,28(sp)
   10900:	01812403          	lw	s0,24(sp)
   10904:	01412483          	lw	s1,20(sp)
   10908:	02010113          	addi	sp,sp,32
   1090c:	00008067          	ret
   10910:	00008067          	ret

00010914 <_lseek_r>:
   10914:	ff010113          	addi	sp,sp,-16
   10918:	00058713          	mv	a4,a1
   1091c:	00812423          	sw	s0,8(sp)
   10920:	00912223          	sw	s1,4(sp)
   10924:	00060593          	mv	a1,a2
   10928:	00050413          	mv	s0,a0
   1092c:	00068613          	mv	a2,a3
   10930:	00070513          	mv	a0,a4
   10934:	00112623          	sw	ra,12(sp)
   10938:	d401a623          	sw	zero,-692(gp) # 1363c <errno>
   1093c:	61c010ef          	jal	11f58 <_lseek>
   10940:	fff00793          	li	a5,-1
   10944:	00f50c63          	beq	a0,a5,1095c <_lseek_r+0x48>
   10948:	00c12083          	lw	ra,12(sp)
   1094c:	00812403          	lw	s0,8(sp)
   10950:	00412483          	lw	s1,4(sp)
   10954:	01010113          	addi	sp,sp,16
   10958:	00008067          	ret
   1095c:	d4c1a783          	lw	a5,-692(gp) # 1363c <errno>
   10960:	fe0784e3          	beqz	a5,10948 <_lseek_r+0x34>
   10964:	00c12083          	lw	ra,12(sp)
   10968:	00f42023          	sw	a5,0(s0)
   1096c:	00812403          	lw	s0,8(sp)
   10970:	00412483          	lw	s1,4(sp)
   10974:	01010113          	addi	sp,sp,16
   10978:	00008067          	ret

0001097c <_read_r>:
   1097c:	ff010113          	addi	sp,sp,-16
   10980:	00058713          	mv	a4,a1
   10984:	00812423          	sw	s0,8(sp)
   10988:	00912223          	sw	s1,4(sp)
   1098c:	00060593          	mv	a1,a2
   10990:	00050413          	mv	s0,a0
   10994:	00068613          	mv	a2,a3
   10998:	00070513          	mv	a0,a4
   1099c:	00112623          	sw	ra,12(sp)
   109a0:	d401a623          	sw	zero,-692(gp) # 1363c <errno>
   109a4:	5f8010ef          	jal	11f9c <_read>
   109a8:	fff00793          	li	a5,-1
   109ac:	00f50c63          	beq	a0,a5,109c4 <_read_r+0x48>
   109b0:	00c12083          	lw	ra,12(sp)
   109b4:	00812403          	lw	s0,8(sp)
   109b8:	00412483          	lw	s1,4(sp)
   109bc:	01010113          	addi	sp,sp,16
   109c0:	00008067          	ret
   109c4:	d4c1a783          	lw	a5,-692(gp) # 1363c <errno>
   109c8:	fe0784e3          	beqz	a5,109b0 <_read_r+0x34>
   109cc:	00c12083          	lw	ra,12(sp)
   109d0:	00f42023          	sw	a5,0(s0)
   109d4:	00812403          	lw	s0,8(sp)
   109d8:	00412483          	lw	s1,4(sp)
   109dc:	01010113          	addi	sp,sp,16
   109e0:	00008067          	ret

000109e4 <_write_r>:
   109e4:	ff010113          	addi	sp,sp,-16
   109e8:	00058713          	mv	a4,a1
   109ec:	00812423          	sw	s0,8(sp)
   109f0:	00912223          	sw	s1,4(sp)
   109f4:	00060593          	mv	a1,a2
   109f8:	00050413          	mv	s0,a0
   109fc:	00068613          	mv	a2,a3
   10a00:	00070513          	mv	a0,a4
   10a04:	00112623          	sw	ra,12(sp)
   10a08:	d401a623          	sw	zero,-692(gp) # 1363c <errno>
   10a0c:	64c010ef          	jal	12058 <_write>
   10a10:	fff00793          	li	a5,-1
   10a14:	00f50c63          	beq	a0,a5,10a2c <_write_r+0x48>
   10a18:	00c12083          	lw	ra,12(sp)
   10a1c:	00812403          	lw	s0,8(sp)
   10a20:	00412483          	lw	s1,4(sp)
   10a24:	01010113          	addi	sp,sp,16
   10a28:	00008067          	ret
   10a2c:	d4c1a783          	lw	a5,-692(gp) # 1363c <errno>
   10a30:	fe0784e3          	beqz	a5,10a18 <_write_r+0x34>
   10a34:	00c12083          	lw	ra,12(sp)
   10a38:	00f42023          	sw	a5,0(s0)
   10a3c:	00812403          	lw	s0,8(sp)
   10a40:	00412483          	lw	s1,4(sp)
   10a44:	01010113          	addi	sp,sp,16
   10a48:	00008067          	ret

00010a4c <__libc_init_array>:
   10a4c:	ff010113          	addi	sp,sp,-16
   10a50:	00812423          	sw	s0,8(sp)
   10a54:	000137b7          	lui	a5,0x13
   10a58:	00013437          	lui	s0,0x13
   10a5c:	01212023          	sw	s2,0(sp)
   10a60:	0e478793          	addi	a5,a5,228 # 130e4 <__init_array_start>
   10a64:	0e440713          	addi	a4,s0,228 # 130e4 <__init_array_start>
   10a68:	00112623          	sw	ra,12(sp)
   10a6c:	00912223          	sw	s1,4(sp)
   10a70:	40e78933          	sub	s2,a5,a4
   10a74:	02e78263          	beq	a5,a4,10a98 <__libc_init_array+0x4c>
   10a78:	40295913          	srai	s2,s2,0x2
   10a7c:	0e440413          	addi	s0,s0,228
   10a80:	00000493          	li	s1,0
   10a84:	00042783          	lw	a5,0(s0)
   10a88:	00148493          	addi	s1,s1,1
   10a8c:	00440413          	addi	s0,s0,4
   10a90:	000780e7          	jalr	a5
   10a94:	ff24e8e3          	bltu	s1,s2,10a84 <__libc_init_array+0x38>
   10a98:	000137b7          	lui	a5,0x13
   10a9c:	00013437          	lui	s0,0x13
   10aa0:	0ec78793          	addi	a5,a5,236 # 130ec <__do_global_dtors_aux_fini_array_entry>
   10aa4:	0e440713          	addi	a4,s0,228 # 130e4 <__init_array_start>
   10aa8:	40e78933          	sub	s2,a5,a4
   10aac:	40295913          	srai	s2,s2,0x2
   10ab0:	02e78063          	beq	a5,a4,10ad0 <__libc_init_array+0x84>
   10ab4:	0e440413          	addi	s0,s0,228
   10ab8:	00000493          	li	s1,0
   10abc:	00042783          	lw	a5,0(s0)
   10ac0:	00148493          	addi	s1,s1,1
   10ac4:	00440413          	addi	s0,s0,4
   10ac8:	000780e7          	jalr	a5
   10acc:	ff24e8e3          	bltu	s1,s2,10abc <__libc_init_array+0x70>
   10ad0:	00c12083          	lw	ra,12(sp)
   10ad4:	00812403          	lw	s0,8(sp)
   10ad8:	00412483          	lw	s1,4(sp)
   10adc:	00012903          	lw	s2,0(sp)
   10ae0:	01010113          	addi	sp,sp,16
   10ae4:	00008067          	ret

00010ae8 <memset>:
   10ae8:	00f00313          	li	t1,15
   10aec:	00050713          	mv	a4,a0
   10af0:	02c37e63          	bgeu	t1,a2,10b2c <memset+0x44>
   10af4:	00f77793          	andi	a5,a4,15
   10af8:	0a079063          	bnez	a5,10b98 <memset+0xb0>
   10afc:	08059263          	bnez	a1,10b80 <memset+0x98>
   10b00:	ff067693          	andi	a3,a2,-16
   10b04:	00f67613          	andi	a2,a2,15
   10b08:	00e686b3          	add	a3,a3,a4
   10b0c:	00b72023          	sw	a1,0(a4)
   10b10:	00b72223          	sw	a1,4(a4)
   10b14:	00b72423          	sw	a1,8(a4)
   10b18:	00b72623          	sw	a1,12(a4)
   10b1c:	01070713          	addi	a4,a4,16
   10b20:	fed766e3          	bltu	a4,a3,10b0c <memset+0x24>
   10b24:	00061463          	bnez	a2,10b2c <memset+0x44>
   10b28:	00008067          	ret
   10b2c:	40c306b3          	sub	a3,t1,a2
   10b30:	00269693          	slli	a3,a3,0x2
   10b34:	00000297          	auipc	t0,0x0
   10b38:	005686b3          	add	a3,a3,t0
   10b3c:	00c68067          	jr	12(a3)
   10b40:	00b70723          	sb	a1,14(a4)
   10b44:	00b706a3          	sb	a1,13(a4)
   10b48:	00b70623          	sb	a1,12(a4)
   10b4c:	00b705a3          	sb	a1,11(a4)
   10b50:	00b70523          	sb	a1,10(a4)
   10b54:	00b704a3          	sb	a1,9(a4)
   10b58:	00b70423          	sb	a1,8(a4)
   10b5c:	00b703a3          	sb	a1,7(a4)
   10b60:	00b70323          	sb	a1,6(a4)
   10b64:	00b702a3          	sb	a1,5(a4)
   10b68:	00b70223          	sb	a1,4(a4)
   10b6c:	00b701a3          	sb	a1,3(a4)
   10b70:	00b70123          	sb	a1,2(a4)
   10b74:	00b700a3          	sb	a1,1(a4)
   10b78:	00b70023          	sb	a1,0(a4)
   10b7c:	00008067          	ret
   10b80:	0ff5f593          	zext.b	a1,a1
   10b84:	00859693          	slli	a3,a1,0x8
   10b88:	00d5e5b3          	or	a1,a1,a3
   10b8c:	01059693          	slli	a3,a1,0x10
   10b90:	00d5e5b3          	or	a1,a1,a3
   10b94:	f6dff06f          	j	10b00 <memset+0x18>
   10b98:	00279693          	slli	a3,a5,0x2
   10b9c:	00000297          	auipc	t0,0x0
   10ba0:	005686b3          	add	a3,a3,t0
   10ba4:	00008293          	mv	t0,ra
   10ba8:	fa0680e7          	jalr	-96(a3)
   10bac:	00028093          	mv	ra,t0
   10bb0:	ff078793          	addi	a5,a5,-16
   10bb4:	40f70733          	sub	a4,a4,a5
   10bb8:	00f60633          	add	a2,a2,a5
   10bbc:	f6c378e3          	bgeu	t1,a2,10b2c <memset+0x44>
   10bc0:	f3dff06f          	j	10afc <memset+0x14>

00010bc4 <__call_exitprocs>:
   10bc4:	fd010113          	addi	sp,sp,-48
   10bc8:	01412c23          	sw	s4,24(sp)
   10bcc:	03212023          	sw	s2,32(sp)
   10bd0:	d501a903          	lw	s2,-688(gp) # 13640 <__atexit>
   10bd4:	02112623          	sw	ra,44(sp)
   10bd8:	06090c63          	beqz	s2,10c50 <__call_exitprocs+0x8c>
   10bdc:	01312e23          	sw	s3,28(sp)
   10be0:	01512a23          	sw	s5,20(sp)
   10be4:	01612823          	sw	s6,16(sp)
   10be8:	01712623          	sw	s7,12(sp)
   10bec:	02812423          	sw	s0,40(sp)
   10bf0:	02912223          	sw	s1,36(sp)
   10bf4:	01812423          	sw	s8,8(sp)
   10bf8:	00050b13          	mv	s6,a0
   10bfc:	00058b93          	mv	s7,a1
   10c00:	fff00993          	li	s3,-1
   10c04:	00100a93          	li	s5,1
   10c08:	00492483          	lw	s1,4(s2)
   10c0c:	fff48413          	addi	s0,s1,-1
   10c10:	02044263          	bltz	s0,10c34 <__call_exitprocs+0x70>
   10c14:	00249493          	slli	s1,s1,0x2
   10c18:	009904b3          	add	s1,s2,s1
   10c1c:	040b8463          	beqz	s7,10c64 <__call_exitprocs+0xa0>
   10c20:	1044a783          	lw	a5,260(s1)
   10c24:	05778063          	beq	a5,s7,10c64 <__call_exitprocs+0xa0>
   10c28:	fff40413          	addi	s0,s0,-1
   10c2c:	ffc48493          	addi	s1,s1,-4
   10c30:	ff3418e3          	bne	s0,s3,10c20 <__call_exitprocs+0x5c>
   10c34:	02812403          	lw	s0,40(sp)
   10c38:	02412483          	lw	s1,36(sp)
   10c3c:	01c12983          	lw	s3,28(sp)
   10c40:	01412a83          	lw	s5,20(sp)
   10c44:	01012b03          	lw	s6,16(sp)
   10c48:	00c12b83          	lw	s7,12(sp)
   10c4c:	00812c03          	lw	s8,8(sp)
   10c50:	02c12083          	lw	ra,44(sp)
   10c54:	02012903          	lw	s2,32(sp)
   10c58:	01812a03          	lw	s4,24(sp)
   10c5c:	03010113          	addi	sp,sp,48
   10c60:	00008067          	ret
   10c64:	00492783          	lw	a5,4(s2)
   10c68:	0044a683          	lw	a3,4(s1)
   10c6c:	fff78793          	addi	a5,a5,-1
   10c70:	06878a63          	beq	a5,s0,10ce4 <__call_exitprocs+0x120>
   10c74:	0004a223          	sw	zero,4(s1)
   10c78:	02068663          	beqz	a3,10ca4 <__call_exitprocs+0xe0>
   10c7c:	18892783          	lw	a5,392(s2)
   10c80:	008a9733          	sll	a4,s5,s0
   10c84:	00492c03          	lw	s8,4(s2)
   10c88:	00f777b3          	and	a5,a4,a5
   10c8c:	02079463          	bnez	a5,10cb4 <__call_exitprocs+0xf0>
   10c90:	000680e7          	jalr	a3
   10c94:	00492703          	lw	a4,4(s2)
   10c98:	d501a783          	lw	a5,-688(gp) # 13640 <__atexit>
   10c9c:	03871e63          	bne	a4,s8,10cd8 <__call_exitprocs+0x114>
   10ca0:	03279c63          	bne	a5,s2,10cd8 <__call_exitprocs+0x114>
   10ca4:	fff40413          	addi	s0,s0,-1
   10ca8:	ffc48493          	addi	s1,s1,-4
   10cac:	f73418e3          	bne	s0,s3,10c1c <__call_exitprocs+0x58>
   10cb0:	f85ff06f          	j	10c34 <__call_exitprocs+0x70>
   10cb4:	18c92783          	lw	a5,396(s2)
   10cb8:	0844a583          	lw	a1,132(s1)
   10cbc:	00f77733          	and	a4,a4,a5
   10cc0:	02071663          	bnez	a4,10cec <__call_exitprocs+0x128>
   10cc4:	000b0513          	mv	a0,s6
   10cc8:	000680e7          	jalr	a3
   10ccc:	00492703          	lw	a4,4(s2)
   10cd0:	d501a783          	lw	a5,-688(gp) # 13640 <__atexit>
   10cd4:	fd8706e3          	beq	a4,s8,10ca0 <__call_exitprocs+0xdc>
   10cd8:	f4078ee3          	beqz	a5,10c34 <__call_exitprocs+0x70>
   10cdc:	00078913          	mv	s2,a5
   10ce0:	f29ff06f          	j	10c08 <__call_exitprocs+0x44>
   10ce4:	00892223          	sw	s0,4(s2)
   10ce8:	f91ff06f          	j	10c78 <__call_exitprocs+0xb4>
   10cec:	00058513          	mv	a0,a1
   10cf0:	000680e7          	jalr	a3
   10cf4:	fa1ff06f          	j	10c94 <__call_exitprocs+0xd0>

00010cf8 <atexit>:
   10cf8:	00050593          	mv	a1,a0
   10cfc:	00000693          	li	a3,0
   10d00:	00000613          	li	a2,0
   10d04:	00000513          	li	a0,0
   10d08:	1440106f          	j	11e4c <__register_exitproc>

00010d0c <_malloc_trim_r>:
   10d0c:	fe010113          	addi	sp,sp,-32
   10d10:	01312623          	sw	s3,12(sp)
   10d14:	000139b7          	lui	s3,0x13
   10d18:	00812c23          	sw	s0,24(sp)
   10d1c:	00912a23          	sw	s1,20(sp)
   10d20:	01212823          	sw	s2,16(sp)
   10d24:	01412423          	sw	s4,8(sp)
   10d28:	00112e23          	sw	ra,28(sp)
   10d2c:	00058a13          	mv	s4,a1
   10d30:	00050913          	mv	s2,a0
   10d34:	22098993          	addi	s3,s3,544 # 13220 <__malloc_av_>
   10d38:	405000ef          	jal	1193c <__malloc_lock>
   10d3c:	0089a783          	lw	a5,8(s3)
   10d40:	00001437          	lui	s0,0x1
   10d44:	fef40413          	addi	s0,s0,-17 # fef <exit-0xf0c5>
   10d48:	0047a483          	lw	s1,4(a5)
   10d4c:	000017b7          	lui	a5,0x1
   10d50:	ffc4f493          	andi	s1,s1,-4
   10d54:	00848433          	add	s0,s1,s0
   10d58:	41440433          	sub	s0,s0,s4
   10d5c:	00c45413          	srli	s0,s0,0xc
   10d60:	fff40413          	addi	s0,s0,-1
   10d64:	00c41413          	slli	s0,s0,0xc
   10d68:	00f44e63          	blt	s0,a5,10d84 <_malloc_trim_r+0x78>
   10d6c:	00000593          	li	a1,0
   10d70:	00090513          	mv	a0,s2
   10d74:	020010ef          	jal	11d94 <_sbrk_r>
   10d78:	0089a783          	lw	a5,8(s3)
   10d7c:	009787b3          	add	a5,a5,s1
   10d80:	02f50863          	beq	a0,a5,10db0 <_malloc_trim_r+0xa4>
   10d84:	00090513          	mv	a0,s2
   10d88:	3b9000ef          	jal	11940 <__malloc_unlock>
   10d8c:	01c12083          	lw	ra,28(sp)
   10d90:	01812403          	lw	s0,24(sp)
   10d94:	01412483          	lw	s1,20(sp)
   10d98:	01012903          	lw	s2,16(sp)
   10d9c:	00c12983          	lw	s3,12(sp)
   10da0:	00812a03          	lw	s4,8(sp)
   10da4:	00000513          	li	a0,0
   10da8:	02010113          	addi	sp,sp,32
   10dac:	00008067          	ret
   10db0:	408005b3          	neg	a1,s0
   10db4:	00090513          	mv	a0,s2
   10db8:	7dd000ef          	jal	11d94 <_sbrk_r>
   10dbc:	fff00793          	li	a5,-1
   10dc0:	04f50863          	beq	a0,a5,10e10 <_malloc_trim_r+0x104>
   10dc4:	eb818793          	addi	a5,gp,-328 # 137a8 <__malloc_current_mallinfo>
   10dc8:	0089a683          	lw	a3,8(s3)
   10dcc:	0007a703          	lw	a4,0(a5) # 1000 <exit-0xf0b4>
   10dd0:	408484b3          	sub	s1,s1,s0
   10dd4:	0014e493          	ori	s1,s1,1
   10dd8:	00090513          	mv	a0,s2
   10ddc:	40870733          	sub	a4,a4,s0
   10de0:	0096a223          	sw	s1,4(a3)
   10de4:	00e7a023          	sw	a4,0(a5)
   10de8:	359000ef          	jal	11940 <__malloc_unlock>
   10dec:	01c12083          	lw	ra,28(sp)
   10df0:	01812403          	lw	s0,24(sp)
   10df4:	01412483          	lw	s1,20(sp)
   10df8:	01012903          	lw	s2,16(sp)
   10dfc:	00c12983          	lw	s3,12(sp)
   10e00:	00812a03          	lw	s4,8(sp)
   10e04:	00100513          	li	a0,1
   10e08:	02010113          	addi	sp,sp,32
   10e0c:	00008067          	ret
   10e10:	00000593          	li	a1,0
   10e14:	00090513          	mv	a0,s2
   10e18:	77d000ef          	jal	11d94 <_sbrk_r>
   10e1c:	0089a703          	lw	a4,8(s3)
   10e20:	00f00693          	li	a3,15
   10e24:	40e507b3          	sub	a5,a0,a4
   10e28:	f4f6dee3          	bge	a3,a5,10d84 <_malloc_trim_r+0x78>
   10e2c:	d401a603          	lw	a2,-704(gp) # 13630 <__malloc_sbrk_base>
   10e30:	0017e793          	ori	a5,a5,1
   10e34:	40c50533          	sub	a0,a0,a2
   10e38:	00f72223          	sw	a5,4(a4)
   10e3c:	eaa1ac23          	sw	a0,-328(gp) # 137a8 <__malloc_current_mallinfo>
   10e40:	f45ff06f          	j	10d84 <_malloc_trim_r+0x78>

00010e44 <_free_r>:
   10e44:	12058663          	beqz	a1,10f70 <_free_r+0x12c>
   10e48:	ff010113          	addi	sp,sp,-16
   10e4c:	00812423          	sw	s0,8(sp)
   10e50:	00912223          	sw	s1,4(sp)
   10e54:	00058413          	mv	s0,a1
   10e58:	00050493          	mv	s1,a0
   10e5c:	00112623          	sw	ra,12(sp)
   10e60:	2dd000ef          	jal	1193c <__malloc_lock>
   10e64:	ffc42503          	lw	a0,-4(s0)
   10e68:	ff840713          	addi	a4,s0,-8
   10e6c:	000135b7          	lui	a1,0x13
   10e70:	ffe57793          	andi	a5,a0,-2
   10e74:	00f70633          	add	a2,a4,a5
   10e78:	22058593          	addi	a1,a1,544 # 13220 <__malloc_av_>
   10e7c:	00462683          	lw	a3,4(a2)
   10e80:	0085a803          	lw	a6,8(a1)
   10e84:	00157893          	andi	a7,a0,1
   10e88:	ffc6f693          	andi	a3,a3,-4
   10e8c:	18c80c63          	beq	a6,a2,11024 <_free_r+0x1e0>
   10e90:	00d62223          	sw	a3,4(a2)
   10e94:	00d60833          	add	a6,a2,a3
   10e98:	00482803          	lw	a6,4(a6)
   10e9c:	00187813          	andi	a6,a6,1
   10ea0:	08089c63          	bnez	a7,10f38 <_free_r+0xf4>
   10ea4:	ff842303          	lw	t1,-8(s0)
   10ea8:	00013537          	lui	a0,0x13
   10eac:	22850513          	addi	a0,a0,552 # 13228 <__malloc_av_+0x8>
   10eb0:	40670733          	sub	a4,a4,t1
   10eb4:	00872883          	lw	a7,8(a4)
   10eb8:	006787b3          	add	a5,a5,t1
   10ebc:	12a88e63          	beq	a7,a0,10ff8 <_free_r+0x1b4>
   10ec0:	00c72303          	lw	t1,12(a4)
   10ec4:	0068a623          	sw	t1,12(a7)
   10ec8:	01132423          	sw	a7,8(t1) # 101ac <frame_dummy+0x1c>
   10ecc:	1a080063          	beqz	a6,1106c <_free_r+0x228>
   10ed0:	0017e693          	ori	a3,a5,1
   10ed4:	00d72223          	sw	a3,4(a4)
   10ed8:	00f62023          	sw	a5,0(a2)
   10edc:	1ff00693          	li	a3,511
   10ee0:	0af6e463          	bltu	a3,a5,10f88 <_free_r+0x144>
   10ee4:	ff87f693          	andi	a3,a5,-8
   10ee8:	00868693          	addi	a3,a3,8
   10eec:	0045a503          	lw	a0,4(a1)
   10ef0:	00d586b3          	add	a3,a1,a3
   10ef4:	0006a603          	lw	a2,0(a3)
   10ef8:	0057d813          	srli	a6,a5,0x5
   10efc:	00100793          	li	a5,1
   10f00:	010797b3          	sll	a5,a5,a6
   10f04:	00a7e7b3          	or	a5,a5,a0
   10f08:	ff868513          	addi	a0,a3,-8
   10f0c:	00c72423          	sw	a2,8(a4)
   10f10:	00a72623          	sw	a0,12(a4)
   10f14:	00f5a223          	sw	a5,4(a1)
   10f18:	00e6a023          	sw	a4,0(a3)
   10f1c:	00e62623          	sw	a4,12(a2)
   10f20:	00812403          	lw	s0,8(sp)
   10f24:	00c12083          	lw	ra,12(sp)
   10f28:	00048513          	mv	a0,s1
   10f2c:	00412483          	lw	s1,4(sp)
   10f30:	01010113          	addi	sp,sp,16
   10f34:	20d0006f          	j	11940 <__malloc_unlock>
   10f38:	02081e63          	bnez	a6,10f74 <_free_r+0x130>
   10f3c:	00013537          	lui	a0,0x13
   10f40:	00d787b3          	add	a5,a5,a3
   10f44:	22850513          	addi	a0,a0,552 # 13228 <__malloc_av_+0x8>
   10f48:	00862683          	lw	a3,8(a2)
   10f4c:	0017e893          	ori	a7,a5,1
   10f50:	00f70833          	add	a6,a4,a5
   10f54:	16a68263          	beq	a3,a0,110b8 <_free_r+0x274>
   10f58:	00c62603          	lw	a2,12(a2)
   10f5c:	00c6a623          	sw	a2,12(a3)
   10f60:	00d62423          	sw	a3,8(a2)
   10f64:	01172223          	sw	a7,4(a4)
   10f68:	00f82023          	sw	a5,0(a6)
   10f6c:	f71ff06f          	j	10edc <_free_r+0x98>
   10f70:	00008067          	ret
   10f74:	00156513          	ori	a0,a0,1
   10f78:	fea42e23          	sw	a0,-4(s0)
   10f7c:	00f62023          	sw	a5,0(a2)
   10f80:	1ff00693          	li	a3,511
   10f84:	f6f6f0e3          	bgeu	a3,a5,10ee4 <_free_r+0xa0>
   10f88:	0097d693          	srli	a3,a5,0x9
   10f8c:	00400613          	li	a2,4
   10f90:	0ed66263          	bltu	a2,a3,11074 <_free_r+0x230>
   10f94:	0067d693          	srli	a3,a5,0x6
   10f98:	03968513          	addi	a0,a3,57
   10f9c:	00351513          	slli	a0,a0,0x3
   10fa0:	03868613          	addi	a2,a3,56
   10fa4:	00a58533          	add	a0,a1,a0
   10fa8:	00052683          	lw	a3,0(a0)
   10fac:	ff850513          	addi	a0,a0,-8
   10fb0:	00d51863          	bne	a0,a3,10fc0 <_free_r+0x17c>
   10fb4:	1200006f          	j	110d4 <_free_r+0x290>
   10fb8:	0086a683          	lw	a3,8(a3)
   10fbc:	00d50863          	beq	a0,a3,10fcc <_free_r+0x188>
   10fc0:	0046a603          	lw	a2,4(a3)
   10fc4:	ffc67613          	andi	a2,a2,-4
   10fc8:	fec7e8e3          	bltu	a5,a2,10fb8 <_free_r+0x174>
   10fcc:	00c6a503          	lw	a0,12(a3)
   10fd0:	00a72623          	sw	a0,12(a4)
   10fd4:	00d72423          	sw	a3,8(a4)
   10fd8:	00812403          	lw	s0,8(sp)
   10fdc:	00e52423          	sw	a4,8(a0)
   10fe0:	00c12083          	lw	ra,12(sp)
   10fe4:	00048513          	mv	a0,s1
   10fe8:	00412483          	lw	s1,4(sp)
   10fec:	00e6a623          	sw	a4,12(a3)
   10ff0:	01010113          	addi	sp,sp,16
   10ff4:	14d0006f          	j	11940 <__malloc_unlock>
   10ff8:	0a081063          	bnez	a6,11098 <_free_r+0x254>
   10ffc:	00c62583          	lw	a1,12(a2)
   11000:	00862603          	lw	a2,8(a2)
   11004:	00f686b3          	add	a3,a3,a5
   11008:	0016e793          	ori	a5,a3,1
   1100c:	00b62623          	sw	a1,12(a2)
   11010:	00c5a423          	sw	a2,8(a1)
   11014:	00f72223          	sw	a5,4(a4)
   11018:	00d70733          	add	a4,a4,a3
   1101c:	00d72023          	sw	a3,0(a4)
   11020:	f01ff06f          	j	10f20 <_free_r+0xdc>
   11024:	00d786b3          	add	a3,a5,a3
   11028:	02089063          	bnez	a7,11048 <_free_r+0x204>
   1102c:	ff842503          	lw	a0,-8(s0)
   11030:	40a70733          	sub	a4,a4,a0
   11034:	00c72783          	lw	a5,12(a4)
   11038:	00872603          	lw	a2,8(a4)
   1103c:	00a686b3          	add	a3,a3,a0
   11040:	00f62623          	sw	a5,12(a2)
   11044:	00c7a423          	sw	a2,8(a5)
   11048:	0016e613          	ori	a2,a3,1
   1104c:	d441a783          	lw	a5,-700(gp) # 13634 <__malloc_trim_threshold>
   11050:	00c72223          	sw	a2,4(a4)
   11054:	00e5a423          	sw	a4,8(a1)
   11058:	ecf6e4e3          	bltu	a3,a5,10f20 <_free_r+0xdc>
   1105c:	d5c1a583          	lw	a1,-676(gp) # 1364c <__malloc_top_pad>
   11060:	00048513          	mv	a0,s1
   11064:	ca9ff0ef          	jal	10d0c <_malloc_trim_r>
   11068:	eb9ff06f          	j	10f20 <_free_r+0xdc>
   1106c:	00d787b3          	add	a5,a5,a3
   11070:	ed9ff06f          	j	10f48 <_free_r+0x104>
   11074:	01400613          	li	a2,20
   11078:	02d67863          	bgeu	a2,a3,110a8 <_free_r+0x264>
   1107c:	05400613          	li	a2,84
   11080:	06d66863          	bltu	a2,a3,110f0 <_free_r+0x2ac>
   11084:	00c7d693          	srli	a3,a5,0xc
   11088:	06f68513          	addi	a0,a3,111
   1108c:	00351513          	slli	a0,a0,0x3
   11090:	06e68613          	addi	a2,a3,110
   11094:	f11ff06f          	j	10fa4 <_free_r+0x160>
   11098:	0017e693          	ori	a3,a5,1
   1109c:	00d72223          	sw	a3,4(a4)
   110a0:	00f62023          	sw	a5,0(a2)
   110a4:	e7dff06f          	j	10f20 <_free_r+0xdc>
   110a8:	05c68513          	addi	a0,a3,92
   110ac:	00351513          	slli	a0,a0,0x3
   110b0:	05b68613          	addi	a2,a3,91
   110b4:	ef1ff06f          	j	10fa4 <_free_r+0x160>
   110b8:	00e5aa23          	sw	a4,20(a1)
   110bc:	00e5a823          	sw	a4,16(a1)
   110c0:	00a72623          	sw	a0,12(a4)
   110c4:	00a72423          	sw	a0,8(a4)
   110c8:	01172223          	sw	a7,4(a4)
   110cc:	00f82023          	sw	a5,0(a6)
   110d0:	e51ff06f          	j	10f20 <_free_r+0xdc>
   110d4:	0045a803          	lw	a6,4(a1)
   110d8:	40265613          	srai	a2,a2,0x2
   110dc:	00100793          	li	a5,1
   110e0:	00c797b3          	sll	a5,a5,a2
   110e4:	0107e7b3          	or	a5,a5,a6
   110e8:	00f5a223          	sw	a5,4(a1)
   110ec:	ee5ff06f          	j	10fd0 <_free_r+0x18c>
   110f0:	15400613          	li	a2,340
   110f4:	00d66c63          	bltu	a2,a3,1110c <_free_r+0x2c8>
   110f8:	00f7d693          	srli	a3,a5,0xf
   110fc:	07868513          	addi	a0,a3,120
   11100:	00351513          	slli	a0,a0,0x3
   11104:	07768613          	addi	a2,a3,119
   11108:	e9dff06f          	j	10fa4 <_free_r+0x160>
   1110c:	55400613          	li	a2,1364
   11110:	00d66c63          	bltu	a2,a3,11128 <_free_r+0x2e4>
   11114:	0127d693          	srli	a3,a5,0x12
   11118:	07d68513          	addi	a0,a3,125
   1111c:	00351513          	slli	a0,a0,0x3
   11120:	07c68613          	addi	a2,a3,124
   11124:	e81ff06f          	j	10fa4 <_free_r+0x160>
   11128:	3f800513          	li	a0,1016
   1112c:	07e00613          	li	a2,126
   11130:	e75ff06f          	j	10fa4 <_free_r+0x160>

00011134 <_malloc_r>:
   11134:	fd010113          	addi	sp,sp,-48
   11138:	01312e23          	sw	s3,28(sp)
   1113c:	02112623          	sw	ra,44(sp)
   11140:	02812423          	sw	s0,40(sp)
   11144:	02912223          	sw	s1,36(sp)
   11148:	03212023          	sw	s2,32(sp)
   1114c:	00b58793          	addi	a5,a1,11
   11150:	01600713          	li	a4,22
   11154:	00050993          	mv	s3,a0
   11158:	08f76063          	bltu	a4,a5,111d8 <_malloc_r+0xa4>
   1115c:	01000493          	li	s1,16
   11160:	20b4e463          	bltu	s1,a1,11368 <_malloc_r+0x234>
   11164:	7d8000ef          	jal	1193c <__malloc_lock>
   11168:	01800793          	li	a5,24
   1116c:	00200593          	li	a1,2
   11170:	00013937          	lui	s2,0x13
   11174:	22090913          	addi	s2,s2,544 # 13220 <__malloc_av_>
   11178:	00f907b3          	add	a5,s2,a5
   1117c:	0047a403          	lw	s0,4(a5)
   11180:	ff878713          	addi	a4,a5,-8
   11184:	44e40663          	beq	s0,a4,115d0 <_malloc_r+0x49c>
   11188:	00442783          	lw	a5,4(s0)
   1118c:	00c42683          	lw	a3,12(s0)
   11190:	00842603          	lw	a2,8(s0)
   11194:	ffc7f793          	andi	a5,a5,-4
   11198:	00f407b3          	add	a5,s0,a5
   1119c:	0047a703          	lw	a4,4(a5)
   111a0:	00d62623          	sw	a3,12(a2)
   111a4:	00c6a423          	sw	a2,8(a3)
   111a8:	00176713          	ori	a4,a4,1
   111ac:	00098513          	mv	a0,s3
   111b0:	00e7a223          	sw	a4,4(a5)
   111b4:	78c000ef          	jal	11940 <__malloc_unlock>
   111b8:	02c12083          	lw	ra,44(sp)
   111bc:	00840513          	addi	a0,s0,8
   111c0:	02812403          	lw	s0,40(sp)
   111c4:	02412483          	lw	s1,36(sp)
   111c8:	02012903          	lw	s2,32(sp)
   111cc:	01c12983          	lw	s3,28(sp)
   111d0:	03010113          	addi	sp,sp,48
   111d4:	00008067          	ret
   111d8:	ff87f493          	andi	s1,a5,-8
   111dc:	1807c663          	bltz	a5,11368 <_malloc_r+0x234>
   111e0:	18b4e463          	bltu	s1,a1,11368 <_malloc_r+0x234>
   111e4:	758000ef          	jal	1193c <__malloc_lock>
   111e8:	1f700793          	li	a5,503
   111ec:	4e97fc63          	bgeu	a5,s1,116e4 <_malloc_r+0x5b0>
   111f0:	0094d793          	srli	a5,s1,0x9
   111f4:	18078e63          	beqz	a5,11390 <_malloc_r+0x25c>
   111f8:	00400713          	li	a4,4
   111fc:	44f76263          	bltu	a4,a5,11640 <_malloc_r+0x50c>
   11200:	0064d793          	srli	a5,s1,0x6
   11204:	03978593          	addi	a1,a5,57
   11208:	03878813          	addi	a6,a5,56
   1120c:	00359613          	slli	a2,a1,0x3
   11210:	00013937          	lui	s2,0x13
   11214:	22090913          	addi	s2,s2,544 # 13220 <__malloc_av_>
   11218:	00c90633          	add	a2,s2,a2
   1121c:	00462403          	lw	s0,4(a2)
   11220:	ff860613          	addi	a2,a2,-8
   11224:	02860863          	beq	a2,s0,11254 <_malloc_r+0x120>
   11228:	00f00513          	li	a0,15
   1122c:	0140006f          	j	11240 <_malloc_r+0x10c>
   11230:	00c42683          	lw	a3,12(s0)
   11234:	34075c63          	bgez	a4,1158c <_malloc_r+0x458>
   11238:	00d60e63          	beq	a2,a3,11254 <_malloc_r+0x120>
   1123c:	00068413          	mv	s0,a3
   11240:	00442783          	lw	a5,4(s0)
   11244:	ffc7f793          	andi	a5,a5,-4
   11248:	40978733          	sub	a4,a5,s1
   1124c:	fee552e3          	bge	a0,a4,11230 <_malloc_r+0xfc>
   11250:	00080593          	mv	a1,a6
   11254:	01092403          	lw	s0,16(s2)
   11258:	00013837          	lui	a6,0x13
   1125c:	22880813          	addi	a6,a6,552 # 13228 <__malloc_av_+0x8>
   11260:	2b040663          	beq	s0,a6,1150c <_malloc_r+0x3d8>
   11264:	00442783          	lw	a5,4(s0)
   11268:	00f00693          	li	a3,15
   1126c:	ffc7f793          	andi	a5,a5,-4
   11270:	40978733          	sub	a4,a5,s1
   11274:	46e6ce63          	blt	a3,a4,116f0 <_malloc_r+0x5bc>
   11278:	01092a23          	sw	a6,20(s2)
   1127c:	01092823          	sw	a6,16(s2)
   11280:	44075263          	bgez	a4,116c4 <_malloc_r+0x590>
   11284:	1ff00713          	li	a4,511
   11288:	00492503          	lw	a0,4(s2)
   1128c:	34f76a63          	bltu	a4,a5,115e0 <_malloc_r+0x4ac>
   11290:	ff87f713          	andi	a4,a5,-8
   11294:	00870713          	addi	a4,a4,8
   11298:	00e90733          	add	a4,s2,a4
   1129c:	00072683          	lw	a3,0(a4)
   112a0:	0057d613          	srli	a2,a5,0x5
   112a4:	00100793          	li	a5,1
   112a8:	00c797b3          	sll	a5,a5,a2
   112ac:	00f56533          	or	a0,a0,a5
   112b0:	ff870793          	addi	a5,a4,-8
   112b4:	00d42423          	sw	a3,8(s0)
   112b8:	00f42623          	sw	a5,12(s0)
   112bc:	00a92223          	sw	a0,4(s2)
   112c0:	00872023          	sw	s0,0(a4)
   112c4:	0086a623          	sw	s0,12(a3)
   112c8:	4025d793          	srai	a5,a1,0x2
   112cc:	00100613          	li	a2,1
   112d0:	00f61633          	sll	a2,a2,a5
   112d4:	0cc56663          	bltu	a0,a2,113a0 <_malloc_r+0x26c>
   112d8:	00a677b3          	and	a5,a2,a0
   112dc:	02079463          	bnez	a5,11304 <_malloc_r+0x1d0>
   112e0:	00161613          	slli	a2,a2,0x1
   112e4:	ffc5f593          	andi	a1,a1,-4
   112e8:	00a677b3          	and	a5,a2,a0
   112ec:	00458593          	addi	a1,a1,4
   112f0:	00079a63          	bnez	a5,11304 <_malloc_r+0x1d0>
   112f4:	00161613          	slli	a2,a2,0x1
   112f8:	00a677b3          	and	a5,a2,a0
   112fc:	00458593          	addi	a1,a1,4
   11300:	fe078ae3          	beqz	a5,112f4 <_malloc_r+0x1c0>
   11304:	00f00893          	li	a7,15
   11308:	00359313          	slli	t1,a1,0x3
   1130c:	00690333          	add	t1,s2,t1
   11310:	00030513          	mv	a0,t1
   11314:	00c52783          	lw	a5,12(a0)
   11318:	00058e13          	mv	t3,a1
   1131c:	34f50463          	beq	a0,a5,11664 <_malloc_r+0x530>
   11320:	0047a703          	lw	a4,4(a5)
   11324:	00078413          	mv	s0,a5
   11328:	00c7a783          	lw	a5,12(a5)
   1132c:	ffc77713          	andi	a4,a4,-4
   11330:	409706b3          	sub	a3,a4,s1
   11334:	34d8c463          	blt	a7,a3,1167c <_malloc_r+0x548>
   11338:	fe06c2e3          	bltz	a3,1131c <_malloc_r+0x1e8>
   1133c:	00e40733          	add	a4,s0,a4
   11340:	00472683          	lw	a3,4(a4)
   11344:	00842603          	lw	a2,8(s0)
   11348:	00098513          	mv	a0,s3
   1134c:	0016e693          	ori	a3,a3,1
   11350:	00d72223          	sw	a3,4(a4)
   11354:	00f62623          	sw	a5,12(a2)
   11358:	00c7a423          	sw	a2,8(a5)
   1135c:	5e4000ef          	jal	11940 <__malloc_unlock>
   11360:	00840513          	addi	a0,s0,8
   11364:	0100006f          	j	11374 <_malloc_r+0x240>
   11368:	00c00793          	li	a5,12
   1136c:	00f9a023          	sw	a5,0(s3)
   11370:	00000513          	li	a0,0
   11374:	02c12083          	lw	ra,44(sp)
   11378:	02812403          	lw	s0,40(sp)
   1137c:	02412483          	lw	s1,36(sp)
   11380:	02012903          	lw	s2,32(sp)
   11384:	01c12983          	lw	s3,28(sp)
   11388:	03010113          	addi	sp,sp,48
   1138c:	00008067          	ret
   11390:	20000613          	li	a2,512
   11394:	04000593          	li	a1,64
   11398:	03f00813          	li	a6,63
   1139c:	e75ff06f          	j	11210 <_malloc_r+0xdc>
   113a0:	00892403          	lw	s0,8(s2)
   113a4:	01612823          	sw	s6,16(sp)
   113a8:	00442783          	lw	a5,4(s0)
   113ac:	ffc7fb13          	andi	s6,a5,-4
   113b0:	009b6863          	bltu	s6,s1,113c0 <_malloc_r+0x28c>
   113b4:	409b0733          	sub	a4,s6,s1
   113b8:	00f00793          	li	a5,15
   113bc:	18e7c663          	blt	a5,a4,11548 <_malloc_r+0x414>
   113c0:	01912223          	sw	s9,4(sp)
   113c4:	01512a23          	sw	s5,20(sp)
   113c8:	d401a703          	lw	a4,-704(gp) # 13630 <__malloc_sbrk_base>
   113cc:	d5c1aa83          	lw	s5,-676(gp) # 1364c <__malloc_top_pad>
   113d0:	01412c23          	sw	s4,24(sp)
   113d4:	01712623          	sw	s7,12(sp)
   113d8:	fff00793          	li	a5,-1
   113dc:	01548ab3          	add	s5,s1,s5
   113e0:	01640a33          	add	s4,s0,s6
   113e4:	3cf70c63          	beq	a4,a5,117bc <_malloc_r+0x688>
   113e8:	000017b7          	lui	a5,0x1
   113ec:	00f78793          	addi	a5,a5,15 # 100f <exit-0xf0a5>
   113f0:	00fa8ab3          	add	s5,s5,a5
   113f4:	fffff7b7          	lui	a5,0xfffff
   113f8:	00fafab3          	and	s5,s5,a5
   113fc:	000a8593          	mv	a1,s5
   11400:	00098513          	mv	a0,s3
   11404:	191000ef          	jal	11d94 <_sbrk_r>
   11408:	fff00793          	li	a5,-1
   1140c:	00050b93          	mv	s7,a0
   11410:	46f50863          	beq	a0,a5,11880 <_malloc_r+0x74c>
   11414:	01812423          	sw	s8,8(sp)
   11418:	0f456e63          	bltu	a0,s4,11514 <_malloc_r+0x3e0>
   1141c:	eb818c13          	addi	s8,gp,-328 # 137a8 <__malloc_current_mallinfo>
   11420:	000c2583          	lw	a1,0(s8)
   11424:	00ba85b3          	add	a1,s5,a1
   11428:	00bc2023          	sw	a1,0(s8)
   1142c:	00058713          	mv	a4,a1
   11430:	44aa0e63          	beq	s4,a0,1188c <_malloc_r+0x758>
   11434:	d401a683          	lw	a3,-704(gp) # 13630 <__malloc_sbrk_base>
   11438:	fff00793          	li	a5,-1
   1143c:	46f68663          	beq	a3,a5,118a8 <_malloc_r+0x774>
   11440:	414b87b3          	sub	a5,s7,s4
   11444:	00e787b3          	add	a5,a5,a4
   11448:	00fc2023          	sw	a5,0(s8)
   1144c:	007bfc93          	andi	s9,s7,7
   11450:	380c8663          	beqz	s9,117dc <_malloc_r+0x6a8>
   11454:	419b8bb3          	sub	s7,s7,s9
   11458:	000015b7          	lui	a1,0x1
   1145c:	008b8b93          	addi	s7,s7,8
   11460:	00858593          	addi	a1,a1,8 # 1008 <exit-0xf0ac>
   11464:	015b8ab3          	add	s5,s7,s5
   11468:	419585b3          	sub	a1,a1,s9
   1146c:	415585b3          	sub	a1,a1,s5
   11470:	01459593          	slli	a1,a1,0x14
   11474:	0145da13          	srli	s4,a1,0x14
   11478:	000a0593          	mv	a1,s4
   1147c:	00098513          	mv	a0,s3
   11480:	115000ef          	jal	11d94 <_sbrk_r>
   11484:	fff00793          	li	a5,-1
   11488:	46f50063          	beq	a0,a5,118e8 <_malloc_r+0x7b4>
   1148c:	41750533          	sub	a0,a0,s7
   11490:	01450ab3          	add	s5,a0,s4
   11494:	000c2703          	lw	a4,0(s8)
   11498:	01792423          	sw	s7,8(s2)
   1149c:	001ae793          	ori	a5,s5,1
   114a0:	00ea05b3          	add	a1,s4,a4
   114a4:	00fba223          	sw	a5,4(s7)
   114a8:	00bc2023          	sw	a1,0(s8)
   114ac:	03240e63          	beq	s0,s2,114e8 <_malloc_r+0x3b4>
   114b0:	00f00693          	li	a3,15
   114b4:	3566fa63          	bgeu	a3,s6,11808 <_malloc_r+0x6d4>
   114b8:	00442703          	lw	a4,4(s0)
   114bc:	ff4b0793          	addi	a5,s6,-12
   114c0:	ff87f793          	andi	a5,a5,-8
   114c4:	00177713          	andi	a4,a4,1
   114c8:	00f76733          	or	a4,a4,a5
   114cc:	00e42223          	sw	a4,4(s0)
   114d0:	00500613          	li	a2,5
   114d4:	00f40733          	add	a4,s0,a5
   114d8:	00c72223          	sw	a2,4(a4)
   114dc:	00c72423          	sw	a2,8(a4)
   114e0:	2cf6e263          	bltu	a3,a5,117a4 <_malloc_r+0x670>
   114e4:	004ba783          	lw	a5,4(s7)
   114e8:	d581a683          	lw	a3,-680(gp) # 13648 <__malloc_max_sbrked_mem>
   114ec:	00b6f463          	bgeu	a3,a1,114f4 <_malloc_r+0x3c0>
   114f0:	d4b1ac23          	sw	a1,-680(gp) # 13648 <__malloc_max_sbrked_mem>
   114f4:	d541a683          	lw	a3,-684(gp) # 13644 <__malloc_max_total_mem>
   114f8:	00b6f463          	bgeu	a3,a1,11500 <_malloc_r+0x3cc>
   114fc:	d4b1aa23          	sw	a1,-684(gp) # 13644 <__malloc_max_total_mem>
   11500:	00812c03          	lw	s8,8(sp)
   11504:	000b8413          	mv	s0,s7
   11508:	01c0006f          	j	11524 <_malloc_r+0x3f0>
   1150c:	00492503          	lw	a0,4(s2)
   11510:	db9ff06f          	j	112c8 <_malloc_r+0x194>
   11514:	35240c63          	beq	s0,s2,1186c <_malloc_r+0x738>
   11518:	00892403          	lw	s0,8(s2)
   1151c:	00812c03          	lw	s8,8(sp)
   11520:	00442783          	lw	a5,4(s0)
   11524:	ffc7f793          	andi	a5,a5,-4
   11528:	40978733          	sub	a4,a5,s1
   1152c:	2e97e463          	bltu	a5,s1,11814 <_malloc_r+0x6e0>
   11530:	00f00793          	li	a5,15
   11534:	2ee7d063          	bge	a5,a4,11814 <_malloc_r+0x6e0>
   11538:	01812a03          	lw	s4,24(sp)
   1153c:	01412a83          	lw	s5,20(sp)
   11540:	00c12b83          	lw	s7,12(sp)
   11544:	00412c83          	lw	s9,4(sp)
   11548:	0014e793          	ori	a5,s1,1
   1154c:	00f42223          	sw	a5,4(s0)
   11550:	009404b3          	add	s1,s0,s1
   11554:	00992423          	sw	s1,8(s2)
   11558:	00176713          	ori	a4,a4,1
   1155c:	00098513          	mv	a0,s3
   11560:	00e4a223          	sw	a4,4(s1)
   11564:	3dc000ef          	jal	11940 <__malloc_unlock>
   11568:	02c12083          	lw	ra,44(sp)
   1156c:	00840513          	addi	a0,s0,8
   11570:	02812403          	lw	s0,40(sp)
   11574:	01012b03          	lw	s6,16(sp)
   11578:	02412483          	lw	s1,36(sp)
   1157c:	02012903          	lw	s2,32(sp)
   11580:	01c12983          	lw	s3,28(sp)
   11584:	03010113          	addi	sp,sp,48
   11588:	00008067          	ret
   1158c:	00842603          	lw	a2,8(s0)
   11590:	00f407b3          	add	a5,s0,a5
   11594:	0047a703          	lw	a4,4(a5) # fffff004 <__BSS_END__+0xfffeb6a4>
   11598:	00d62623          	sw	a3,12(a2)
   1159c:	00c6a423          	sw	a2,8(a3)
   115a0:	00176713          	ori	a4,a4,1
   115a4:	00098513          	mv	a0,s3
   115a8:	00e7a223          	sw	a4,4(a5)
   115ac:	394000ef          	jal	11940 <__malloc_unlock>
   115b0:	02c12083          	lw	ra,44(sp)
   115b4:	00840513          	addi	a0,s0,8
   115b8:	02812403          	lw	s0,40(sp)
   115bc:	02412483          	lw	s1,36(sp)
   115c0:	02012903          	lw	s2,32(sp)
   115c4:	01c12983          	lw	s3,28(sp)
   115c8:	03010113          	addi	sp,sp,48
   115cc:	00008067          	ret
   115d0:	00c7a403          	lw	s0,12(a5)
   115d4:	00258593          	addi	a1,a1,2
   115d8:	c6878ee3          	beq	a5,s0,11254 <_malloc_r+0x120>
   115dc:	badff06f          	j	11188 <_malloc_r+0x54>
   115e0:	0097d713          	srli	a4,a5,0x9
   115e4:	00400693          	li	a3,4
   115e8:	14e6f263          	bgeu	a3,a4,1172c <_malloc_r+0x5f8>
   115ec:	01400693          	li	a3,20
   115f0:	24e6e263          	bltu	a3,a4,11834 <_malloc_r+0x700>
   115f4:	05c70613          	addi	a2,a4,92
   115f8:	00361613          	slli	a2,a2,0x3
   115fc:	05b70693          	addi	a3,a4,91
   11600:	00c90633          	add	a2,s2,a2
   11604:	00062703          	lw	a4,0(a2)
   11608:	ff860613          	addi	a2,a2,-8
   1160c:	00e61863          	bne	a2,a4,1161c <_malloc_r+0x4e8>
   11610:	1b40006f          	j	117c4 <_malloc_r+0x690>
   11614:	00872703          	lw	a4,8(a4)
   11618:	00e60863          	beq	a2,a4,11628 <_malloc_r+0x4f4>
   1161c:	00472683          	lw	a3,4(a4)
   11620:	ffc6f693          	andi	a3,a3,-4
   11624:	fed7e8e3          	bltu	a5,a3,11614 <_malloc_r+0x4e0>
   11628:	00c72603          	lw	a2,12(a4)
   1162c:	00c42623          	sw	a2,12(s0)
   11630:	00e42423          	sw	a4,8(s0)
   11634:	00862423          	sw	s0,8(a2)
   11638:	00872623          	sw	s0,12(a4)
   1163c:	c8dff06f          	j	112c8 <_malloc_r+0x194>
   11640:	01400713          	li	a4,20
   11644:	0ef77e63          	bgeu	a4,a5,11740 <_malloc_r+0x60c>
   11648:	05400713          	li	a4,84
   1164c:	20f76263          	bltu	a4,a5,11850 <_malloc_r+0x71c>
   11650:	00c4d793          	srli	a5,s1,0xc
   11654:	06f78593          	addi	a1,a5,111
   11658:	06e78813          	addi	a6,a5,110
   1165c:	00359613          	slli	a2,a1,0x3
   11660:	bb1ff06f          	j	11210 <_malloc_r+0xdc>
   11664:	001e0e13          	addi	t3,t3,1
   11668:	003e7793          	andi	a5,t3,3
   1166c:	00850513          	addi	a0,a0,8
   11670:	0e078663          	beqz	a5,1175c <_malloc_r+0x628>
   11674:	00c52783          	lw	a5,12(a0)
   11678:	ca5ff06f          	j	1131c <_malloc_r+0x1e8>
   1167c:	00842603          	lw	a2,8(s0)
   11680:	0014e593          	ori	a1,s1,1
   11684:	00b42223          	sw	a1,4(s0)
   11688:	00f62623          	sw	a5,12(a2)
   1168c:	00c7a423          	sw	a2,8(a5)
   11690:	009404b3          	add	s1,s0,s1
   11694:	00992a23          	sw	s1,20(s2)
   11698:	00992823          	sw	s1,16(s2)
   1169c:	0016e793          	ori	a5,a3,1
   116a0:	00e40733          	add	a4,s0,a4
   116a4:	0104a623          	sw	a6,12(s1)
   116a8:	0104a423          	sw	a6,8(s1)
   116ac:	00f4a223          	sw	a5,4(s1)
   116b0:	00098513          	mv	a0,s3
   116b4:	00d72023          	sw	a3,0(a4)
   116b8:	288000ef          	jal	11940 <__malloc_unlock>
   116bc:	00840513          	addi	a0,s0,8
   116c0:	cb5ff06f          	j	11374 <_malloc_r+0x240>
   116c4:	00f407b3          	add	a5,s0,a5
   116c8:	0047a703          	lw	a4,4(a5)
   116cc:	00098513          	mv	a0,s3
   116d0:	00176713          	ori	a4,a4,1
   116d4:	00e7a223          	sw	a4,4(a5)
   116d8:	268000ef          	jal	11940 <__malloc_unlock>
   116dc:	00840513          	addi	a0,s0,8
   116e0:	c95ff06f          	j	11374 <_malloc_r+0x240>
   116e4:	0034d593          	srli	a1,s1,0x3
   116e8:	00848793          	addi	a5,s1,8
   116ec:	a85ff06f          	j	11170 <_malloc_r+0x3c>
   116f0:	0014e693          	ori	a3,s1,1
   116f4:	00d42223          	sw	a3,4(s0)
   116f8:	009404b3          	add	s1,s0,s1
   116fc:	00992a23          	sw	s1,20(s2)
   11700:	00992823          	sw	s1,16(s2)
   11704:	00176693          	ori	a3,a4,1
   11708:	00f407b3          	add	a5,s0,a5
   1170c:	0104a623          	sw	a6,12(s1)
   11710:	0104a423          	sw	a6,8(s1)
   11714:	00d4a223          	sw	a3,4(s1)
   11718:	00098513          	mv	a0,s3
   1171c:	00e7a023          	sw	a4,0(a5)
   11720:	220000ef          	jal	11940 <__malloc_unlock>
   11724:	00840513          	addi	a0,s0,8
   11728:	c4dff06f          	j	11374 <_malloc_r+0x240>
   1172c:	0067d713          	srli	a4,a5,0x6
   11730:	03970613          	addi	a2,a4,57
   11734:	00361613          	slli	a2,a2,0x3
   11738:	03870693          	addi	a3,a4,56
   1173c:	ec5ff06f          	j	11600 <_malloc_r+0x4cc>
   11740:	05c78593          	addi	a1,a5,92
   11744:	05b78813          	addi	a6,a5,91
   11748:	00359613          	slli	a2,a1,0x3
   1174c:	ac5ff06f          	j	11210 <_malloc_r+0xdc>
   11750:	00832783          	lw	a5,8(t1)
   11754:	fff58593          	addi	a1,a1,-1
   11758:	1c679e63          	bne	a5,t1,11934 <_malloc_r+0x800>
   1175c:	0035f793          	andi	a5,a1,3
   11760:	ff830313          	addi	t1,t1,-8
   11764:	fe0796e3          	bnez	a5,11750 <_malloc_r+0x61c>
   11768:	00492703          	lw	a4,4(s2)
   1176c:	fff64793          	not	a5,a2
   11770:	00e7f7b3          	and	a5,a5,a4
   11774:	00f92223          	sw	a5,4(s2)
   11778:	00161613          	slli	a2,a2,0x1
   1177c:	c2c7e2e3          	bltu	a5,a2,113a0 <_malloc_r+0x26c>
   11780:	c20600e3          	beqz	a2,113a0 <_malloc_r+0x26c>
   11784:	00f67733          	and	a4,a2,a5
   11788:	00071a63          	bnez	a4,1179c <_malloc_r+0x668>
   1178c:	00161613          	slli	a2,a2,0x1
   11790:	00f67733          	and	a4,a2,a5
   11794:	004e0e13          	addi	t3,t3,4
   11798:	fe070ae3          	beqz	a4,1178c <_malloc_r+0x658>
   1179c:	000e0593          	mv	a1,t3
   117a0:	b69ff06f          	j	11308 <_malloc_r+0x1d4>
   117a4:	00840593          	addi	a1,s0,8
   117a8:	00098513          	mv	a0,s3
   117ac:	e98ff0ef          	jal	10e44 <_free_r>
   117b0:	000c2583          	lw	a1,0(s8)
   117b4:	00892b83          	lw	s7,8(s2)
   117b8:	d2dff06f          	j	114e4 <_malloc_r+0x3b0>
   117bc:	010a8a93          	addi	s5,s5,16
   117c0:	c3dff06f          	j	113fc <_malloc_r+0x2c8>
   117c4:	4026d693          	srai	a3,a3,0x2
   117c8:	00100793          	li	a5,1
   117cc:	00d797b3          	sll	a5,a5,a3
   117d0:	00f56533          	or	a0,a0,a5
   117d4:	00a92223          	sw	a0,4(s2)
   117d8:	e55ff06f          	j	1162c <_malloc_r+0x4f8>
   117dc:	015b85b3          	add	a1,s7,s5
   117e0:	40b005b3          	neg	a1,a1
   117e4:	01459593          	slli	a1,a1,0x14
   117e8:	0145da13          	srli	s4,a1,0x14
   117ec:	000a0593          	mv	a1,s4
   117f0:	00098513          	mv	a0,s3
   117f4:	5a0000ef          	jal	11d94 <_sbrk_r>
   117f8:	fff00793          	li	a5,-1
   117fc:	c8f518e3          	bne	a0,a5,1148c <_malloc_r+0x358>
   11800:	00000a13          	li	s4,0
   11804:	c91ff06f          	j	11494 <_malloc_r+0x360>
   11808:	00812c03          	lw	s8,8(sp)
   1180c:	00100793          	li	a5,1
   11810:	00fba223          	sw	a5,4(s7)
   11814:	00098513          	mv	a0,s3
   11818:	128000ef          	jal	11940 <__malloc_unlock>
   1181c:	01812a03          	lw	s4,24(sp)
   11820:	01412a83          	lw	s5,20(sp)
   11824:	01012b03          	lw	s6,16(sp)
   11828:	00c12b83          	lw	s7,12(sp)
   1182c:	00412c83          	lw	s9,4(sp)
   11830:	b41ff06f          	j	11370 <_malloc_r+0x23c>
   11834:	05400693          	li	a3,84
   11838:	06e6ec63          	bltu	a3,a4,118b0 <_malloc_r+0x77c>
   1183c:	00c7d713          	srli	a4,a5,0xc
   11840:	06f70613          	addi	a2,a4,111
   11844:	00361613          	slli	a2,a2,0x3
   11848:	06e70693          	addi	a3,a4,110
   1184c:	db5ff06f          	j	11600 <_malloc_r+0x4cc>
   11850:	15400713          	li	a4,340
   11854:	06f76c63          	bltu	a4,a5,118cc <_malloc_r+0x798>
   11858:	00f4d793          	srli	a5,s1,0xf
   1185c:	07878593          	addi	a1,a5,120
   11860:	07778813          	addi	a6,a5,119
   11864:	00359613          	slli	a2,a1,0x3
   11868:	9a9ff06f          	j	11210 <_malloc_r+0xdc>
   1186c:	eb818c13          	addi	s8,gp,-328 # 137a8 <__malloc_current_mallinfo>
   11870:	000c2703          	lw	a4,0(s8)
   11874:	00ea8733          	add	a4,s5,a4
   11878:	00ec2023          	sw	a4,0(s8)
   1187c:	bb9ff06f          	j	11434 <_malloc_r+0x300>
   11880:	00892403          	lw	s0,8(s2)
   11884:	00442783          	lw	a5,4(s0)
   11888:	c9dff06f          	j	11524 <_malloc_r+0x3f0>
   1188c:	01451793          	slli	a5,a0,0x14
   11890:	ba0792e3          	bnez	a5,11434 <_malloc_r+0x300>
   11894:	00892b83          	lw	s7,8(s2)
   11898:	015b07b3          	add	a5,s6,s5
   1189c:	0017e793          	ori	a5,a5,1
   118a0:	00fba223          	sw	a5,4(s7)
   118a4:	c45ff06f          	j	114e8 <_malloc_r+0x3b4>
   118a8:	d571a023          	sw	s7,-704(gp) # 13630 <__malloc_sbrk_base>
   118ac:	ba1ff06f          	j	1144c <_malloc_r+0x318>
   118b0:	15400693          	li	a3,340
   118b4:	04e6e463          	bltu	a3,a4,118fc <_malloc_r+0x7c8>
   118b8:	00f7d713          	srli	a4,a5,0xf
   118bc:	07870613          	addi	a2,a4,120
   118c0:	00361613          	slli	a2,a2,0x3
   118c4:	07770693          	addi	a3,a4,119
   118c8:	d39ff06f          	j	11600 <_malloc_r+0x4cc>
   118cc:	55400713          	li	a4,1364
   118d0:	04f76463          	bltu	a4,a5,11918 <_malloc_r+0x7e4>
   118d4:	0124d793          	srli	a5,s1,0x12
   118d8:	07d78593          	addi	a1,a5,125
   118dc:	07c78813          	addi	a6,a5,124
   118e0:	00359613          	slli	a2,a1,0x3
   118e4:	92dff06f          	j	11210 <_malloc_r+0xdc>
   118e8:	ff8c8c93          	addi	s9,s9,-8
   118ec:	019a8ab3          	add	s5,s5,s9
   118f0:	417a8ab3          	sub	s5,s5,s7
   118f4:	00000a13          	li	s4,0
   118f8:	b9dff06f          	j	11494 <_malloc_r+0x360>
   118fc:	55400693          	li	a3,1364
   11900:	02e6e463          	bltu	a3,a4,11928 <_malloc_r+0x7f4>
   11904:	0127d713          	srli	a4,a5,0x12
   11908:	07d70613          	addi	a2,a4,125
   1190c:	00361613          	slli	a2,a2,0x3
   11910:	07c70693          	addi	a3,a4,124
   11914:	cedff06f          	j	11600 <_malloc_r+0x4cc>
   11918:	3f800613          	li	a2,1016
   1191c:	07f00593          	li	a1,127
   11920:	07e00813          	li	a6,126
   11924:	8edff06f          	j	11210 <_malloc_r+0xdc>
   11928:	3f800613          	li	a2,1016
   1192c:	07e00693          	li	a3,126
   11930:	cd1ff06f          	j	11600 <_malloc_r+0x4cc>
   11934:	00492783          	lw	a5,4(s2)
   11938:	e41ff06f          	j	11778 <_malloc_r+0x644>

0001193c <__malloc_lock>:
   1193c:	00008067          	ret

00011940 <__malloc_unlock>:
   11940:	00008067          	ret

00011944 <_fclose_r>:
   11944:	ff010113          	addi	sp,sp,-16
   11948:	00112623          	sw	ra,12(sp)
   1194c:	01212023          	sw	s2,0(sp)
   11950:	02058863          	beqz	a1,11980 <_fclose_r+0x3c>
   11954:	00812423          	sw	s0,8(sp)
   11958:	00912223          	sw	s1,4(sp)
   1195c:	00058413          	mv	s0,a1
   11960:	00050493          	mv	s1,a0
   11964:	00050663          	beqz	a0,11970 <_fclose_r+0x2c>
   11968:	03452783          	lw	a5,52(a0)
   1196c:	0c078c63          	beqz	a5,11a44 <_fclose_r+0x100>
   11970:	00c41783          	lh	a5,12(s0)
   11974:	02079263          	bnez	a5,11998 <_fclose_r+0x54>
   11978:	00812403          	lw	s0,8(sp)
   1197c:	00412483          	lw	s1,4(sp)
   11980:	00c12083          	lw	ra,12(sp)
   11984:	00000913          	li	s2,0
   11988:	00090513          	mv	a0,s2
   1198c:	00012903          	lw	s2,0(sp)
   11990:	01010113          	addi	sp,sp,16
   11994:	00008067          	ret
   11998:	00040593          	mv	a1,s0
   1199c:	00048513          	mv	a0,s1
   119a0:	0b8000ef          	jal	11a58 <__sflush_r>
   119a4:	02c42783          	lw	a5,44(s0)
   119a8:	00050913          	mv	s2,a0
   119ac:	00078a63          	beqz	a5,119c0 <_fclose_r+0x7c>
   119b0:	01c42583          	lw	a1,28(s0)
   119b4:	00048513          	mv	a0,s1
   119b8:	000780e7          	jalr	a5
   119bc:	06054463          	bltz	a0,11a24 <_fclose_r+0xe0>
   119c0:	00c45783          	lhu	a5,12(s0)
   119c4:	0807f793          	andi	a5,a5,128
   119c8:	06079663          	bnez	a5,11a34 <_fclose_r+0xf0>
   119cc:	03042583          	lw	a1,48(s0)
   119d0:	00058c63          	beqz	a1,119e8 <_fclose_r+0xa4>
   119d4:	04040793          	addi	a5,s0,64
   119d8:	00f58663          	beq	a1,a5,119e4 <_fclose_r+0xa0>
   119dc:	00048513          	mv	a0,s1
   119e0:	c64ff0ef          	jal	10e44 <_free_r>
   119e4:	02042823          	sw	zero,48(s0)
   119e8:	04442583          	lw	a1,68(s0)
   119ec:	00058863          	beqz	a1,119fc <_fclose_r+0xb8>
   119f0:	00048513          	mv	a0,s1
   119f4:	c50ff0ef          	jal	10e44 <_free_r>
   119f8:	04042223          	sw	zero,68(s0)
   119fc:	b95fe0ef          	jal	10590 <__sfp_lock_acquire>
   11a00:	00041623          	sh	zero,12(s0)
   11a04:	b91fe0ef          	jal	10594 <__sfp_lock_release>
   11a08:	00c12083          	lw	ra,12(sp)
   11a0c:	00812403          	lw	s0,8(sp)
   11a10:	00412483          	lw	s1,4(sp)
   11a14:	00090513          	mv	a0,s2
   11a18:	00012903          	lw	s2,0(sp)
   11a1c:	01010113          	addi	sp,sp,16
   11a20:	00008067          	ret
   11a24:	00c45783          	lhu	a5,12(s0)
   11a28:	fff00913          	li	s2,-1
   11a2c:	0807f793          	andi	a5,a5,128
   11a30:	f8078ee3          	beqz	a5,119cc <_fclose_r+0x88>
   11a34:	01042583          	lw	a1,16(s0)
   11a38:	00048513          	mv	a0,s1
   11a3c:	c08ff0ef          	jal	10e44 <_free_r>
   11a40:	f8dff06f          	j	119cc <_fclose_r+0x88>
   11a44:	b29fe0ef          	jal	1056c <__sinit>
   11a48:	f29ff06f          	j	11970 <_fclose_r+0x2c>

00011a4c <fclose>:
   11a4c:	00050593          	mv	a1,a0
   11a50:	d3c1a503          	lw	a0,-708(gp) # 1362c <_impure_ptr>
   11a54:	ef1ff06f          	j	11944 <_fclose_r>

00011a58 <__sflush_r>:
   11a58:	00c59703          	lh	a4,12(a1)
   11a5c:	fe010113          	addi	sp,sp,-32
   11a60:	00812c23          	sw	s0,24(sp)
   11a64:	01312623          	sw	s3,12(sp)
   11a68:	00112e23          	sw	ra,28(sp)
   11a6c:	00877793          	andi	a5,a4,8
   11a70:	00058413          	mv	s0,a1
   11a74:	00050993          	mv	s3,a0
   11a78:	12079063          	bnez	a5,11b98 <__sflush_r+0x140>
   11a7c:	000017b7          	lui	a5,0x1
   11a80:	80078793          	addi	a5,a5,-2048 # 800 <exit-0xf8b4>
   11a84:	0045a683          	lw	a3,4(a1)
   11a88:	00f767b3          	or	a5,a4,a5
   11a8c:	00f59623          	sh	a5,12(a1)
   11a90:	18d05a63          	blez	a3,11c24 <__sflush_r+0x1cc>
   11a94:	02842803          	lw	a6,40(s0)
   11a98:	0e080463          	beqz	a6,11b80 <__sflush_r+0x128>
   11a9c:	00912a23          	sw	s1,20(sp)
   11aa0:	01371693          	slli	a3,a4,0x13
   11aa4:	0009a483          	lw	s1,0(s3)
   11aa8:	0009a023          	sw	zero,0(s3)
   11aac:	1806c863          	bltz	a3,11c3c <__sflush_r+0x1e4>
   11ab0:	01c42583          	lw	a1,28(s0)
   11ab4:	00000613          	li	a2,0
   11ab8:	00100693          	li	a3,1
   11abc:	00098513          	mv	a0,s3
   11ac0:	000800e7          	jalr	a6
   11ac4:	fff00793          	li	a5,-1
   11ac8:	00050613          	mv	a2,a0
   11acc:	1af50a63          	beq	a0,a5,11c80 <__sflush_r+0x228>
   11ad0:	00c41783          	lh	a5,12(s0)
   11ad4:	02842803          	lw	a6,40(s0)
   11ad8:	0047f793          	andi	a5,a5,4
   11adc:	00078e63          	beqz	a5,11af8 <__sflush_r+0xa0>
   11ae0:	00442703          	lw	a4,4(s0)
   11ae4:	03042783          	lw	a5,48(s0)
   11ae8:	40e60633          	sub	a2,a2,a4
   11aec:	00078663          	beqz	a5,11af8 <__sflush_r+0xa0>
   11af0:	03c42783          	lw	a5,60(s0)
   11af4:	40f60633          	sub	a2,a2,a5
   11af8:	01c42583          	lw	a1,28(s0)
   11afc:	00000693          	li	a3,0
   11b00:	00098513          	mv	a0,s3
   11b04:	000800e7          	jalr	a6
   11b08:	fff00713          	li	a4,-1
   11b0c:	00c41783          	lh	a5,12(s0)
   11b10:	12e51a63          	bne	a0,a4,11c44 <__sflush_r+0x1ec>
   11b14:	0009a683          	lw	a3,0(s3)
   11b18:	01d00713          	li	a4,29
   11b1c:	18d76063          	bltu	a4,a3,11c9c <__sflush_r+0x244>
   11b20:	20400737          	lui	a4,0x20400
   11b24:	00170713          	addi	a4,a4,1 # 20400001 <__BSS_END__+0x203ec6a1>
   11b28:	00d75733          	srl	a4,a4,a3
   11b2c:	00177713          	andi	a4,a4,1
   11b30:	16070663          	beqz	a4,11c9c <__sflush_r+0x244>
   11b34:	01042603          	lw	a2,16(s0)
   11b38:	fffff737          	lui	a4,0xfffff
   11b3c:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffebe9f>
   11b40:	00e7f733          	and	a4,a5,a4
   11b44:	00e41623          	sh	a4,12(s0)
   11b48:	00042223          	sw	zero,4(s0)
   11b4c:	00c42023          	sw	a2,0(s0)
   11b50:	01379713          	slli	a4,a5,0x13
   11b54:	00075463          	bgez	a4,11b5c <__sflush_r+0x104>
   11b58:	10068863          	beqz	a3,11c68 <__sflush_r+0x210>
   11b5c:	03042583          	lw	a1,48(s0)
   11b60:	0099a023          	sw	s1,0(s3)
   11b64:	10058a63          	beqz	a1,11c78 <__sflush_r+0x220>
   11b68:	04040793          	addi	a5,s0,64
   11b6c:	00f58663          	beq	a1,a5,11b78 <__sflush_r+0x120>
   11b70:	00098513          	mv	a0,s3
   11b74:	ad0ff0ef          	jal	10e44 <_free_r>
   11b78:	01412483          	lw	s1,20(sp)
   11b7c:	02042823          	sw	zero,48(s0)
   11b80:	01c12083          	lw	ra,28(sp)
   11b84:	01812403          	lw	s0,24(sp)
   11b88:	00c12983          	lw	s3,12(sp)
   11b8c:	00000513          	li	a0,0
   11b90:	02010113          	addi	sp,sp,32
   11b94:	00008067          	ret
   11b98:	01212823          	sw	s2,16(sp)
   11b9c:	0105a903          	lw	s2,16(a1)
   11ba0:	08090a63          	beqz	s2,11c34 <__sflush_r+0x1dc>
   11ba4:	00912a23          	sw	s1,20(sp)
   11ba8:	0005a483          	lw	s1,0(a1)
   11bac:	00377713          	andi	a4,a4,3
   11bb0:	0125a023          	sw	s2,0(a1)
   11bb4:	412484b3          	sub	s1,s1,s2
   11bb8:	00000793          	li	a5,0
   11bbc:	00071463          	bnez	a4,11bc4 <__sflush_r+0x16c>
   11bc0:	0145a783          	lw	a5,20(a1)
   11bc4:	00f42423          	sw	a5,8(s0)
   11bc8:	00904863          	bgtz	s1,11bd8 <__sflush_r+0x180>
   11bcc:	0640006f          	j	11c30 <__sflush_r+0x1d8>
   11bd0:	00a90933          	add	s2,s2,a0
   11bd4:	04905e63          	blez	s1,11c30 <__sflush_r+0x1d8>
   11bd8:	02442783          	lw	a5,36(s0)
   11bdc:	01c42583          	lw	a1,28(s0)
   11be0:	00048693          	mv	a3,s1
   11be4:	00090613          	mv	a2,s2
   11be8:	00098513          	mv	a0,s3
   11bec:	000780e7          	jalr	a5
   11bf0:	40a484b3          	sub	s1,s1,a0
   11bf4:	fca04ee3          	bgtz	a0,11bd0 <__sflush_r+0x178>
   11bf8:	00c41783          	lh	a5,12(s0)
   11bfc:	01012903          	lw	s2,16(sp)
   11c00:	0407e793          	ori	a5,a5,64
   11c04:	01c12083          	lw	ra,28(sp)
   11c08:	00f41623          	sh	a5,12(s0)
   11c0c:	01812403          	lw	s0,24(sp)
   11c10:	01412483          	lw	s1,20(sp)
   11c14:	00c12983          	lw	s3,12(sp)
   11c18:	fff00513          	li	a0,-1
   11c1c:	02010113          	addi	sp,sp,32
   11c20:	00008067          	ret
   11c24:	03c5a683          	lw	a3,60(a1)
   11c28:	e6d046e3          	bgtz	a3,11a94 <__sflush_r+0x3c>
   11c2c:	f55ff06f          	j	11b80 <__sflush_r+0x128>
   11c30:	01412483          	lw	s1,20(sp)
   11c34:	01012903          	lw	s2,16(sp)
   11c38:	f49ff06f          	j	11b80 <__sflush_r+0x128>
   11c3c:	05042603          	lw	a2,80(s0)
   11c40:	e99ff06f          	j	11ad8 <__sflush_r+0x80>
   11c44:	01042683          	lw	a3,16(s0)
   11c48:	fffff737          	lui	a4,0xfffff
   11c4c:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__BSS_END__+0xfffebe9f>
   11c50:	00e7f733          	and	a4,a5,a4
   11c54:	00e41623          	sh	a4,12(s0)
   11c58:	00042223          	sw	zero,4(s0)
   11c5c:	00d42023          	sw	a3,0(s0)
   11c60:	01379713          	slli	a4,a5,0x13
   11c64:	ee075ce3          	bgez	a4,11b5c <__sflush_r+0x104>
   11c68:	03042583          	lw	a1,48(s0)
   11c6c:	04a42823          	sw	a0,80(s0)
   11c70:	0099a023          	sw	s1,0(s3)
   11c74:	ee059ae3          	bnez	a1,11b68 <__sflush_r+0x110>
   11c78:	01412483          	lw	s1,20(sp)
   11c7c:	f05ff06f          	j	11b80 <__sflush_r+0x128>
   11c80:	0009a783          	lw	a5,0(s3)
   11c84:	e40786e3          	beqz	a5,11ad0 <__sflush_r+0x78>
   11c88:	01d00713          	li	a4,29
   11c8c:	00e78c63          	beq	a5,a4,11ca4 <__sflush_r+0x24c>
   11c90:	01600713          	li	a4,22
   11c94:	00e78863          	beq	a5,a4,11ca4 <__sflush_r+0x24c>
   11c98:	00c41783          	lh	a5,12(s0)
   11c9c:	0407e793          	ori	a5,a5,64
   11ca0:	f65ff06f          	j	11c04 <__sflush_r+0x1ac>
   11ca4:	0099a023          	sw	s1,0(s3)
   11ca8:	01412483          	lw	s1,20(sp)
   11cac:	ed5ff06f          	j	11b80 <__sflush_r+0x128>

00011cb0 <_fflush_r>:
   11cb0:	fe010113          	addi	sp,sp,-32
   11cb4:	00812c23          	sw	s0,24(sp)
   11cb8:	00112e23          	sw	ra,28(sp)
   11cbc:	00050413          	mv	s0,a0
   11cc0:	00050663          	beqz	a0,11ccc <_fflush_r+0x1c>
   11cc4:	03452783          	lw	a5,52(a0)
   11cc8:	02078a63          	beqz	a5,11cfc <_fflush_r+0x4c>
   11ccc:	00c59783          	lh	a5,12(a1)
   11cd0:	00079c63          	bnez	a5,11ce8 <_fflush_r+0x38>
   11cd4:	01c12083          	lw	ra,28(sp)
   11cd8:	01812403          	lw	s0,24(sp)
   11cdc:	00000513          	li	a0,0
   11ce0:	02010113          	addi	sp,sp,32
   11ce4:	00008067          	ret
   11ce8:	00040513          	mv	a0,s0
   11cec:	01812403          	lw	s0,24(sp)
   11cf0:	01c12083          	lw	ra,28(sp)
   11cf4:	02010113          	addi	sp,sp,32
   11cf8:	d61ff06f          	j	11a58 <__sflush_r>
   11cfc:	00b12623          	sw	a1,12(sp)
   11d00:	86dfe0ef          	jal	1056c <__sinit>
   11d04:	00c12583          	lw	a1,12(sp)
   11d08:	fc5ff06f          	j	11ccc <_fflush_r+0x1c>

00011d0c <fflush>:
   11d0c:	06050063          	beqz	a0,11d6c <fflush+0x60>
   11d10:	00050593          	mv	a1,a0
   11d14:	d3c1a503          	lw	a0,-708(gp) # 1362c <_impure_ptr>
   11d18:	00050663          	beqz	a0,11d24 <fflush+0x18>
   11d1c:	03452783          	lw	a5,52(a0)
   11d20:	00078c63          	beqz	a5,11d38 <fflush+0x2c>
   11d24:	00c59783          	lh	a5,12(a1)
   11d28:	00079663          	bnez	a5,11d34 <fflush+0x28>
   11d2c:	00000513          	li	a0,0
   11d30:	00008067          	ret
   11d34:	d25ff06f          	j	11a58 <__sflush_r>
   11d38:	fe010113          	addi	sp,sp,-32
   11d3c:	00b12623          	sw	a1,12(sp)
   11d40:	00a12423          	sw	a0,8(sp)
   11d44:	00112e23          	sw	ra,28(sp)
   11d48:	825fe0ef          	jal	1056c <__sinit>
   11d4c:	00c12583          	lw	a1,12(sp)
   11d50:	00812503          	lw	a0,8(sp)
   11d54:	00c59783          	lh	a5,12(a1)
   11d58:	02079863          	bnez	a5,11d88 <fflush+0x7c>
   11d5c:	01c12083          	lw	ra,28(sp)
   11d60:	00000513          	li	a0,0
   11d64:	02010113          	addi	sp,sp,32
   11d68:	00008067          	ret
   11d6c:	00013637          	lui	a2,0x13
   11d70:	000125b7          	lui	a1,0x12
   11d74:	00013537          	lui	a0,0x13
   11d78:	0f060613          	addi	a2,a2,240 # 130f0 <__sglue>
   11d7c:	cb058593          	addi	a1,a1,-848 # 11cb0 <_fflush_r>
   11d80:	10050513          	addi	a0,a0,256 # 13100 <_impure_data>
   11d84:	845fe06f          	j	105c8 <_fwalk_sglue>
   11d88:	01c12083          	lw	ra,28(sp)
   11d8c:	02010113          	addi	sp,sp,32
   11d90:	cc9ff06f          	j	11a58 <__sflush_r>

00011d94 <_sbrk_r>:
   11d94:	ff010113          	addi	sp,sp,-16
   11d98:	00812423          	sw	s0,8(sp)
   11d9c:	00912223          	sw	s1,4(sp)
   11da0:	00050413          	mv	s0,a0
   11da4:	00058513          	mv	a0,a1
   11da8:	00112623          	sw	ra,12(sp)
   11dac:	d401a623          	sw	zero,-692(gp) # 1363c <errno>
   11db0:	230000ef          	jal	11fe0 <_sbrk>
   11db4:	fff00793          	li	a5,-1
   11db8:	00f50c63          	beq	a0,a5,11dd0 <_sbrk_r+0x3c>
   11dbc:	00c12083          	lw	ra,12(sp)
   11dc0:	00812403          	lw	s0,8(sp)
   11dc4:	00412483          	lw	s1,4(sp)
   11dc8:	01010113          	addi	sp,sp,16
   11dcc:	00008067          	ret
   11dd0:	d4c1a783          	lw	a5,-692(gp) # 1363c <errno>
   11dd4:	fe0784e3          	beqz	a5,11dbc <_sbrk_r+0x28>
   11dd8:	00c12083          	lw	ra,12(sp)
   11ddc:	00f42023          	sw	a5,0(s0)
   11de0:	00812403          	lw	s0,8(sp)
   11de4:	00412483          	lw	s1,4(sp)
   11de8:	01010113          	addi	sp,sp,16
   11dec:	00008067          	ret

00011df0 <__libc_fini_array>:
   11df0:	ff010113          	addi	sp,sp,-16
   11df4:	00812423          	sw	s0,8(sp)
   11df8:	000137b7          	lui	a5,0x13
   11dfc:	00013437          	lui	s0,0x13
   11e00:	0f040413          	addi	s0,s0,240 # 130f0 <__sglue>
   11e04:	0ec78793          	addi	a5,a5,236 # 130ec <__do_global_dtors_aux_fini_array_entry>
   11e08:	40f40433          	sub	s0,s0,a5
   11e0c:	00912223          	sw	s1,4(sp)
   11e10:	00112623          	sw	ra,12(sp)
   11e14:	40245493          	srai	s1,s0,0x2
   11e18:	02048063          	beqz	s1,11e38 <__libc_fini_array+0x48>
   11e1c:	ffc40413          	addi	s0,s0,-4
   11e20:	00f40433          	add	s0,s0,a5
   11e24:	00042783          	lw	a5,0(s0)
   11e28:	fff48493          	addi	s1,s1,-1
   11e2c:	ffc40413          	addi	s0,s0,-4
   11e30:	000780e7          	jalr	a5
   11e34:	fe0498e3          	bnez	s1,11e24 <__libc_fini_array+0x34>
   11e38:	00c12083          	lw	ra,12(sp)
   11e3c:	00812403          	lw	s0,8(sp)
   11e40:	00412483          	lw	s1,4(sp)
   11e44:	01010113          	addi	sp,sp,16
   11e48:	00008067          	ret

00011e4c <__register_exitproc>:
   11e4c:	d501a783          	lw	a5,-688(gp) # 13640 <__atexit>
   11e50:	04078c63          	beqz	a5,11ea8 <__register_exitproc+0x5c>
   11e54:	0047a703          	lw	a4,4(a5)
   11e58:	01f00813          	li	a6,31
   11e5c:	08e84063          	blt	a6,a4,11edc <__register_exitproc+0x90>
   11e60:	00271813          	slli	a6,a4,0x2
   11e64:	02050663          	beqz	a0,11e90 <__register_exitproc+0x44>
   11e68:	01078333          	add	t1,a5,a6
   11e6c:	08c32423          	sw	a2,136(t1)
   11e70:	1887a883          	lw	a7,392(a5)
   11e74:	00100613          	li	a2,1
   11e78:	00e61633          	sll	a2,a2,a4
   11e7c:	00c8e8b3          	or	a7,a7,a2
   11e80:	1917a423          	sw	a7,392(a5)
   11e84:	10d32423          	sw	a3,264(t1)
   11e88:	00200693          	li	a3,2
   11e8c:	02d50663          	beq	a0,a3,11eb8 <__register_exitproc+0x6c>
   11e90:	00170713          	addi	a4,a4,1
   11e94:	00e7a223          	sw	a4,4(a5)
   11e98:	010787b3          	add	a5,a5,a6
   11e9c:	00b7a423          	sw	a1,8(a5)
   11ea0:	00000513          	li	a0,0
   11ea4:	00008067          	ret
   11ea8:	ee018813          	addi	a6,gp,-288 # 137d0 <__atexit0>
   11eac:	d501a823          	sw	a6,-688(gp) # 13640 <__atexit>
   11eb0:	ee018793          	addi	a5,gp,-288 # 137d0 <__atexit0>
   11eb4:	fa1ff06f          	j	11e54 <__register_exitproc+0x8>
   11eb8:	18c7a683          	lw	a3,396(a5)
   11ebc:	00170713          	addi	a4,a4,1
   11ec0:	00e7a223          	sw	a4,4(a5)
   11ec4:	00c6e6b3          	or	a3,a3,a2
   11ec8:	18d7a623          	sw	a3,396(a5)
   11ecc:	010787b3          	add	a5,a5,a6
   11ed0:	00b7a423          	sw	a1,8(a5)
   11ed4:	00000513          	li	a0,0
   11ed8:	00008067          	ret
   11edc:	fff00513          	li	a0,-1
   11ee0:	00008067          	ret

00011ee4 <_close>:
   11ee4:	ff010113          	addi	sp,sp,-16
   11ee8:	00112623          	sw	ra,12(sp)
   11eec:	00812423          	sw	s0,8(sp)
   11ef0:	03900893          	li	a7,57
   11ef4:	00000073          	ecall
   11ef8:	00050413          	mv	s0,a0
   11efc:	00054c63          	bltz	a0,11f14 <_close+0x30>
   11f00:	00c12083          	lw	ra,12(sp)
   11f04:	00040513          	mv	a0,s0
   11f08:	00812403          	lw	s0,8(sp)
   11f0c:	01010113          	addi	sp,sp,16
   11f10:	00008067          	ret
   11f14:	40800433          	neg	s0,s0
   11f18:	184000ef          	jal	1209c <__errno>
   11f1c:	00852023          	sw	s0,0(a0)
   11f20:	fff00413          	li	s0,-1
   11f24:	fddff06f          	j	11f00 <_close+0x1c>

00011f28 <_exit>:
   11f28:	05d00893          	li	a7,93
   11f2c:	00000073          	ecall
   11f30:	00054463          	bltz	a0,11f38 <_exit+0x10>
   11f34:	0000006f          	j	11f34 <_exit+0xc>
   11f38:	ff010113          	addi	sp,sp,-16
   11f3c:	00812423          	sw	s0,8(sp)
   11f40:	00050413          	mv	s0,a0
   11f44:	00112623          	sw	ra,12(sp)
   11f48:	40800433          	neg	s0,s0
   11f4c:	150000ef          	jal	1209c <__errno>
   11f50:	00852023          	sw	s0,0(a0)
   11f54:	0000006f          	j	11f54 <_exit+0x2c>

00011f58 <_lseek>:
   11f58:	ff010113          	addi	sp,sp,-16
   11f5c:	00112623          	sw	ra,12(sp)
   11f60:	00812423          	sw	s0,8(sp)
   11f64:	03e00893          	li	a7,62
   11f68:	00000073          	ecall
   11f6c:	00050413          	mv	s0,a0
   11f70:	00054c63          	bltz	a0,11f88 <_lseek+0x30>
   11f74:	00c12083          	lw	ra,12(sp)
   11f78:	00040513          	mv	a0,s0
   11f7c:	00812403          	lw	s0,8(sp)
   11f80:	01010113          	addi	sp,sp,16
   11f84:	00008067          	ret
   11f88:	40800433          	neg	s0,s0
   11f8c:	110000ef          	jal	1209c <__errno>
   11f90:	00852023          	sw	s0,0(a0)
   11f94:	fff00413          	li	s0,-1
   11f98:	fddff06f          	j	11f74 <_lseek+0x1c>

00011f9c <_read>:
   11f9c:	ff010113          	addi	sp,sp,-16
   11fa0:	00112623          	sw	ra,12(sp)
   11fa4:	00812423          	sw	s0,8(sp)
   11fa8:	03f00893          	li	a7,63
   11fac:	00000073          	ecall
   11fb0:	00050413          	mv	s0,a0
   11fb4:	00054c63          	bltz	a0,11fcc <_read+0x30>
   11fb8:	00c12083          	lw	ra,12(sp)
   11fbc:	00040513          	mv	a0,s0
   11fc0:	00812403          	lw	s0,8(sp)
   11fc4:	01010113          	addi	sp,sp,16
   11fc8:	00008067          	ret
   11fcc:	40800433          	neg	s0,s0
   11fd0:	0cc000ef          	jal	1209c <__errno>
   11fd4:	00852023          	sw	s0,0(a0)
   11fd8:	fff00413          	li	s0,-1
   11fdc:	fddff06f          	j	11fb8 <_read+0x1c>

00011fe0 <_sbrk>:
   11fe0:	d601a703          	lw	a4,-672(gp) # 13650 <heap_end.0>
   11fe4:	ff010113          	addi	sp,sp,-16
   11fe8:	00112623          	sw	ra,12(sp)
   11fec:	00050793          	mv	a5,a0
   11ff0:	02071063          	bnez	a4,12010 <_sbrk+0x30>
   11ff4:	0d600893          	li	a7,214
   11ff8:	00000513          	li	a0,0
   11ffc:	00000073          	ecall
   12000:	fff00613          	li	a2,-1
   12004:	00050713          	mv	a4,a0
   12008:	02c50a63          	beq	a0,a2,1203c <_sbrk+0x5c>
   1200c:	d6a1a023          	sw	a0,-672(gp) # 13650 <heap_end.0>
   12010:	00e78533          	add	a0,a5,a4
   12014:	0d600893          	li	a7,214
   12018:	00000073          	ecall
   1201c:	d601a703          	lw	a4,-672(gp) # 13650 <heap_end.0>
   12020:	00e787b3          	add	a5,a5,a4
   12024:	00f51c63          	bne	a0,a5,1203c <_sbrk+0x5c>
   12028:	00c12083          	lw	ra,12(sp)
   1202c:	d6a1a023          	sw	a0,-672(gp) # 13650 <heap_end.0>
   12030:	00070513          	mv	a0,a4
   12034:	01010113          	addi	sp,sp,16
   12038:	00008067          	ret
   1203c:	060000ef          	jal	1209c <__errno>
   12040:	00c12083          	lw	ra,12(sp)
   12044:	00c00793          	li	a5,12
   12048:	00f52023          	sw	a5,0(a0)
   1204c:	fff00513          	li	a0,-1
   12050:	01010113          	addi	sp,sp,16
   12054:	00008067          	ret

00012058 <_write>:
   12058:	ff010113          	addi	sp,sp,-16
   1205c:	00112623          	sw	ra,12(sp)
   12060:	00812423          	sw	s0,8(sp)
   12064:	04000893          	li	a7,64
   12068:	00000073          	ecall
   1206c:	00050413          	mv	s0,a0
   12070:	00054c63          	bltz	a0,12088 <_write+0x30>
   12074:	00c12083          	lw	ra,12(sp)
   12078:	00040513          	mv	a0,s0
   1207c:	00812403          	lw	s0,8(sp)
   12080:	01010113          	addi	sp,sp,16
   12084:	00008067          	ret
   12088:	40800433          	neg	s0,s0
   1208c:	010000ef          	jal	1209c <__errno>
   12090:	00852023          	sw	s0,0(a0)
   12094:	fff00413          	li	s0,-1
   12098:	fddff06f          	j	12074 <_write+0x1c>

0001209c <__errno>:
   1209c:	d3c1a503          	lw	a0,-708(gp) # 1362c <_impure_ptr>
   120a0:	00008067          	ret
