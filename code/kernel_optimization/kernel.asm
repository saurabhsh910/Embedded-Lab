
kernel_optimization/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
<<<<<<< HEAD
    8038:	eb00005d 	bl	81b4 <kernel_main>
=======
    8038:	eb0000cd 	bl	8374 <kernel_main>
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
<<<<<<< HEAD
    8044:	0012d000 	andseq	sp, r2, r0
    8048:	0011c000 	andseq	ip, r1, r0
    804c:	0000b000 	andeq	fp, r0, r0
    8050:	0000c000 	andeq	ip, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb000206 	bl	8974 <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb0001fc 	bl	8974 <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb0001f2 	bl	8974 <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <kernel_main>:
    81b4:	e92d4800 	push	{fp, lr}
    81b8:	e28db004 	add	fp, sp, #4
    81bc:	e24dd010 	sub	sp, sp, #16
    81c0:	e3a03001 	mov	r3, #1
    81c4:	e50b300c 	str	r3, [fp, #-12]
    81c8:	eb000131 	bl	8694 <uart_init>
    81cc:	e3a03000 	mov	r3, #0
    81d0:	e50b3008 	str	r3, [fp, #-8]
    81d4:	ea00000c 	b	820c <kernel_main+0x58>
    81d8:	e30b37d0 	movw	r3, #47056	; 0xb7d0
    81dc:	e3403000 	movt	r3, #0
    81e0:	e51b2008 	ldr	r2, [fp, #-8]
    81e4:	e51b1008 	ldr	r1, [fp, #-8]
    81e8:	e7831102 	str	r1, [r3, r2, lsl #2]
    81ec:	e30b3000 	movw	r3, #45056	; 0xb000
    81f0:	e3403000 	movt	r3, #0
    81f4:	e51b2008 	ldr	r2, [fp, #-8]
    81f8:	e51b1008 	ldr	r1, [fp, #-8]
    81fc:	e7831102 	str	r1, [r3, r2, lsl #2]
    8200:	e51b3008 	ldr	r3, [fp, #-8]
    8204:	e2833001 	add	r3, r3, #1
    8208:	e50b3008 	str	r3, [fp, #-8]
    820c:	e51b3008 	ldr	r3, [fp, #-8]
    8210:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8214:	baffffef 	blt	81d8 <kernel_main+0x24>
    8218:	e3090000 	movw	r0, #36864	; 0x9000
    821c:	e3400000 	movt	r0, #0
    8220:	eb000087 	bl	8444 <printk>
    8224:	eb00019f 	bl	88a8 <tic>
    8228:	e30b07d0 	movw	r0, #47056	; 0xb7d0
    822c:	e3400000 	movt	r0, #0
    8230:	eb000244 	bl	8b48 <optimize_me>
    8234:	eb0001c0 	bl	893c <toc>
    8238:	e50b0010 	str	r0, [fp, #-16]
    823c:	e3090024 	movw	r0, #36900	; 0x9024
    8240:	e3400000 	movt	r0, #0
    8244:	e51b1010 	ldr	r1, [fp, #-16]
    8248:	eb00007d 	bl	8444 <printk>
    824c:	e3090028 	movw	r0, #36904	; 0x9028
    8250:	e3400000 	movt	r0, #0
    8254:	eb00007a 	bl	8444 <printk>
    8258:	eb000192 	bl	88a8 <tic>
    825c:	e30b0000 	movw	r0, #45056	; 0xb000
    8260:	e3400000 	movt	r0, #0
    8264:	eb0001e4 	bl	89fc <unoptimized>
    8268:	eb0001b3 	bl	893c <toc>
    826c:	e50b0010 	str	r0, [fp, #-16]
    8270:	e309004c 	movw	r0, #36940	; 0x904c
    8274:	e3400000 	movt	r0, #0
    8278:	e51b1010 	ldr	r1, [fp, #-16]
    827c:	eb000070 	bl	8444 <printk>
    8280:	e3a03000 	mov	r3, #0
    8284:	e50b3008 	str	r3, [fp, #-8]
    8288:	ea000012 	b	82d8 <kernel_main+0x124>
    828c:	e30b37d0 	movw	r3, #47056	; 0xb7d0
    8290:	e3403000 	movt	r3, #0
    8294:	e51b2008 	ldr	r2, [fp, #-8]
    8298:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    829c:	e30b3000 	movw	r3, #45056	; 0xb000
    82a0:	e3403000 	movt	r3, #0
    82a4:	e51b1008 	ldr	r1, [fp, #-8]
    82a8:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    82ac:	e1520003 	cmp	r2, r3
    82b0:	0a000005 	beq	82cc <kernel_main+0x118>
    82b4:	e3090054 	movw	r0, #36948	; 0x9054
    82b8:	e3400000 	movt	r0, #0
    82bc:	eb000060 	bl	8444 <printk>
    82c0:	e3a03000 	mov	r3, #0
    82c4:	e50b300c 	str	r3, [fp, #-12]
    82c8:	ea000005 	b	82e4 <kernel_main+0x130>
    82cc:	e51b3008 	ldr	r3, [fp, #-8]
    82d0:	e2833001 	add	r3, r3, #1
    82d4:	e50b3008 	str	r3, [fp, #-8]
    82d8:	e51b3008 	ldr	r3, [fp, #-8]
    82dc:	e3530f7d 	cmp	r3, #500	; 0x1f4
    82e0:	baffffe9 	blt	828c <kernel_main+0xd8>
    82e4:	e51b300c 	ldr	r3, [fp, #-12]
    82e8:	e3530000 	cmp	r3, #0
    82ec:	0a000002 	beq	82fc <kernel_main+0x148>
    82f0:	e3090070 	movw	r0, #36976	; 0x9070
    82f4:	e3400000 	movt	r0, #0
    82f8:	eb000051 	bl	8444 <printk>
    82fc:	e30806a0 	movw	r0, #34464	; 0x86a0
    8300:	e3400001 	movt	r0, #1
    8304:	eb00019a 	bl	8974 <delay_cycles>
    8308:	eafffffb 	b	82fc <kernel_main+0x148>

0000830c <printnumk>:
    830c:	e92d4810 	push	{r4, fp, lr}
    8310:	e28db008 	add	fp, sp, #8
    8314:	e24dd024 	sub	sp, sp, #36	; 0x24
    8318:	e1a01000 	mov	r1, r0
    831c:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    8320:	e1a03001 	mov	r3, r1
    8324:	e54b301d 	strb	r3, [fp, #-29]
    8328:	e3a03000 	mov	r3, #0
    832c:	e50b3010 	str	r3, [fp, #-16]
    8330:	e24b301c 	sub	r3, fp, #28
    8334:	e2833007 	add	r3, r3, #7
    8338:	e50b3014 	str	r3, [fp, #-20]
    833c:	e55b301d 	ldrb	r3, [fp, #-29]
    8340:	e3530008 	cmp	r3, #8
    8344:	1a000003 	bne	8358 <printnumk+0x4c>
    8348:	e309308c 	movw	r3, #37004	; 0x908c
    834c:	e3403000 	movt	r3, #0
    8350:	e50b3010 	str	r3, [fp, #-16]
    8354:	ea000005 	b	8370 <printnumk+0x64>
    8358:	e55b301d 	ldrb	r3, [fp, #-29]
    835c:	e3530010 	cmp	r3, #16
    8360:	1a000002 	bne	8370 <printnumk+0x64>
    8364:	e3093090 	movw	r3, #37008	; 0x9090
    8368:	e3403000 	movt	r3, #0
    836c:	e50b3010 	str	r3, [fp, #-16]
    8370:	e51b4014 	ldr	r4, [fp, #-20]
    8374:	e2443001 	sub	r3, r4, #1
    8378:	e50b3014 	str	r3, [fp, #-20]
    837c:	e55b201d 	ldrb	r2, [fp, #-29]
    8380:	e3a03000 	mov	r3, #0
    8384:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8388:	eb000218 	bl	8bf0 <__aeabi_uldivmod>
    838c:	e1a00002 	mov	r0, r2
    8390:	e1a01003 	mov	r1, r3
    8394:	e30a3000 	movw	r3, #40960	; 0xa000
    8398:	e3403000 	movt	r3, #0
    839c:	e0833000 	add	r3, r3, r0
    83a0:	e5d33000 	ldrb	r3, [r3]
    83a4:	e5c43000 	strb	r3, [r4]
    83a8:	e55b201d 	ldrb	r2, [fp, #-29]
    83ac:	e3a03000 	mov	r3, #0
    83b0:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    83b4:	eb00020d 	bl	8bf0 <__aeabi_uldivmod>
    83b8:	e1a02000 	mov	r2, r0
    83bc:	e1a03001 	mov	r3, r1
    83c0:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    83c4:	e14b22dc 	ldrd	r2, [fp, #-44]	; 0xffffffd4
    83c8:	e1923003 	orrs	r3, r2, r3
    83cc:	1affffe7 	bne	8370 <printnumk+0x64>
    83d0:	e51b3010 	ldr	r3, [fp, #-16]
    83d4:	e3530000 	cmp	r3, #0
    83d8:	0a00000a 	beq	8408 <printnumk+0xfc>
    83dc:	ea000005 	b	83f8 <printnumk+0xec>
    83e0:	e51b3010 	ldr	r3, [fp, #-16]
    83e4:	e2832001 	add	r2, r3, #1
    83e8:	e50b2010 	str	r2, [fp, #-16]
    83ec:	e5d33000 	ldrb	r3, [r3]
    83f0:	e1a00003 	mov	r0, r3
    83f4:	eb0000dd 	bl	8770 <uart_put_byte>
    83f8:	e51b3010 	ldr	r3, [fp, #-16]
    83fc:	e5d33000 	ldrb	r3, [r3]
    8400:	e3530000 	cmp	r3, #0
    8404:	1afffff5 	bne	83e0 <printnumk+0xd4>
    8408:	ea000003 	b	841c <printnumk+0x110>
    840c:	e51b3014 	ldr	r3, [fp, #-20]
    8410:	e5d33000 	ldrb	r3, [r3]
    8414:	e1a00003 	mov	r0, r3
    8418:	eb0000d4 	bl	8770 <uart_put_byte>
    841c:	e51b3014 	ldr	r3, [fp, #-20]
    8420:	e2833001 	add	r3, r3, #1
    8424:	e50b3014 	str	r3, [fp, #-20]
    8428:	e24b301c 	sub	r3, fp, #28
    842c:	e2833008 	add	r3, r3, #8
    8430:	e51b2014 	ldr	r2, [fp, #-20]
    8434:	e1520003 	cmp	r2, r3
    8438:	1afffff3 	bne	840c <printnumk+0x100>
    843c:	e24bd008 	sub	sp, fp, #8
    8440:	e8bd8810 	pop	{r4, fp, pc}

00008444 <printk>:
    8444:	e92d000f 	push	{r0, r1, r2, r3}
    8448:	e92d4800 	push	{fp, lr}
    844c:	e28db004 	add	fp, sp, #4
    8450:	e24dd020 	sub	sp, sp, #32
    8454:	e28b3008 	add	r3, fp, #8
    8458:	e50b3020 	str	r3, [fp, #-32]
    845c:	ea000082 	b	866c <printk+0x228>
    8460:	e59b3004 	ldr	r3, [fp, #4]
    8464:	e5d33000 	ldrb	r3, [r3]
    8468:	e3530025 	cmp	r3, #37	; 0x25
    846c:	0a000006 	beq	848c <printk+0x48>
    8470:	e59b3004 	ldr	r3, [fp, #4]
    8474:	e2832001 	add	r2, r3, #1
    8478:	e58b2004 	str	r2, [fp, #4]
    847c:	e5d33000 	ldrb	r3, [r3]
    8480:	e1a00003 	mov	r0, r3
    8484:	eb0000b9 	bl	8770 <uart_put_byte>
    8488:	ea000077 	b	866c <printk+0x228>
    848c:	e59b3004 	ldr	r3, [fp, #4]
    8490:	e2833001 	add	r3, r3, #1
    8494:	e58b3004 	str	r3, [fp, #4]
    8498:	e59b3004 	ldr	r3, [fp, #4]
    849c:	e5d33000 	ldrb	r3, [r3]
    84a0:	e353006f 	cmp	r3, #111	; 0x6f
    84a4:	0a000036 	beq	8584 <printk+0x140>
    84a8:	e353006f 	cmp	r3, #111	; 0x6f
    84ac:	ca000006 	bgt	84cc <printk+0x88>
    84b0:	e3530063 	cmp	r3, #99	; 0x63
    84b4:	0a00005a 	beq	8624 <printk+0x1e0>
    84b8:	e3530064 	cmp	r3, #100	; 0x64
    84bc:	0a00000e 	beq	84fc <printk+0xb8>
    84c0:	e3530025 	cmp	r3, #37	; 0x25
    84c4:	0a000060 	beq	864c <printk+0x208>
    84c8:	ea000062 	b	8658 <printk+0x214>
    84cc:	e3530073 	cmp	r3, #115	; 0x73
    84d0:	0a000041 	beq	85dc <printk+0x198>
    84d4:	e3530073 	cmp	r3, #115	; 0x73
    84d8:	ca000002 	bgt	84e8 <printk+0xa4>
    84dc:	e3530070 	cmp	r3, #112	; 0x70
    84e0:	0a000032 	beq	85b0 <printk+0x16c>
    84e4:	ea00005b 	b	8658 <printk+0x214>
    84e8:	e3530075 	cmp	r3, #117	; 0x75
    84ec:	0a000019 	beq	8558 <printk+0x114>
    84f0:	e3530078 	cmp	r3, #120	; 0x78
    84f4:	0a00002d 	beq	85b0 <printk+0x16c>
    84f8:	ea000056 	b	8658 <printk+0x214>
    84fc:	e51b3020 	ldr	r3, [fp, #-32]
    8500:	e2832004 	add	r2, r3, #4
    8504:	e50b2020 	str	r2, [fp, #-32]
    8508:	e5933000 	ldr	r3, [r3]
    850c:	e50b300c 	str	r3, [fp, #-12]
    8510:	e51b300c 	ldr	r3, [fp, #-12]
    8514:	e3530000 	cmp	r3, #0
    8518:	aa000008 	bge	8540 <printk+0xfc>
    851c:	e3a0002d 	mov	r0, #45	; 0x2d
    8520:	eb000092 	bl	8770 <uart_put_byte>
    8524:	e51b300c 	ldr	r3, [fp, #-12]
    8528:	e2633000 	rsb	r3, r3, #0
    852c:	e1a02003 	mov	r2, r3
    8530:	e1a03fc2 	asr	r3, r2, #31
    8534:	e3a0000a 	mov	r0, #10
    8538:	ebffff73 	bl	830c <printnumk>
    853c:	ea000047 	b	8660 <printk+0x21c>
    8540:	e51b300c 	ldr	r3, [fp, #-12]
    8544:	e1a02003 	mov	r2, r3
    8548:	e1a03fc2 	asr	r3, r2, #31
    854c:	e3a0000a 	mov	r0, #10
    8550:	ebffff6d 	bl	830c <printnumk>
    8554:	ea000041 	b	8660 <printk+0x21c>
    8558:	e51b3020 	ldr	r3, [fp, #-32]
    855c:	e2832004 	add	r2, r3, #4
    8560:	e50b2020 	str	r2, [fp, #-32]
    8564:	e5933000 	ldr	r3, [r3]
    8568:	e50b3010 	str	r3, [fp, #-16]
    856c:	e51b3010 	ldr	r3, [fp, #-16]
    8570:	e1a02003 	mov	r2, r3
    8574:	e3a03000 	mov	r3, #0
    8578:	e3a0000a 	mov	r0, #10
    857c:	ebffff62 	bl	830c <printnumk>
    8580:	ea000036 	b	8660 <printk+0x21c>
    8584:	e51b3020 	ldr	r3, [fp, #-32]
    8588:	e2832004 	add	r2, r3, #4
    858c:	e50b2020 	str	r2, [fp, #-32]
    8590:	e5933000 	ldr	r3, [r3]
    8594:	e50b3014 	str	r3, [fp, #-20]
    8598:	e51b3014 	ldr	r3, [fp, #-20]
    859c:	e1a02003 	mov	r2, r3
    85a0:	e3a03000 	mov	r3, #0
    85a4:	e3a00008 	mov	r0, #8
    85a8:	ebffff57 	bl	830c <printnumk>
    85ac:	ea00002b 	b	8660 <printk+0x21c>
    85b0:	e51b3020 	ldr	r3, [fp, #-32]
    85b4:	e2832004 	add	r2, r3, #4
    85b8:	e50b2020 	str	r2, [fp, #-32]
    85bc:	e5933000 	ldr	r3, [r3]
    85c0:	e50b3018 	str	r3, [fp, #-24]
    85c4:	e51b3018 	ldr	r3, [fp, #-24]
    85c8:	e1a02003 	mov	r2, r3
    85cc:	e3a03000 	mov	r3, #0
    85d0:	e3a00010 	mov	r0, #16
    85d4:	ebffff4c 	bl	830c <printnumk>
    85d8:	ea000020 	b	8660 <printk+0x21c>
    85dc:	e51b3020 	ldr	r3, [fp, #-32]
    85e0:	e2832004 	add	r2, r3, #4
    85e4:	e50b2020 	str	r2, [fp, #-32]
    85e8:	e5933000 	ldr	r3, [r3]
    85ec:	e50b3008 	str	r3, [fp, #-8]
    85f0:	ea000006 	b	8610 <printk+0x1cc>
    85f4:	e51b3008 	ldr	r3, [fp, #-8]
    85f8:	e5d33000 	ldrb	r3, [r3]
    85fc:	e1a00003 	mov	r0, r3
    8600:	eb00005a 	bl	8770 <uart_put_byte>
    8604:	e51b3008 	ldr	r3, [fp, #-8]
    8608:	e2833001 	add	r3, r3, #1
    860c:	e50b3008 	str	r3, [fp, #-8]
    8610:	e51b3008 	ldr	r3, [fp, #-8]
    8614:	e5d33000 	ldrb	r3, [r3]
    8618:	e3530000 	cmp	r3, #0
    861c:	1afffff4 	bne	85f4 <printk+0x1b0>
    8620:	ea00000e 	b	8660 <printk+0x21c>
    8624:	e51b3020 	ldr	r3, [fp, #-32]
    8628:	e2832004 	add	r2, r3, #4
    862c:	e50b2020 	str	r2, [fp, #-32]
    8630:	e5933000 	ldr	r3, [r3]
    8634:	e50b301c 	str	r3, [fp, #-28]
    8638:	e51b301c 	ldr	r3, [fp, #-28]
    863c:	e6ef3073 	uxtb	r3, r3
    8640:	e1a00003 	mov	r0, r3
    8644:	eb000049 	bl	8770 <uart_put_byte>
    8648:	ea000004 	b	8660 <printk+0x21c>
    864c:	e3a00025 	mov	r0, #37	; 0x25
    8650:	eb000046 	bl	8770 <uart_put_byte>
    8654:	ea000001 	b	8660 <printk+0x21c>
    8658:	e3e03000 	mvn	r3, #0
    865c:	ea000007 	b	8680 <printk+0x23c>
    8660:	e59b3004 	ldr	r3, [fp, #4]
    8664:	e2833001 	add	r3, r3, #1
    8668:	e58b3004 	str	r3, [fp, #4]
    866c:	e59b3004 	ldr	r3, [fp, #4]
    8670:	e5d33000 	ldrb	r3, [r3]
    8674:	e3530000 	cmp	r3, #0
    8678:	1affff78 	bne	8460 <printk+0x1c>
    867c:	e3a03000 	mov	r3, #0
    8680:	e1a00003 	mov	r0, r3
    8684:	e24bd004 	sub	sp, fp, #4
    8688:	e8bd4800 	pop	{fp, lr}
    868c:	e28dd010 	add	sp, sp, #16
    8690:	e12fff1e 	bx	lr

00008694 <uart_init>:
    8694:	e92d4800 	push	{fp, lr}
    8698:	e28db004 	add	fp, sp, #4
    869c:	e3a0000f 	mov	r0, #15
    86a0:	e3a01000 	mov	r1, #0
    86a4:	ebfffea1 	bl	8130 <gpio_set_pull>
    86a8:	e3a0000e 	mov	r0, #14
    86ac:	e3a01000 	mov	r1, #0
    86b0:	ebfffe9e 	bl	8130 <gpio_set_pull>
    86b4:	e3a0000f 	mov	r0, #15
    86b8:	e3a01002 	mov	r1, #2
    86bc:	ebfffe64 	bl	8054 <gpio_config>
    86c0:	e3a0000e 	mov	r0, #14
    86c4:	e3a01002 	mov	r1, #2
    86c8:	ebfffe61 	bl	8054 <gpio_config>
    86cc:	e30a3018 	movw	r3, #40984	; 0xa018
    86d0:	e3403000 	movt	r3, #0
    86d4:	e5933000 	ldr	r3, [r3]
    86d8:	e3a02001 	mov	r2, #1
    86dc:	e5832000 	str	r2, [r3]
    86e0:	e30a3014 	movw	r3, #40980	; 0xa014
    86e4:	e3403000 	movt	r3, #0
    86e8:	e5933000 	ldr	r3, [r3]
    86ec:	e300210e 	movw	r2, #270	; 0x10e
    86f0:	e5832000 	str	r2, [r3]
    86f4:	e30a301c 	movw	r3, #40988	; 0xa01c
    86f8:	e3403000 	movt	r3, #0
    86fc:	e5933000 	ldr	r3, [r3]
    8700:	e3a02000 	mov	r2, #0
    8704:	e5832000 	str	r2, [r3]
    8708:	e30a3020 	movw	r3, #40992	; 0xa020
    870c:	e3403000 	movt	r3, #0
    8710:	e5933000 	ldr	r3, [r3]
    8714:	e3a020c6 	mov	r2, #198	; 0xc6
    8718:	e5832000 	str	r2, [r3]
    871c:	e30a3024 	movw	r3, #40996	; 0xa024
    8720:	e3403000 	movt	r3, #0
    8724:	e5933000 	ldr	r3, [r3]
    8728:	e3a02003 	mov	r2, #3
    872c:	e5832000 	str	r2, [r3]
    8730:	e30a302c 	movw	r3, #41004	; 0xa02c
    8734:	e3403000 	movt	r3, #0
    8738:	e5933000 	ldr	r3, [r3]
    873c:	e3a02003 	mov	r2, #3
    8740:	e5832000 	str	r2, [r3]
    8744:	e8bd8800 	pop	{fp, pc}

00008748 <uart_close>:
    8748:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    874c:	e28db000 	add	fp, sp, #0
    8750:	e30a3018 	movw	r3, #40984	; 0xa018
    8754:	e3403000 	movt	r3, #0
    8758:	e5933000 	ldr	r3, [r3]
    875c:	e3a02000 	mov	r2, #0
    8760:	e5832000 	str	r2, [r3]
    8764:	e24bd000 	sub	sp, fp, #0
    8768:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    876c:	e12fff1e 	bx	lr

00008770 <uart_put_byte>:
    8770:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8774:	e28db000 	add	fp, sp, #0
    8778:	e24dd00c 	sub	sp, sp, #12
    877c:	e1a03000 	mov	r3, r0
    8780:	e54b3005 	strb	r3, [fp, #-5]
    8784:	e30a3030 	movw	r3, #41008	; 0xa030
    8788:	e3403000 	movt	r3, #0
    878c:	e5933000 	ldr	r3, [r3]
    8790:	e5933000 	ldr	r3, [r3]
    8794:	e2033040 	and	r3, r3, #64	; 0x40
    8798:	e3530000 	cmp	r3, #0
    879c:	0a000000 	beq	87a4 <uart_put_byte+0x34>
    87a0:	ea000000 	b	87a8 <uart_put_byte+0x38>
    87a4:	eafffff6 	b	8784 <uart_put_byte+0x14>
    87a8:	e30a3028 	movw	r3, #41000	; 0xa028
    87ac:	e3403000 	movt	r3, #0
    87b0:	e5933000 	ldr	r3, [r3]
    87b4:	e55b2005 	ldrb	r2, [fp, #-5]
    87b8:	e5832000 	str	r2, [r3]
    87bc:	e24bd000 	sub	sp, fp, #0
    87c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    87c4:	e12fff1e 	bx	lr

000087c8 <uart_get_byte>:
    87c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    87cc:	e28db000 	add	fp, sp, #0
    87d0:	e24dd00c 	sub	sp, sp, #12
    87d4:	e30a3030 	movw	r3, #41008	; 0xa030
    87d8:	e3403000 	movt	r3, #0
    87dc:	e5933000 	ldr	r3, [r3]
    87e0:	e5933000 	ldr	r3, [r3]
    87e4:	e2033001 	and	r3, r3, #1
    87e8:	e3530000 	cmp	r3, #0
    87ec:	0a000000 	beq	87f4 <uart_get_byte+0x2c>
    87f0:	ea000000 	b	87f8 <uart_get_byte+0x30>
    87f4:	eafffff6 	b	87d4 <uart_get_byte+0xc>
    87f8:	e30a3028 	movw	r3, #41000	; 0xa028
    87fc:	e3403000 	movt	r3, #0
    8800:	e5933000 	ldr	r3, [r3]
    8804:	e5933000 	ldr	r3, [r3]
    8808:	e54b3005 	strb	r3, [fp, #-5]
    880c:	e55b3005 	ldrb	r3, [fp, #-5]
    8810:	e1a00003 	mov	r0, r3
    8814:	e24bd000 	sub	sp, fp, #0
    8818:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    881c:	e12fff1e 	bx	lr

00008820 <timer_start>:
    8820:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8824:	e28db000 	add	fp, sp, #0
    8828:	e24dd00c 	sub	sp, sp, #12
    882c:	e50b0008 	str	r0, [fp, #-8]
    8830:	e1a00000 	nop			; (mov r0, r0)
    8834:	e24bd000 	sub	sp, fp, #0
    8838:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    883c:	e12fff1e 	bx	lr

00008840 <timer_stop>:
    8840:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8844:	e28db000 	add	fp, sp, #0
    8848:	e1a00000 	nop			; (mov r0, r0)
    884c:	e24bd000 	sub	sp, fp, #0
    8850:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8854:	e12fff1e 	bx	lr

00008858 <timer_read>:
    8858:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    885c:	e28db000 	add	fp, sp, #0
    8860:	e3a03000 	mov	r3, #0
    8864:	e1a00003 	mov	r0, r3
    8868:	e24bd000 	sub	sp, fp, #0
    886c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8870:	e12fff1e 	bx	lr

00008874 <timer_is_pending>:
    8874:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8878:	e28db000 	add	fp, sp, #0
    887c:	e3a03000 	mov	r3, #0
    8880:	e1a00003 	mov	r0, r3
    8884:	e24bd000 	sub	sp, fp, #0
    8888:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    888c:	e12fff1e 	bx	lr

00008890 <timer_clear_pending>:
    8890:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8894:	e28db000 	add	fp, sp, #0
    8898:	e1a00000 	nop			; (mov r0, r0)
    889c:	e24bd000 	sub	sp, fp, #0
    88a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88a4:	e12fff1e 	bx	lr

000088a8 <tic>:
    88a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88ac:	e28db000 	add	fp, sp, #0
    88b0:	e30a303c 	movw	r3, #41020	; 0xa03c
    88b4:	e3403000 	movt	r3, #0
    88b8:	e5933000 	ldr	r3, [r3]
    88bc:	e283301c 	add	r3, r3, #28
    88c0:	e3a02002 	mov	r2, #2
    88c4:	e5832000 	str	r2, [r3]
    88c8:	e30a3040 	movw	r3, #41024	; 0xa040
    88cc:	e3403000 	movt	r3, #0
    88d0:	e5933000 	ldr	r3, [r3]
    88d4:	e3a02000 	mov	r2, #0
    88d8:	e5832000 	str	r2, [r3]
    88dc:	e30a3034 	movw	r3, #41012	; 0xa034
    88e0:	e3403000 	movt	r3, #0
    88e4:	e5933000 	ldr	r3, [r3]
    88e8:	e3e02000 	mvn	r2, #0
    88ec:	e5832000 	str	r2, [r3]
    88f0:	e30a3044 	movw	r3, #41028	; 0xa044
    88f4:	e3403000 	movt	r3, #0
    88f8:	e5933000 	ldr	r3, [r3]
    88fc:	e3e02000 	mvn	r2, #0
    8900:	e5832000 	str	r2, [r3]
    8904:	e30a3048 	movw	r3, #41032	; 0xa048
    8908:	e3403000 	movt	r3, #0
    890c:	e5933000 	ldr	r3, [r3]
    8910:	e3a020f9 	mov	r2, #249	; 0xf9
    8914:	e5832000 	str	r2, [r3]
    8918:	e30a303c 	movw	r3, #41020	; 0xa03c
    891c:	e3403000 	movt	r3, #0
    8920:	e5933000 	ldr	r3, [r3]
    8924:	e3a02082 	mov	r2, #130	; 0x82
    8928:	e5832000 	str	r2, [r3]
    892c:	e1a00000 	nop			; (mov r0, r0)
    8930:	e24bd000 	sub	sp, fp, #0
    8934:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8938:	e12fff1e 	bx	lr

0000893c <toc>:
    893c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8940:	e28db000 	add	fp, sp, #0
    8944:	e24dd00c 	sub	sp, sp, #12
    8948:	e30a3038 	movw	r3, #41016	; 0xa038
    894c:	e3403000 	movt	r3, #0
    8950:	e5933000 	ldr	r3, [r3]
    8954:	e5933000 	ldr	r3, [r3]
    8958:	e1e03003 	mvn	r3, r3
    895c:	e50b3008 	str	r3, [fp, #-8]
    8960:	e51b3008 	ldr	r3, [fp, #-8]
=======
    8044:	0012e000 	andseq	lr, r2, r0
    8048:	0011d000 	andseq	sp, r1, r0
    804c:	0000c000 	andeq	ip, r0, r0
    8050:	0000d000 	andeq	sp, r0, r0

00008054 <gpio_config>:
    8054:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8058:	e28db000 	add	fp, sp, #0
    805c:	e24dd01c 	sub	sp, sp, #28
    8060:	e1a03000 	mov	r3, r0
    8064:	e1a02001 	mov	r2, r1
    8068:	e54b3015 	strb	r3, [fp, #-21]
    806c:	e1a03002 	mov	r3, r2
    8070:	e54b3016 	strb	r3, [fp, #-22]
    8074:	e55b3015 	ldrb	r3, [fp, #-21]
    8078:	e3530035 	cmp	r3, #53	; 0x35
    807c:	8a000002 	bhi	808c <gpio_config+0x38>
    8080:	e55b3016 	ldrb	r3, [fp, #-22]
    8084:	e3530007 	cmp	r3, #7
    8088:	9a000000 	bls	8090 <gpio_config+0x3c>
    808c:	ea000035 	b	8168 <gpio_config+0x114>
    8090:	e55b2015 	ldrb	r2, [fp, #-21]
    8094:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    8098:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    809c:	e0832392 	umull	r2, r3, r2, r3
    80a0:	e1a031a3 	lsr	r3, r3, #3
    80a4:	e6ef3073 	uxtb	r3, r3
    80a8:	e50b3008 	str	r3, [fp, #-8]
    80ac:	e30b3000 	movw	r3, #45056	; 0xb000
    80b0:	e3403000 	movt	r3, #0
    80b4:	e5932000 	ldr	r2, [r3]
    80b8:	e51b3008 	ldr	r3, [fp, #-8]
    80bc:	e1a03103 	lsl	r3, r3, #2
    80c0:	e0823003 	add	r3, r2, r3
    80c4:	e5933000 	ldr	r3, [r3]
    80c8:	e50b300c 	str	r3, [fp, #-12]
    80cc:	e55b1015 	ldrb	r1, [fp, #-21]
    80d0:	e30c3ccd 	movw	r3, #52429	; 0xcccd
    80d4:	e34c3ccc 	movt	r3, #52428	; 0xcccc
    80d8:	e0832391 	umull	r2, r3, r1, r3
    80dc:	e1a021a3 	lsr	r2, r3, #3
    80e0:	e1a03002 	mov	r3, r2
    80e4:	e1a03103 	lsl	r3, r3, #2
    80e8:	e0833002 	add	r3, r3, r2
    80ec:	e1a03083 	lsl	r3, r3, #1
    80f0:	e0633001 	rsb	r3, r3, r1
    80f4:	e6ef3073 	uxtb	r3, r3
    80f8:	e1a02003 	mov	r2, r3
    80fc:	e1a03002 	mov	r3, r2
    8100:	e1a03083 	lsl	r3, r3, #1
    8104:	e0833002 	add	r3, r3, r2
    8108:	e50b3010 	str	r3, [fp, #-16]
    810c:	e51b3010 	ldr	r3, [fp, #-16]
    8110:	e3a02007 	mov	r2, #7
    8114:	e1a03312 	lsl	r3, r2, r3
    8118:	e1e03003 	mvn	r3, r3
    811c:	e1a02003 	mov	r2, r3
    8120:	e51b300c 	ldr	r3, [fp, #-12]
    8124:	e0033002 	and	r3, r3, r2
    8128:	e50b300c 	str	r3, [fp, #-12]
    812c:	e55b2016 	ldrb	r2, [fp, #-22]
    8130:	e51b3010 	ldr	r3, [fp, #-16]
    8134:	e1a03312 	lsl	r3, r2, r3
    8138:	e1a02003 	mov	r2, r3
    813c:	e51b300c 	ldr	r3, [fp, #-12]
    8140:	e1833002 	orr	r3, r3, r2
    8144:	e50b300c 	str	r3, [fp, #-12]
    8148:	e30b3000 	movw	r3, #45056	; 0xb000
    814c:	e3403000 	movt	r3, #0
    8150:	e5932000 	ldr	r2, [r3]
    8154:	e51b3008 	ldr	r3, [fp, #-8]
    8158:	e1a03103 	lsl	r3, r3, #2
    815c:	e0823003 	add	r3, r2, r3
    8160:	e51b200c 	ldr	r2, [fp, #-12]
    8164:	e5832000 	str	r2, [r3]
    8168:	e24bd000 	sub	sp, fp, #0
    816c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8170:	e12fff1e 	bx	lr

00008174 <gpio_set>:
    8174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8178:	e28db000 	add	fp, sp, #0
    817c:	e24dd00c 	sub	sp, sp, #12
    8180:	e1a03000 	mov	r3, r0
    8184:	e54b3005 	strb	r3, [fp, #-5]
    8188:	e55b3005 	ldrb	r3, [fp, #-5]
    818c:	e3530035 	cmp	r3, #53	; 0x35
    8190:	9a000000 	bls	8198 <gpio_set+0x24>
    8194:	ea000014 	b	81ec <gpio_set+0x78>
    8198:	e55b3005 	ldrb	r3, [fp, #-5]
    819c:	e353001f 	cmp	r3, #31
    81a0:	9a000009 	bls	81cc <gpio_set+0x58>
    81a4:	e30b3000 	movw	r3, #45056	; 0xb000
    81a8:	e3403000 	movt	r3, #0
    81ac:	e5933000 	ldr	r3, [r3]
    81b0:	e2833020 	add	r3, r3, #32
    81b4:	e55b2005 	ldrb	r2, [fp, #-5]
    81b8:	e2422020 	sub	r2, r2, #32
    81bc:	e3a01001 	mov	r1, #1
    81c0:	e1a02211 	lsl	r2, r1, r2
    81c4:	e5832000 	str	r2, [r3]
    81c8:	ea000007 	b	81ec <gpio_set+0x78>
    81cc:	e30b3000 	movw	r3, #45056	; 0xb000
    81d0:	e3403000 	movt	r3, #0
    81d4:	e5933000 	ldr	r3, [r3]
    81d8:	e283301c 	add	r3, r3, #28
    81dc:	e55b2005 	ldrb	r2, [fp, #-5]
    81e0:	e3a01001 	mov	r1, #1
    81e4:	e1a02211 	lsl	r2, r1, r2
    81e8:	e5832000 	str	r2, [r3]
    81ec:	e24bd000 	sub	sp, fp, #0
    81f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81f4:	e12fff1e 	bx	lr

000081f8 <gpio_clr>:
    81f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81fc:	e28db000 	add	fp, sp, #0
    8200:	e24dd00c 	sub	sp, sp, #12
    8204:	e1a03000 	mov	r3, r0
    8208:	e54b3005 	strb	r3, [fp, #-5]
    820c:	e55b3005 	ldrb	r3, [fp, #-5]
    8210:	e3530035 	cmp	r3, #53	; 0x35
    8214:	9a000000 	bls	821c <gpio_clr+0x24>
    8218:	ea000014 	b	8270 <gpio_clr+0x78>
    821c:	e55b3005 	ldrb	r3, [fp, #-5]
    8220:	e353001f 	cmp	r3, #31
    8224:	9a000009 	bls	8250 <gpio_clr+0x58>
    8228:	e30b3000 	movw	r3, #45056	; 0xb000
    822c:	e3403000 	movt	r3, #0
    8230:	e5933000 	ldr	r3, [r3]
    8234:	e283302c 	add	r3, r3, #44	; 0x2c
    8238:	e55b2005 	ldrb	r2, [fp, #-5]
    823c:	e2422020 	sub	r2, r2, #32
    8240:	e3a01001 	mov	r1, #1
    8244:	e1a02211 	lsl	r2, r1, r2
    8248:	e5832000 	str	r2, [r3]
    824c:	ea000007 	b	8270 <gpio_clr+0x78>
    8250:	e30b3000 	movw	r3, #45056	; 0xb000
    8254:	e3403000 	movt	r3, #0
    8258:	e5933000 	ldr	r3, [r3]
    825c:	e2833028 	add	r3, r3, #40	; 0x28
    8260:	e55b2005 	ldrb	r2, [fp, #-5]
    8264:	e3a01001 	mov	r1, #1
    8268:	e1a02211 	lsl	r2, r1, r2
    826c:	e5832000 	str	r2, [r3]
    8270:	e24bd000 	sub	sp, fp, #0
    8274:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8278:	e12fff1e 	bx	lr

0000827c <gpio_set_pull>:
    827c:	e92d4800 	push	{fp, lr}
    8280:	e28db004 	add	fp, sp, #4
    8284:	e24dd008 	sub	sp, sp, #8
    8288:	e1a03000 	mov	r3, r0
    828c:	e1a02001 	mov	r2, r1
    8290:	e54b3005 	strb	r3, [fp, #-5]
    8294:	e1a03002 	mov	r3, r2
    8298:	e54b3006 	strb	r3, [fp, #-6]
    829c:	e55b3005 	ldrb	r3, [fp, #-5]
    82a0:	e3530035 	cmp	r3, #53	; 0x35
    82a4:	8a000002 	bhi	82b4 <gpio_set_pull+0x38>
    82a8:	e55b3006 	ldrb	r3, [fp, #-6]
    82ac:	e3530002 	cmp	r3, #2
    82b0:	9a000000 	bls	82b8 <gpio_set_pull+0x3c>
    82b4:	ea00002c 	b	836c <gpio_set_pull+0xf0>
    82b8:	e30b3000 	movw	r3, #45056	; 0xb000
    82bc:	e3403000 	movt	r3, #0
    82c0:	e5933000 	ldr	r3, [r3]
    82c4:	e2833094 	add	r3, r3, #148	; 0x94
    82c8:	e55b2006 	ldrb	r2, [fp, #-6]
    82cc:	e5832000 	str	r2, [r3]
    82d0:	e3a00096 	mov	r0, #150	; 0x96
    82d4:	eb0001a6 	bl	8974 <delay_cycles>
    82d8:	e55b3005 	ldrb	r3, [fp, #-5]
    82dc:	e353001f 	cmp	r3, #31
    82e0:	9a000011 	bls	832c <gpio_set_pull+0xb0>
    82e4:	e30b3000 	movw	r3, #45056	; 0xb000
    82e8:	e3403000 	movt	r3, #0
    82ec:	e5933000 	ldr	r3, [r3]
    82f0:	e283309c 	add	r3, r3, #156	; 0x9c
    82f4:	e55b2005 	ldrb	r2, [fp, #-5]
    82f8:	e2422020 	sub	r2, r2, #32
    82fc:	e3a01001 	mov	r1, #1
    8300:	e1a02211 	lsl	r2, r1, r2
    8304:	e5832000 	str	r2, [r3]
    8308:	e3a00096 	mov	r0, #150	; 0x96
    830c:	eb000198 	bl	8974 <delay_cycles>
    8310:	e30b3000 	movw	r3, #45056	; 0xb000
    8314:	e3403000 	movt	r3, #0
    8318:	e5933000 	ldr	r3, [r3]
    831c:	e283309c 	add	r3, r3, #156	; 0x9c
    8320:	e3a02000 	mov	r2, #0
    8324:	e5832000 	str	r2, [r3]
    8328:	ea00000f 	b	836c <gpio_set_pull+0xf0>
    832c:	e30b3000 	movw	r3, #45056	; 0xb000
    8330:	e3403000 	movt	r3, #0
    8334:	e5933000 	ldr	r3, [r3]
    8338:	e2833098 	add	r3, r3, #152	; 0x98
    833c:	e55b2005 	ldrb	r2, [fp, #-5]
    8340:	e3a01001 	mov	r1, #1
    8344:	e1a02211 	lsl	r2, r1, r2
    8348:	e5832000 	str	r2, [r3]
    834c:	e3a00096 	mov	r0, #150	; 0x96
    8350:	eb000187 	bl	8974 <delay_cycles>
    8354:	e30b3000 	movw	r3, #45056	; 0xb000
    8358:	e3403000 	movt	r3, #0
    835c:	e5933000 	ldr	r3, [r3]
    8360:	e2833098 	add	r3, r3, #152	; 0x98
    8364:	e3a02000 	mov	r2, #0
    8368:	e5832000 	str	r2, [r3]
    836c:	e24bd004 	sub	sp, fp, #4
    8370:	e8bd8800 	pop	{fp, pc}

00008374 <kernel_main>:
    8374:	e92d4800 	push	{fp, lr}
    8378:	e28db004 	add	fp, sp, #4
    837c:	e24dd010 	sub	sp, sp, #16
    8380:	e3a03001 	mov	r3, #1
    8384:	e50b300c 	str	r3, [fp, #-12]
    8388:	eb000131 	bl	8854 <uart_init>
    838c:	e3a03000 	mov	r3, #0
    8390:	e50b3008 	str	r3, [fp, #-8]
    8394:	ea00000c 	b	83cc <kernel_main+0x58>
    8398:	e30c37d0 	movw	r3, #51152	; 0xc7d0
    839c:	e3403000 	movt	r3, #0
    83a0:	e51b2008 	ldr	r2, [fp, #-8]
    83a4:	e51b1008 	ldr	r1, [fp, #-8]
    83a8:	e7831102 	str	r1, [r3, r2, lsl #2]
    83ac:	e30c3000 	movw	r3, #49152	; 0xc000
    83b0:	e3403000 	movt	r3, #0
    83b4:	e51b2008 	ldr	r2, [fp, #-8]
    83b8:	e51b1008 	ldr	r1, [fp, #-8]
    83bc:	e7831102 	str	r1, [r3, r2, lsl #2]
    83c0:	e51b3008 	ldr	r3, [fp, #-8]
    83c4:	e2833001 	add	r3, r3, #1
    83c8:	e50b3008 	str	r3, [fp, #-8]
    83cc:	e51b3008 	ldr	r3, [fp, #-8]
    83d0:	e3530f7d 	cmp	r3, #500	; 0x1f4
    83d4:	baffffef 	blt	8398 <kernel_main+0x24>
    83d8:	e30a0000 	movw	r0, #40960	; 0xa000
    83dc:	e3400000 	movt	r0, #0
    83e0:	eb000087 	bl	8604 <printk>
    83e4:	eb000155 	bl	8940 <tic>
    83e8:	e30c07d0 	movw	r0, #51152	; 0xc7d0
    83ec:	e3400000 	movt	r0, #0
    83f0:	eb0001d7 	bl	8b54 <optimize_me>
    83f4:	eb000157 	bl	8958 <toc>
    83f8:	e50b0010 	str	r0, [fp, #-16]
    83fc:	e30a0024 	movw	r0, #40996	; 0xa024
    8400:	e3400000 	movt	r0, #0
    8404:	e51b1010 	ldr	r1, [fp, #-16]
    8408:	eb00007d 	bl	8604 <printk>
    840c:	e30a0028 	movw	r0, #41000	; 0xa028
    8410:	e3400000 	movt	r0, #0
    8414:	eb00007a 	bl	8604 <printk>
    8418:	eb000148 	bl	8940 <tic>
    841c:	e30c0000 	movw	r0, #49152	; 0xc000
    8420:	e3400000 	movt	r0, #0
    8424:	eb000174 	bl	89fc <unoptimized>
    8428:	eb00014a 	bl	8958 <toc>
    842c:	e50b0010 	str	r0, [fp, #-16]
    8430:	e30a0024 	movw	r0, #40996	; 0xa024
    8434:	e3400000 	movt	r0, #0
    8438:	e51b1010 	ldr	r1, [fp, #-16]
    843c:	eb000070 	bl	8604 <printk>
    8440:	e3a03000 	mov	r3, #0
    8444:	e50b3008 	str	r3, [fp, #-8]
    8448:	ea000012 	b	8498 <kernel_main+0x124>
    844c:	e30c37d0 	movw	r3, #51152	; 0xc7d0
    8450:	e3403000 	movt	r3, #0
    8454:	e51b2008 	ldr	r2, [fp, #-8]
    8458:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    845c:	e30c3000 	movw	r3, #49152	; 0xc000
    8460:	e3403000 	movt	r3, #0
    8464:	e51b1008 	ldr	r1, [fp, #-8]
    8468:	e7933101 	ldr	r3, [r3, r1, lsl #2]
    846c:	e1520003 	cmp	r2, r3
    8470:	0a000005 	beq	848c <kernel_main+0x118>
    8474:	e30a004c 	movw	r0, #41036	; 0xa04c
    8478:	e3400000 	movt	r0, #0
    847c:	eb000060 	bl	8604 <printk>
    8480:	e3a03000 	mov	r3, #0
    8484:	e50b300c 	str	r3, [fp, #-12]
    8488:	ea000005 	b	84a4 <kernel_main+0x130>
    848c:	e51b3008 	ldr	r3, [fp, #-8]
    8490:	e2833001 	add	r3, r3, #1
    8494:	e50b3008 	str	r3, [fp, #-8]
    8498:	e51b3008 	ldr	r3, [fp, #-8]
    849c:	e3530f7d 	cmp	r3, #500	; 0x1f4
    84a0:	baffffe9 	blt	844c <kernel_main+0xd8>
    84a4:	e51b300c 	ldr	r3, [fp, #-12]
    84a8:	e3530000 	cmp	r3, #0
    84ac:	0a000002 	beq	84bc <kernel_main+0x148>
    84b0:	e30a0068 	movw	r0, #41064	; 0xa068
    84b4:	e3400000 	movt	r0, #0
    84b8:	eb000051 	bl	8604 <printk>
    84bc:	e30806a0 	movw	r0, #34464	; 0x86a0
    84c0:	e3400001 	movt	r0, #1
    84c4:	eb00012a 	bl	8974 <delay_cycles>
    84c8:	eafffffb 	b	84bc <kernel_main+0x148>

000084cc <printnumk>:
    84cc:	e92d4810 	push	{r4, fp, lr}
    84d0:	e28db008 	add	fp, sp, #8
    84d4:	e24dd024 	sub	sp, sp, #36	; 0x24
    84d8:	e1a01000 	mov	r1, r0
    84dc:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    84e0:	e1a03001 	mov	r3, r1
    84e4:	e54b301d 	strb	r3, [fp, #-29]
    84e8:	e3a03000 	mov	r3, #0
    84ec:	e50b3010 	str	r3, [fp, #-16]
    84f0:	e24b301c 	sub	r3, fp, #28
    84f4:	e2833007 	add	r3, r3, #7
    84f8:	e50b3014 	str	r3, [fp, #-20]
    84fc:	e55b301d 	ldrb	r3, [fp, #-29]
    8500:	e3530008 	cmp	r3, #8
    8504:	1a000003 	bne	8518 <printnumk+0x4c>
    8508:	e30a3084 	movw	r3, #41092	; 0xa084
    850c:	e3403000 	movt	r3, #0
    8510:	e50b3010 	str	r3, [fp, #-16]
    8514:	ea000005 	b	8530 <printnumk+0x64>
    8518:	e55b301d 	ldrb	r3, [fp, #-29]
    851c:	e3530010 	cmp	r3, #16
    8520:	1a000002 	bne	8530 <printnumk+0x64>
    8524:	e30a3088 	movw	r3, #41096	; 0xa088
    8528:	e3403000 	movt	r3, #0
    852c:	e50b3010 	str	r3, [fp, #-16]
    8530:	e51b4014 	ldr	r4, [fp, #-20]
    8534:	e2443001 	sub	r3, r4, #1
    8538:	e50b3014 	str	r3, [fp, #-20]
    853c:	e55b201d 	ldrb	r2, [fp, #-29]
    8540:	e3a03000 	mov	r3, #0
    8544:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8548:	eb0001c6 	bl	8c68 <__aeabi_uldivmod>
    854c:	e1a00002 	mov	r0, r2
    8550:	e1a01003 	mov	r1, r3
    8554:	e30b3004 	movw	r3, #45060	; 0xb004
    8558:	e3403000 	movt	r3, #0
    855c:	e0833000 	add	r3, r3, r0
    8560:	e5d33000 	ldrb	r3, [r3]
    8564:	e5c43000 	strb	r3, [r4]
    8568:	e55b201d 	ldrb	r2, [fp, #-29]
    856c:	e3a03000 	mov	r3, #0
    8570:	e14b02dc 	ldrd	r0, [fp, #-44]	; 0xffffffd4
    8574:	eb0001bb 	bl	8c68 <__aeabi_uldivmod>
    8578:	e1a02000 	mov	r2, r0
    857c:	e1a03001 	mov	r3, r1
    8580:	e14b22fc 	strd	r2, [fp, #-44]	; 0xffffffd4
    8584:	e14b22dc 	ldrd	r2, [fp, #-44]	; 0xffffffd4
    8588:	e1923003 	orrs	r3, r2, r3
    858c:	1affffe7 	bne	8530 <printnumk+0x64>
    8590:	e51b3010 	ldr	r3, [fp, #-16]
    8594:	e3530000 	cmp	r3, #0
    8598:	0a00000a 	beq	85c8 <printnumk+0xfc>
    859c:	ea000005 	b	85b8 <printnumk+0xec>
    85a0:	e51b3010 	ldr	r3, [fp, #-16]
    85a4:	e2832001 	add	r2, r3, #1
    85a8:	e50b2010 	str	r2, [fp, #-16]
    85ac:	e5d33000 	ldrb	r3, [r3]
    85b0:	e1a00003 	mov	r0, r3
    85b4:	eb0000b0 	bl	887c <uart_put_byte>
    85b8:	e51b3010 	ldr	r3, [fp, #-16]
    85bc:	e5d33000 	ldrb	r3, [r3]
    85c0:	e3530000 	cmp	r3, #0
    85c4:	1afffff5 	bne	85a0 <printnumk+0xd4>
    85c8:	ea000003 	b	85dc <printnumk+0x110>
    85cc:	e51b3014 	ldr	r3, [fp, #-20]
    85d0:	e5d33000 	ldrb	r3, [r3]
    85d4:	e1a00003 	mov	r0, r3
    85d8:	eb0000a7 	bl	887c <uart_put_byte>
    85dc:	e51b3014 	ldr	r3, [fp, #-20]
    85e0:	e2833001 	add	r3, r3, #1
    85e4:	e50b3014 	str	r3, [fp, #-20]
    85e8:	e24b301c 	sub	r3, fp, #28
    85ec:	e2833008 	add	r3, r3, #8
    85f0:	e51b2014 	ldr	r2, [fp, #-20]
    85f4:	e1520003 	cmp	r2, r3
    85f8:	1afffff3 	bne	85cc <printnumk+0x100>
    85fc:	e24bd008 	sub	sp, fp, #8
    8600:	e8bd8810 	pop	{r4, fp, pc}

00008604 <printk>:
    8604:	e92d000f 	push	{r0, r1, r2, r3}
    8608:	e92d4800 	push	{fp, lr}
    860c:	e28db004 	add	fp, sp, #4
    8610:	e24dd020 	sub	sp, sp, #32
    8614:	e28b3008 	add	r3, fp, #8
    8618:	e50b3020 	str	r3, [fp, #-32]
    861c:	ea000082 	b	882c <printk+0x228>
    8620:	e59b3004 	ldr	r3, [fp, #4]
    8624:	e5d33000 	ldrb	r3, [r3]
    8628:	e3530025 	cmp	r3, #37	; 0x25
    862c:	0a000006 	beq	864c <printk+0x48>
    8630:	e59b3004 	ldr	r3, [fp, #4]
    8634:	e2832001 	add	r2, r3, #1
    8638:	e58b2004 	str	r2, [fp, #4]
    863c:	e5d33000 	ldrb	r3, [r3]
    8640:	e1a00003 	mov	r0, r3
    8644:	eb00008c 	bl	887c <uart_put_byte>
    8648:	ea000077 	b	882c <printk+0x228>
    864c:	e59b3004 	ldr	r3, [fp, #4]
    8650:	e2833001 	add	r3, r3, #1
    8654:	e58b3004 	str	r3, [fp, #4]
    8658:	e59b3004 	ldr	r3, [fp, #4]
    865c:	e5d33000 	ldrb	r3, [r3]
    8660:	e353006f 	cmp	r3, #111	; 0x6f
    8664:	0a000036 	beq	8744 <printk+0x140>
    8668:	e353006f 	cmp	r3, #111	; 0x6f
    866c:	ca000006 	bgt	868c <printk+0x88>
    8670:	e3530063 	cmp	r3, #99	; 0x63
    8674:	0a00005a 	beq	87e4 <printk+0x1e0>
    8678:	e3530064 	cmp	r3, #100	; 0x64
    867c:	0a00000e 	beq	86bc <printk+0xb8>
    8680:	e3530025 	cmp	r3, #37	; 0x25
    8684:	0a000060 	beq	880c <printk+0x208>
    8688:	ea000062 	b	8818 <printk+0x214>
    868c:	e3530073 	cmp	r3, #115	; 0x73
    8690:	0a000041 	beq	879c <printk+0x198>
    8694:	e3530073 	cmp	r3, #115	; 0x73
    8698:	ca000002 	bgt	86a8 <printk+0xa4>
    869c:	e3530070 	cmp	r3, #112	; 0x70
    86a0:	0a000032 	beq	8770 <printk+0x16c>
    86a4:	ea00005b 	b	8818 <printk+0x214>
    86a8:	e3530075 	cmp	r3, #117	; 0x75
    86ac:	0a000019 	beq	8718 <printk+0x114>
    86b0:	e3530078 	cmp	r3, #120	; 0x78
    86b4:	0a00002d 	beq	8770 <printk+0x16c>
    86b8:	ea000056 	b	8818 <printk+0x214>
    86bc:	e51b3020 	ldr	r3, [fp, #-32]
    86c0:	e2832004 	add	r2, r3, #4
    86c4:	e50b2020 	str	r2, [fp, #-32]
    86c8:	e5933000 	ldr	r3, [r3]
    86cc:	e50b300c 	str	r3, [fp, #-12]
    86d0:	e51b300c 	ldr	r3, [fp, #-12]
    86d4:	e3530000 	cmp	r3, #0
    86d8:	aa000008 	bge	8700 <printk+0xfc>
    86dc:	e3a0002d 	mov	r0, #45	; 0x2d
    86e0:	eb000065 	bl	887c <uart_put_byte>
    86e4:	e51b300c 	ldr	r3, [fp, #-12]
    86e8:	e2633000 	rsb	r3, r3, #0
    86ec:	e1a02003 	mov	r2, r3
    86f0:	e1a03fc2 	asr	r3, r2, #31
    86f4:	e3a0000a 	mov	r0, #10
    86f8:	ebffff73 	bl	84cc <printnumk>
    86fc:	ea000047 	b	8820 <printk+0x21c>
    8700:	e51b300c 	ldr	r3, [fp, #-12]
    8704:	e1a02003 	mov	r2, r3
    8708:	e1a03fc2 	asr	r3, r2, #31
    870c:	e3a0000a 	mov	r0, #10
    8710:	ebffff6d 	bl	84cc <printnumk>
    8714:	ea000041 	b	8820 <printk+0x21c>
    8718:	e51b3020 	ldr	r3, [fp, #-32]
    871c:	e2832004 	add	r2, r3, #4
    8720:	e50b2020 	str	r2, [fp, #-32]
    8724:	e5933000 	ldr	r3, [r3]
    8728:	e50b3010 	str	r3, [fp, #-16]
    872c:	e51b3010 	ldr	r3, [fp, #-16]
    8730:	e1a02003 	mov	r2, r3
    8734:	e3a03000 	mov	r3, #0
    8738:	e3a0000a 	mov	r0, #10
    873c:	ebffff62 	bl	84cc <printnumk>
    8740:	ea000036 	b	8820 <printk+0x21c>
    8744:	e51b3020 	ldr	r3, [fp, #-32]
    8748:	e2832004 	add	r2, r3, #4
    874c:	e50b2020 	str	r2, [fp, #-32]
    8750:	e5933000 	ldr	r3, [r3]
    8754:	e50b3014 	str	r3, [fp, #-20]
    8758:	e51b3014 	ldr	r3, [fp, #-20]
    875c:	e1a02003 	mov	r2, r3
    8760:	e3a03000 	mov	r3, #0
    8764:	e3a00008 	mov	r0, #8
    8768:	ebffff57 	bl	84cc <printnumk>
    876c:	ea00002b 	b	8820 <printk+0x21c>
    8770:	e51b3020 	ldr	r3, [fp, #-32]
    8774:	e2832004 	add	r2, r3, #4
    8778:	e50b2020 	str	r2, [fp, #-32]
    877c:	e5933000 	ldr	r3, [r3]
    8780:	e50b3018 	str	r3, [fp, #-24]
    8784:	e51b3018 	ldr	r3, [fp, #-24]
    8788:	e1a02003 	mov	r2, r3
    878c:	e3a03000 	mov	r3, #0
    8790:	e3a00010 	mov	r0, #16
    8794:	ebffff4c 	bl	84cc <printnumk>
    8798:	ea000020 	b	8820 <printk+0x21c>
    879c:	e51b3020 	ldr	r3, [fp, #-32]
    87a0:	e2832004 	add	r2, r3, #4
    87a4:	e50b2020 	str	r2, [fp, #-32]
    87a8:	e5933000 	ldr	r3, [r3]
    87ac:	e50b3008 	str	r3, [fp, #-8]
    87b0:	ea000006 	b	87d0 <printk+0x1cc>
    87b4:	e51b3008 	ldr	r3, [fp, #-8]
    87b8:	e5d33000 	ldrb	r3, [r3]
    87bc:	e1a00003 	mov	r0, r3
    87c0:	eb00002d 	bl	887c <uart_put_byte>
    87c4:	e51b3008 	ldr	r3, [fp, #-8]
    87c8:	e2833001 	add	r3, r3, #1
    87cc:	e50b3008 	str	r3, [fp, #-8]
    87d0:	e51b3008 	ldr	r3, [fp, #-8]
    87d4:	e5d33000 	ldrb	r3, [r3]
    87d8:	e3530000 	cmp	r3, #0
    87dc:	1afffff4 	bne	87b4 <printk+0x1b0>
    87e0:	ea00000e 	b	8820 <printk+0x21c>
    87e4:	e51b3020 	ldr	r3, [fp, #-32]
    87e8:	e2832004 	add	r2, r3, #4
    87ec:	e50b2020 	str	r2, [fp, #-32]
    87f0:	e5933000 	ldr	r3, [r3]
    87f4:	e50b301c 	str	r3, [fp, #-28]
    87f8:	e51b301c 	ldr	r3, [fp, #-28]
    87fc:	e6ef3073 	uxtb	r3, r3
    8800:	e1a00003 	mov	r0, r3
    8804:	eb00001c 	bl	887c <uart_put_byte>
    8808:	ea000004 	b	8820 <printk+0x21c>
    880c:	e3a00025 	mov	r0, #37	; 0x25
    8810:	eb000019 	bl	887c <uart_put_byte>
    8814:	ea000001 	b	8820 <printk+0x21c>
    8818:	e3e03000 	mvn	r3, #0
    881c:	ea000007 	b	8840 <printk+0x23c>
    8820:	e59b3004 	ldr	r3, [fp, #4]
    8824:	e2833001 	add	r3, r3, #1
    8828:	e58b3004 	str	r3, [fp, #4]
    882c:	e59b3004 	ldr	r3, [fp, #4]
    8830:	e5d33000 	ldrb	r3, [r3]
    8834:	e3530000 	cmp	r3, #0
    8838:	1affff78 	bne	8620 <printk+0x1c>
    883c:	e3a03000 	mov	r3, #0
    8840:	e1a00003 	mov	r0, r3
    8844:	e24bd004 	sub	sp, fp, #4
    8848:	e8bd4800 	pop	{fp, lr}
    884c:	e28dd010 	add	sp, sp, #16
    8850:	e12fff1e 	bx	lr

00008854 <uart_init>:
    8854:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8858:	e28db000 	add	fp, sp, #0
    885c:	e24bd000 	sub	sp, fp, #0
    8860:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8864:	e12fff1e 	bx	lr

00008868 <uart_close>:
    8868:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    886c:	e28db000 	add	fp, sp, #0
    8870:	e24bd000 	sub	sp, fp, #0
    8874:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8878:	e12fff1e 	bx	lr

0000887c <uart_put_byte>:
    887c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8880:	e28db000 	add	fp, sp, #0
    8884:	e24dd00c 	sub	sp, sp, #12
    8888:	e1a03000 	mov	r3, r0
    888c:	e54b3005 	strb	r3, [fp, #-5]
    8890:	e24bd000 	sub	sp, fp, #0
    8894:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8898:	e12fff1e 	bx	lr

0000889c <uart_get_byte>:
    889c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88a0:	e28db000 	add	fp, sp, #0
    88a4:	e3a03000 	mov	r3, #0
    88a8:	e1a00003 	mov	r0, r3
    88ac:	e24bd000 	sub	sp, fp, #0
    88b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88b4:	e12fff1e 	bx	lr

000088b8 <timer_start>:
    88b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88bc:	e28db000 	add	fp, sp, #0
    88c0:	e24dd00c 	sub	sp, sp, #12
    88c4:	e50b0008 	str	r0, [fp, #-8]
    88c8:	e1a00000 	nop			; (mov r0, r0)
    88cc:	e24bd000 	sub	sp, fp, #0
    88d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88d4:	e12fff1e 	bx	lr

000088d8 <timer_stop>:
    88d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88dc:	e28db000 	add	fp, sp, #0
    88e0:	e1a00000 	nop			; (mov r0, r0)
    88e4:	e24bd000 	sub	sp, fp, #0
    88e8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    88ec:	e12fff1e 	bx	lr

000088f0 <timer_read>:
    88f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    88f4:	e28db000 	add	fp, sp, #0
    88f8:	e3a03000 	mov	r3, #0
    88fc:	e1a00003 	mov	r0, r3
    8900:	e24bd000 	sub	sp, fp, #0
    8904:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8908:	e12fff1e 	bx	lr

0000890c <timer_is_pending>:
    890c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8910:	e28db000 	add	fp, sp, #0
    8914:	e3a03000 	mov	r3, #0
    8918:	e1a00003 	mov	r0, r3
    891c:	e24bd000 	sub	sp, fp, #0
    8920:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8924:	e12fff1e 	bx	lr

00008928 <timer_clear_pending>:
    8928:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    892c:	e28db000 	add	fp, sp, #0
    8930:	e1a00000 	nop			; (mov r0, r0)
    8934:	e24bd000 	sub	sp, fp, #0
    8938:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    893c:	e12fff1e 	bx	lr

00008940 <tic>:
    8940:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8944:	e28db000 	add	fp, sp, #0
    8948:	e1a00000 	nop			; (mov r0, r0)
    894c:	e24bd000 	sub	sp, fp, #0
    8950:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8954:	e12fff1e 	bx	lr

00008958 <toc>:
    8958:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    895c:	e28db000 	add	fp, sp, #0
    8960:	e3a03000 	mov	r3, #0
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
    8964:	e1a00003 	mov	r0, r3
    8968:	e24bd000 	sub	sp, fp, #0
    896c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8970:	e12fff1e 	bx	lr

00008974 <delay_cycles>:
    8974:	e2500001 	subs	r0, r0, #1
    8978:	1afffffd 	bne	8974 <delay_cycles>
    897c:	e1a0f00e 	mov	pc, lr

00008980 <read_cpsr>:
    8980:	e10f0000 	mrs	r0, CPSR
    8984:	e1a0f00e 	mov	pc, lr

00008988 <write_cpsr>:
    8988:	e129f000 	msr	CPSR_fc, r0
    898c:	e1a0f00e 	mov	pc, lr

00008990 <disable_interrupts>:
    8990:	e10f0000 	mrs	r0, CPSR
    8994:	e3a01d07 	mov	r1, #448	; 0x1c0
    8998:	e1800001 	orr	r0, r0, r1
    899c:	e129f000 	msr	CPSR_fc, r0
    89a0:	e1a0f00e 	mov	pc, lr

000089a4 <enable_interrupts>:
    89a4:	e10f0000 	mrs	r0, CPSR
    89a8:	e3a01d07 	mov	r1, #448	; 0x1c0
    89ac:	e1c00001 	bic	r0, r0, r1
    89b0:	e129f000 	msr	CPSR_fc, r0
    89b4:	e1a0f00e 	mov	pc, lr

000089b8 <func2>:
    89b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    89bc:	e28db000 	add	fp, sp, #0
    89c0:	e24dd00c 	sub	sp, sp, #12
    89c4:	e50b0008 	str	r0, [fp, #-8]
    89c8:	e50b100c 	str	r1, [fp, #-12]
    89cc:	e51b200c 	ldr	r2, [fp, #-12]
    89d0:	e1a03002 	mov	r3, r2
    89d4:	e1a03103 	lsl	r3, r3, #2
    89d8:	e0833002 	add	r3, r3, r2
    89dc:	e1a02103 	lsl	r2, r3, #2
    89e0:	e0832002 	add	r2, r3, r2
    89e4:	e51b3008 	ldr	r3, [fp, #-8]
    89e8:	e0823003 	add	r3, r2, r3
    89ec:	e1a00003 	mov	r0, r3
    89f0:	e24bd000 	sub	sp, fp, #0
    89f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    89f8:	e12fff1e 	bx	lr

000089fc <unoptimized>:
    89fc:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8a00:	e28db010 	add	fp, sp, #16
    8a04:	e24dd01c 	sub	sp, sp, #28
    8a08:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8a0c:	e3a03000 	mov	r3, #0
    8a10:	e50b3018 	str	r3, [fp, #-24]
    8a14:	ea000037 	b	8af8 <unoptimized+0xfc>
    8a18:	e3a03011 	mov	r3, #17
    8a1c:	e50b3020 	str	r3, [fp, #-32]
    8a20:	e3a03000 	mov	r3, #0
    8a24:	e50b301c 	str	r3, [fp, #-28]
    8a28:	ea00002c 	b	8ae0 <unoptimized+0xe4>
    8a2c:	e3a03002 	mov	r3, #2
    8a30:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a34:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a38:	e2833001 	add	r3, r3, #1
    8a3c:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a40:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8a44:	e2432002 	sub	r2, r3, #2
    8a48:	e1a03002 	mov	r3, r2
    8a4c:	e1a03083 	lsl	r3, r3, #1
    8a50:	e0833002 	add	r3, r3, r2
    8a54:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8a58:	e51b301c 	ldr	r3, [fp, #-28]
    8a5c:	e1a03103 	lsl	r3, r3, #2
    8a60:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a64:	e0824003 	add	r4, r2, r3
    8a68:	e51b301c 	ldr	r3, [fp, #-28]
    8a6c:	e1a03103 	lsl	r3, r3, #2
    8a70:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a74:	e0823003 	add	r3, r2, r3
    8a78:	e5933000 	ldr	r3, [r3]
    8a7c:	e51b2020 	ldr	r2, [fp, #-32]
    8a80:	e0030392 	mul	r3, r2, r3
    8a84:	e2835010 	add	r5, r3, #16
    8a88:	e51b3018 	ldr	r3, [fp, #-24]
    8a8c:	e1a03103 	lsl	r3, r3, #2
    8a90:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8a94:	e0823003 	add	r3, r2, r3
    8a98:	e5936000 	ldr	r6, [r3]
    8a9c:	e51b0018 	ldr	r0, [fp, #-24]
    8aa0:	e51b101c 	ldr	r1, [fp, #-28]
    8aa4:	ebffffc3 	bl	89b8 <func2>
    8aa8:	e1a03000 	mov	r3, r0
    8aac:	e0030396 	mul	r3, r6, r3
    8ab0:	e0852003 	add	r2, r5, r3
    8ab4:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8ab8:	e0823003 	add	r3, r2, r3
    8abc:	e283200f 	add	r2, r3, #15
    8ac0:	e3530000 	cmp	r3, #0
    8ac4:	b1a03002 	movlt	r3, r2
    8ac8:	a1a03003 	movge	r3, r3
    8acc:	e1a03243 	asr	r3, r3, #4
    8ad0:	e5843000 	str	r3, [r4]
    8ad4:	e51b301c 	ldr	r3, [fp, #-28]
    8ad8:	e2833001 	add	r3, r3, #1
    8adc:	e50b301c 	str	r3, [fp, #-28]
    8ae0:	e51b301c 	ldr	r3, [fp, #-28]
    8ae4:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8ae8:	baffffcf 	blt	8a2c <unoptimized+0x30>
    8aec:	e51b3018 	ldr	r3, [fp, #-24]
    8af0:	e2833001 	add	r3, r3, #1
    8af4:	e50b3018 	str	r3, [fp, #-24]
    8af8:	e51b3018 	ldr	r3, [fp, #-24]
    8afc:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8b00:	baffffc4 	blt	8a18 <unoptimized+0x1c>
    8b04:	e24bd010 	sub	sp, fp, #16
    8b08:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8b0c:	e12fff1e 	bx	lr

00008b10 <func>:
    8b10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
<<<<<<< HEAD
    8b14:	e1a0b00d 	mov	fp, sp
    8b18:	e24dd00c 	sub	sp, sp, #12
    8b1c:	e50b0008 	str	r0, [fp, #-8]
    8b20:	e58d1000 	str	r1, [sp]
    8b24:	e59d2000 	ldr	r2, [sp]
    8b28:	e1a03102 	lsl	r3, r2, #2
    8b2c:	e0833002 	add	r3, r3, r2
    8b30:	e1a02103 	lsl	r2, r3, #2
    8b34:	e0832002 	add	r2, r3, r2
    8b38:	e0820000 	add	r0, r2, r0
    8b3c:	e1a0d00b 	mov	sp, fp
    8b40:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b44:	e12fff1e 	bx	lr

00008b48 <optimize_me>:
    8b48:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8b4c:	e28db010 	add	fp, sp, #16
    8b50:	e24dd01c 	sub	sp, sp, #28
    8b54:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8b58:	e3a09f7d 	mov	r9, #500	; 0x1f4
    8b5c:	e3a08000 	mov	r8, #0
    8b60:	eaffffff 	b	8b64 <optimize_me+0x1c>
    8b64:	e1a05108 	lsl	r5, r8, #2
    8b68:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8b6c:	e0824005 	add	r4, r2, r5
    8b70:	e1a03108 	lsl	r3, r8, #2
    8b74:	e0823003 	add	r3, r2, r3
    8b78:	e5933000 	ldr	r3, [r3]
    8b7c:	e1a05203 	lsl	r5, r3, #4
    8b80:	e0855003 	add	r5, r5, r3
    8b84:	e2855010 	add	r5, r5, #16
    8b88:	e1a07009 	mov	r7, r9
    8b8c:	e3a03f7d 	mov	r3, #500	; 0x1f4
    8b90:	e0437007 	sub	r7, r3, r7
    8b94:	e1a03107 	lsl	r3, r7, #2
    8b98:	e0823003 	add	r3, r2, r3
    8b9c:	e5936000 	ldr	r6, [r3]
    8ba0:	e1a00007 	mov	r0, r7
    8ba4:	e1a01008 	mov	r1, r8
    8ba8:	ebffffd8 	bl	8b10 <func>
    8bac:	e0030096 	mul	r3, r6, r0
    8bb0:	e0852003 	add	r2, r5, r3
    8bb4:	e3a03003 	mov	r3, #3
    8bb8:	e0823003 	add	r3, r2, r3
    8bbc:	e3530000 	cmp	r3, #0
    8bc0:	b283300f 	addlt	r3, r3, #15
    8bc4:	e1a03243 	asr	r3, r3, #4
    8bc8:	e5843000 	str	r3, [r4]
    8bcc:	e2888001 	add	r8, r8, #1
    8bd0:	e3580f7d 	cmp	r8, #500	; 0x1f4
    8bd4:	baffffe2 	blt	8b64 <optimize_me+0x1c>
    8bd8:	e2499001 	sub	r9, r9, #1
    8bdc:	e3590000 	cmp	r9, #0
    8be0:	caffffdd 	bgt	8b5c <optimize_me+0x14>
    8be4:	e24bd010 	sub	sp, fp, #16
    8be8:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8bec:	e12fff1e 	bx	lr

00008bf0 <__aeabi_uldivmod>:
    8bf0:	e3530000 	cmp	r3, #0
    8bf4:	03520000 	cmpeq	r2, #0
    8bf8:	1a000004 	bne	8c10 <__aeabi_uldivmod+0x20>
    8bfc:	e3510000 	cmp	r1, #0
    8c00:	03500000 	cmpeq	r0, #0
    8c04:	13e01000 	mvnne	r1, #0
    8c08:	13e00000 	mvnne	r0, #0
    8c0c:	ea000027 	b	8cb0 <__aeabi_idiv0>
    8c10:	e24dd008 	sub	sp, sp, #8
    8c14:	e92d6000 	push	{sp, lr}
    8c18:	eb000014 	bl	8c70 <__gnu_uldivmod_helper>
    8c1c:	e59de004 	ldr	lr, [sp, #4]
    8c20:	e28dd008 	add	sp, sp, #8
    8c24:	e8bd000c 	pop	{r2, r3}
    8c28:	e12fff1e 	bx	lr

00008c2c <__gnu_ldivmod_helper>:
    8c2c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8c30:	e59d6020 	ldr	r6, [sp, #32]
    8c34:	e1a07002 	mov	r7, r2
    8c38:	e1a0a003 	mov	sl, r3
    8c3c:	e1a04000 	mov	r4, r0
    8c40:	e1a05001 	mov	r5, r1
    8c44:	eb00001a 	bl	8cb4 <__divdi3>
    8c48:	e1a03000 	mov	r3, r0
    8c4c:	e0020197 	mul	r2, r7, r1
    8c50:	e0898097 	umull	r8, r9, r7, r0
    8c54:	e023239a 	mla	r3, sl, r3, r2
    8c58:	e0544008 	subs	r4, r4, r8
    8c5c:	e0839009 	add	r9, r3, r9
    8c60:	e0c55009 	sbc	r5, r5, r9
    8c64:	e8860030 	stm	r6, {r4, r5}
    8c68:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8c6c:	e12fff1e 	bx	lr

00008c70 <__gnu_uldivmod_helper>:
    8c70:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8c74:	e59d5018 	ldr	r5, [sp, #24]
    8c78:	e1a04002 	mov	r4, r2
    8c7c:	e1a08003 	mov	r8, r3
    8c80:	e1a06000 	mov	r6, r0
    8c84:	e1a07001 	mov	r7, r1
    8c88:	eb000067 	bl	8e2c <__udivdi3>
    8c8c:	e0080890 	mul	r8, r0, r8
    8c90:	e0832490 	umull	r2, r3, r0, r4
    8c94:	e0248491 	mla	r4, r1, r4, r8
    8c98:	e0566002 	subs	r6, r6, r2
    8c9c:	e0843003 	add	r3, r4, r3
    8ca0:	e0c77003 	sbc	r7, r7, r3
    8ca4:	e88500c0 	stm	r5, {r6, r7}
    8ca8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8cac:	e12fff1e 	bx	lr

00008cb0 <__aeabi_idiv0>:
    8cb0:	e12fff1e 	bx	lr

00008cb4 <__divdi3>:
    8cb4:	e3510000 	cmp	r1, #0
    8cb8:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8cbc:	a1a04000 	movge	r4, r0
    8cc0:	a1a05001 	movge	r5, r1
    8cc4:	a3a0a000 	movge	sl, #0
    8cc8:	ba000053 	blt	8e1c <__divdi3+0x168>
    8ccc:	e3530000 	cmp	r3, #0
    8cd0:	a1a08002 	movge	r8, r2
    8cd4:	a1a09003 	movge	r9, r3
    8cd8:	ba00004b 	blt	8e0c <__divdi3+0x158>
    8cdc:	e1550009 	cmp	r5, r9
    8ce0:	01540008 	cmpeq	r4, r8
    8ce4:	33a02000 	movcc	r2, #0
    8ce8:	33a03000 	movcc	r3, #0
    8cec:	3a00003b 	bcc	8de0 <__divdi3+0x12c>
    8cf0:	e1a01009 	mov	r1, r9
    8cf4:	e1a00008 	mov	r0, r8
    8cf8:	eb000093 	bl	8f4c <__clzdi2>
    8cfc:	e1a01005 	mov	r1, r5
    8d00:	e1a0b000 	mov	fp, r0
    8d04:	e1a00004 	mov	r0, r4
    8d08:	eb00008f 	bl	8f4c <__clzdi2>
    8d0c:	e060000b 	rsb	r0, r0, fp
    8d10:	e240e020 	sub	lr, r0, #32
    8d14:	e1a07019 	lsl	r7, r9, r0
    8d18:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d1c:	e260c020 	rsb	ip, r0, #32
    8d20:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d24:	e1550007 	cmp	r5, r7
    8d28:	e1a06018 	lsl	r6, r8, r0
    8d2c:	01540006 	cmpeq	r4, r6
    8d30:	e1a01000 	mov	r1, r0
    8d34:	33a02000 	movcc	r2, #0
    8d38:	33a03000 	movcc	r3, #0
    8d3c:	3a000005 	bcc	8d58 <__divdi3+0xa4>
    8d40:	e3a08001 	mov	r8, #1
    8d44:	e0544006 	subs	r4, r4, r6
    8d48:	e1a03e18 	lsl	r3, r8, lr
    8d4c:	e1833c38 	orr	r3, r3, r8, lsr ip
    8d50:	e0c55007 	sbc	r5, r5, r7
    8d54:	e1a02018 	lsl	r2, r8, r0
    8d58:	e3500000 	cmp	r0, #0
    8d5c:	0a00001f 	beq	8de0 <__divdi3+0x12c>
    8d60:	e1b070a7 	lsrs	r7, r7, #1
    8d64:	e1a06066 	rrx	r6, r6
    8d68:	ea000007 	b	8d8c <__divdi3+0xd8>
    8d6c:	e0544006 	subs	r4, r4, r6
    8d70:	e0c55007 	sbc	r5, r5, r7
    8d74:	e0944004 	adds	r4, r4, r4
    8d78:	e0a55005 	adc	r5, r5, r5
    8d7c:	e2944001 	adds	r4, r4, #1
    8d80:	e2a55000 	adc	r5, r5, #0
    8d84:	e2500001 	subs	r0, r0, #1
    8d88:	0a000006 	beq	8da8 <__divdi3+0xf4>
    8d8c:	e1570005 	cmp	r7, r5
    8d90:	01560004 	cmpeq	r6, r4
    8d94:	9afffff4 	bls	8d6c <__divdi3+0xb8>
    8d98:	e0944004 	adds	r4, r4, r4
    8d9c:	e0a55005 	adc	r5, r5, r5
    8da0:	e2500001 	subs	r0, r0, #1
    8da4:	1afffff8 	bne	8d8c <__divdi3+0xd8>
    8da8:	e261c020 	rsb	ip, r1, #32
    8dac:	e1a00134 	lsr	r0, r4, r1
    8db0:	e0922004 	adds	r2, r2, r4
    8db4:	e241e020 	sub	lr, r1, #32
    8db8:	e1800c15 	orr	r0, r0, r5, lsl ip
    8dbc:	e1a04135 	lsr	r4, r5, r1
    8dc0:	e1800e35 	orr	r0, r0, r5, lsr lr
    8dc4:	e1a07114 	lsl	r7, r4, r1
    8dc8:	e1877e10 	orr	r7, r7, r0, lsl lr
    8dcc:	e1a06110 	lsl	r6, r0, r1
    8dd0:	e0a33005 	adc	r3, r3, r5
    8dd4:	e1877c30 	orr	r7, r7, r0, lsr ip
    8dd8:	e0522006 	subs	r2, r2, r6
    8ddc:	e0c33007 	sbc	r3, r3, r7
    8de0:	e29a0000 	adds	r0, sl, #0
    8de4:	13a00001 	movne	r0, #1
    8de8:	e3a01000 	mov	r1, #0
    8dec:	e2704000 	rsbs	r4, r0, #0
    8df0:	e2e15000 	rsc	r5, r1, #0
    8df4:	e0222004 	eor	r2, r2, r4
    8df8:	e0233005 	eor	r3, r3, r5
    8dfc:	e0900002 	adds	r0, r0, r2
    8e00:	e0a11003 	adc	r1, r1, r3
    8e04:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8e08:	e12fff1e 	bx	lr
    8e0c:	e2728000 	rsbs	r8, r2, #0
    8e10:	e1e0a00a 	mvn	sl, sl
    8e14:	e2e39000 	rsc	r9, r3, #0
    8e18:	eaffffaf 	b	8cdc <__divdi3+0x28>
    8e1c:	e2704000 	rsbs	r4, r0, #0
    8e20:	e2e15000 	rsc	r5, r1, #0
    8e24:	e3e0a000 	mvn	sl, #0
    8e28:	eaffffa7 	b	8ccc <__divdi3+0x18>

00008e2c <__udivdi3>:
    8e2c:	e1510003 	cmp	r1, r3
    8e30:	01500002 	cmpeq	r0, r2
    8e34:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8e38:	e1a04000 	mov	r4, r0
    8e3c:	e1a05001 	mov	r5, r1
    8e40:	e1a08002 	mov	r8, r2
    8e44:	e1a09003 	mov	r9, r3
    8e48:	33a00000 	movcc	r0, #0
    8e4c:	33a01000 	movcc	r1, #0
    8e50:	3a00003b 	bcc	8f44 <__udivdi3+0x118>
    8e54:	e1a01003 	mov	r1, r3
    8e58:	e1a00002 	mov	r0, r2
    8e5c:	eb00003a 	bl	8f4c <__clzdi2>
    8e60:	e1a01005 	mov	r1, r5
    8e64:	e1a0a000 	mov	sl, r0
    8e68:	e1a00004 	mov	r0, r4
    8e6c:	eb000036 	bl	8f4c <__clzdi2>
    8e70:	e060300a 	rsb	r3, r0, sl
    8e74:	e243e020 	sub	lr, r3, #32
    8e78:	e1a07319 	lsl	r7, r9, r3
    8e7c:	e1877e18 	orr	r7, r7, r8, lsl lr
    8e80:	e263c020 	rsb	ip, r3, #32
    8e84:	e1877c38 	orr	r7, r7, r8, lsr ip
    8e88:	e1550007 	cmp	r5, r7
    8e8c:	e1a06318 	lsl	r6, r8, r3
    8e90:	01540006 	cmpeq	r4, r6
    8e94:	e1a02003 	mov	r2, r3
    8e98:	33a00000 	movcc	r0, #0
    8e9c:	33a01000 	movcc	r1, #0
    8ea0:	3a000005 	bcc	8ebc <__udivdi3+0x90>
    8ea4:	e3a08001 	mov	r8, #1
    8ea8:	e0544006 	subs	r4, r4, r6
    8eac:	e1a01e18 	lsl	r1, r8, lr
    8eb0:	e1811c38 	orr	r1, r1, r8, lsr ip
    8eb4:	e0c55007 	sbc	r5, r5, r7
    8eb8:	e1a00318 	lsl	r0, r8, r3
    8ebc:	e3530000 	cmp	r3, #0
    8ec0:	0a00001f 	beq	8f44 <__udivdi3+0x118>
    8ec4:	e1b070a7 	lsrs	r7, r7, #1
    8ec8:	e1a06066 	rrx	r6, r6
    8ecc:	ea000007 	b	8ef0 <__udivdi3+0xc4>
    8ed0:	e0544006 	subs	r4, r4, r6
    8ed4:	e0c55007 	sbc	r5, r5, r7
    8ed8:	e0944004 	adds	r4, r4, r4
    8edc:	e0a55005 	adc	r5, r5, r5
    8ee0:	e2944001 	adds	r4, r4, #1
    8ee4:	e2a55000 	adc	r5, r5, #0
    8ee8:	e2533001 	subs	r3, r3, #1
    8eec:	0a000006 	beq	8f0c <__udivdi3+0xe0>
    8ef0:	e1570005 	cmp	r7, r5
    8ef4:	01560004 	cmpeq	r6, r4
    8ef8:	9afffff4 	bls	8ed0 <__udivdi3+0xa4>
    8efc:	e0944004 	adds	r4, r4, r4
    8f00:	e0a55005 	adc	r5, r5, r5
    8f04:	e2533001 	subs	r3, r3, #1
    8f08:	1afffff8 	bne	8ef0 <__udivdi3+0xc4>
    8f0c:	e0948000 	adds	r8, r4, r0
    8f10:	e0a59001 	adc	r9, r5, r1
    8f14:	e1a03234 	lsr	r3, r4, r2
    8f18:	e2621020 	rsb	r1, r2, #32
    8f1c:	e2420020 	sub	r0, r2, #32
    8f20:	e1833115 	orr	r3, r3, r5, lsl r1
    8f24:	e1a0c235 	lsr	ip, r5, r2
    8f28:	e1833035 	orr	r3, r3, r5, lsr r0
    8f2c:	e1a0721c 	lsl	r7, ip, r2
    8f30:	e1877013 	orr	r7, r7, r3, lsl r0
    8f34:	e1a06213 	lsl	r6, r3, r2
    8f38:	e1877133 	orr	r7, r7, r3, lsr r1
    8f3c:	e0580006 	subs	r0, r8, r6
    8f40:	e0c91007 	sbc	r1, r9, r7
    8f44:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8f48:	e12fff1e 	bx	lr

00008f4c <__clzdi2>:
    8f4c:	e92d4010 	push	{r4, lr}
    8f50:	e3510000 	cmp	r1, #0
    8f54:	1a000002 	bne	8f64 <__clzdi2+0x18>
    8f58:	eb000005 	bl	8f74 <__clzsi2>
    8f5c:	e2800020 	add	r0, r0, #32
    8f60:	ea000001 	b	8f6c <__clzdi2+0x20>
    8f64:	e1a00001 	mov	r0, r1
    8f68:	eb000001 	bl	8f74 <__clzsi2>
    8f6c:	e8bd4010 	pop	{r4, lr}
    8f70:	e12fff1e 	bx	lr

00008f74 <__clzsi2>:
    8f74:	e3a0101c 	mov	r1, #28
    8f78:	e3500801 	cmp	r0, #65536	; 0x10000
    8f7c:	21a00820 	lsrcs	r0, r0, #16
    8f80:	22411010 	subcs	r1, r1, #16
    8f84:	e3500c01 	cmp	r0, #256	; 0x100
    8f88:	21a00420 	lsrcs	r0, r0, #8
    8f8c:	22411008 	subcs	r1, r1, #8
    8f90:	e3500010 	cmp	r0, #16
    8f94:	21a00220 	lsrcs	r0, r0, #4
    8f98:	22411004 	subcs	r1, r1, #4
    8f9c:	e28f2008 	add	r2, pc, #8
    8fa0:	e7d20000 	ldrb	r0, [r2, r0]
    8fa4:	e0800001 	add	r0, r0, r1
    8fa8:	e12fff1e 	bx	lr
    8fac:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    8fb0:	01010101 	tsteq	r1, r1, lsl #2
=======
    8b14:	e28db000 	add	fp, sp, #0
    8b18:	e24dd00c 	sub	sp, sp, #12
    8b1c:	e50b0008 	str	r0, [fp, #-8]
    8b20:	e50b100c 	str	r1, [fp, #-12]
    8b24:	e51b200c 	ldr	r2, [fp, #-12]
    8b28:	e1a03002 	mov	r3, r2
    8b2c:	e1a03103 	lsl	r3, r3, #2
    8b30:	e0833002 	add	r3, r3, r2
    8b34:	e1a02103 	lsl	r2, r3, #2
    8b38:	e0832002 	add	r2, r3, r2
    8b3c:	e51b3008 	ldr	r3, [fp, #-8]
    8b40:	e0823003 	add	r3, r2, r3
    8b44:	e1a00003 	mov	r0, r3
    8b48:	e24bd000 	sub	sp, fp, #0
    8b4c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b50:	e12fff1e 	bx	lr

00008b54 <optimize_me>:
    8b54:	e92d4870 	push	{r4, r5, r6, fp, lr}
    8b58:	e28db010 	add	fp, sp, #16
    8b5c:	e24dd01c 	sub	sp, sp, #28
    8b60:	e50b0028 	str	r0, [fp, #-40]	; 0x28
    8b64:	e3a03000 	mov	r3, #0
    8b68:	e50b3018 	str	r3, [fp, #-24]
    8b6c:	ea000037 	b	8c50 <optimize_me+0xfc>
    8b70:	e3a03011 	mov	r3, #17
    8b74:	e50b3020 	str	r3, [fp, #-32]
    8b78:	e3a03000 	mov	r3, #0
    8b7c:	e50b301c 	str	r3, [fp, #-28]
    8b80:	ea00002c 	b	8c38 <optimize_me+0xe4>
    8b84:	e3a03002 	mov	r3, #2
    8b88:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8b8c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8b90:	e2833001 	add	r3, r3, #1
    8b94:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8b98:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8b9c:	e2432002 	sub	r2, r3, #2
    8ba0:	e1a03002 	mov	r3, r2
    8ba4:	e1a03083 	lsl	r3, r3, #1
    8ba8:	e0833002 	add	r3, r3, r2
    8bac:	e50b3024 	str	r3, [fp, #-36]	; 0x24
    8bb0:	e51b301c 	ldr	r3, [fp, #-28]
    8bb4:	e1a03103 	lsl	r3, r3, #2
    8bb8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bbc:	e0824003 	add	r4, r2, r3
    8bc0:	e51b301c 	ldr	r3, [fp, #-28]
    8bc4:	e1a03103 	lsl	r3, r3, #2
    8bc8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bcc:	e0823003 	add	r3, r2, r3
    8bd0:	e5933000 	ldr	r3, [r3]
    8bd4:	e51b2020 	ldr	r2, [fp, #-32]
    8bd8:	e0030392 	mul	r3, r2, r3
    8bdc:	e2835010 	add	r5, r3, #16
    8be0:	e51b3018 	ldr	r3, [fp, #-24]
    8be4:	e1a03103 	lsl	r3, r3, #2
    8be8:	e51b2028 	ldr	r2, [fp, #-40]	; 0x28
    8bec:	e0823003 	add	r3, r2, r3
    8bf0:	e5936000 	ldr	r6, [r3]
    8bf4:	e51b0018 	ldr	r0, [fp, #-24]
    8bf8:	e51b101c 	ldr	r1, [fp, #-28]
    8bfc:	ebffffc3 	bl	8b10 <func>
    8c00:	e1a03000 	mov	r3, r0
    8c04:	e0030396 	mul	r3, r6, r3
    8c08:	e0852003 	add	r2, r5, r3
    8c0c:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
    8c10:	e0823003 	add	r3, r2, r3
    8c14:	e283200f 	add	r2, r3, #15
    8c18:	e3530000 	cmp	r3, #0
    8c1c:	b1a03002 	movlt	r3, r2
    8c20:	a1a03003 	movge	r3, r3
    8c24:	e1a03243 	asr	r3, r3, #4
    8c28:	e5843000 	str	r3, [r4]
    8c2c:	e51b301c 	ldr	r3, [fp, #-28]
    8c30:	e2833001 	add	r3, r3, #1
    8c34:	e50b301c 	str	r3, [fp, #-28]
    8c38:	e51b301c 	ldr	r3, [fp, #-28]
    8c3c:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8c40:	baffffcf 	blt	8b84 <optimize_me+0x30>
    8c44:	e51b3018 	ldr	r3, [fp, #-24]
    8c48:	e2833001 	add	r3, r3, #1
    8c4c:	e50b3018 	str	r3, [fp, #-24]
    8c50:	e51b3018 	ldr	r3, [fp, #-24]
    8c54:	e3530f7d 	cmp	r3, #500	; 0x1f4
    8c58:	baffffc4 	blt	8b70 <optimize_me+0x1c>
    8c5c:	e24bd010 	sub	sp, fp, #16
    8c60:	e8bd4870 	pop	{r4, r5, r6, fp, lr}
    8c64:	e12fff1e 	bx	lr

00008c68 <__aeabi_uldivmod>:
    8c68:	e3530000 	cmp	r3, #0
    8c6c:	03520000 	cmpeq	r2, #0
    8c70:	1a000004 	bne	8c88 <__aeabi_uldivmod+0x20>
    8c74:	e3510000 	cmp	r1, #0
    8c78:	03500000 	cmpeq	r0, #0
    8c7c:	13e01000 	mvnne	r1, #0
    8c80:	13e00000 	mvnne	r0, #0
    8c84:	ea000027 	b	8d28 <__aeabi_idiv0>
    8c88:	e24dd008 	sub	sp, sp, #8
    8c8c:	e92d6000 	push	{sp, lr}
    8c90:	eb000014 	bl	8ce8 <__gnu_uldivmod_helper>
    8c94:	e59de004 	ldr	lr, [sp, #4]
    8c98:	e28dd008 	add	sp, sp, #8
    8c9c:	e8bd000c 	pop	{r2, r3}
    8ca0:	e12fff1e 	bx	lr

00008ca4 <__gnu_ldivmod_helper>:
    8ca4:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8ca8:	e59d6020 	ldr	r6, [sp, #32]
    8cac:	e1a07002 	mov	r7, r2
    8cb0:	e1a0a003 	mov	sl, r3
    8cb4:	e1a04000 	mov	r4, r0
    8cb8:	e1a05001 	mov	r5, r1
    8cbc:	eb00001a 	bl	8d2c <__divdi3>
    8cc0:	e1a03000 	mov	r3, r0
    8cc4:	e0020197 	mul	r2, r7, r1
    8cc8:	e0898097 	umull	r8, r9, r7, r0
    8ccc:	e023239a 	mla	r3, sl, r3, r2
    8cd0:	e0544008 	subs	r4, r4, r8
    8cd4:	e0839009 	add	r9, r3, r9
    8cd8:	e0c55009 	sbc	r5, r5, r9
    8cdc:	e8860030 	stm	r6, {r4, r5}
    8ce0:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8ce4:	e12fff1e 	bx	lr

00008ce8 <__gnu_uldivmod_helper>:
    8ce8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    8cec:	e59d5018 	ldr	r5, [sp, #24]
    8cf0:	e1a04002 	mov	r4, r2
    8cf4:	e1a08003 	mov	r8, r3
    8cf8:	e1a06000 	mov	r6, r0
    8cfc:	e1a07001 	mov	r7, r1
    8d00:	eb000067 	bl	8ea4 <__udivdi3>
    8d04:	e0080890 	mul	r8, r0, r8
    8d08:	e0832490 	umull	r2, r3, r0, r4
    8d0c:	e0248491 	mla	r4, r1, r4, r8
    8d10:	e0566002 	subs	r6, r6, r2
    8d14:	e0843003 	add	r3, r4, r3
    8d18:	e0c77003 	sbc	r7, r7, r3
    8d1c:	e88500c0 	stm	r5, {r6, r7}
    8d20:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    8d24:	e12fff1e 	bx	lr

00008d28 <__aeabi_idiv0>:
    8d28:	e12fff1e 	bx	lr

00008d2c <__divdi3>:
    8d2c:	e3510000 	cmp	r1, #0
    8d30:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8d34:	a1a04000 	movge	r4, r0
    8d38:	a1a05001 	movge	r5, r1
    8d3c:	a3a0a000 	movge	sl, #0
    8d40:	ba000053 	blt	8e94 <__divdi3+0x168>
    8d44:	e3530000 	cmp	r3, #0
    8d48:	a1a08002 	movge	r8, r2
    8d4c:	a1a09003 	movge	r9, r3
    8d50:	ba00004b 	blt	8e84 <__divdi3+0x158>
    8d54:	e1550009 	cmp	r5, r9
    8d58:	01540008 	cmpeq	r4, r8
    8d5c:	33a02000 	movcc	r2, #0
    8d60:	33a03000 	movcc	r3, #0
    8d64:	3a00003b 	bcc	8e58 <__divdi3+0x12c>
    8d68:	e1a01009 	mov	r1, r9
    8d6c:	e1a00008 	mov	r0, r8
    8d70:	eb000093 	bl	8fc4 <__clzdi2>
    8d74:	e1a01005 	mov	r1, r5
    8d78:	e1a0b000 	mov	fp, r0
    8d7c:	e1a00004 	mov	r0, r4
    8d80:	eb00008f 	bl	8fc4 <__clzdi2>
    8d84:	e060000b 	rsb	r0, r0, fp
    8d88:	e240e020 	sub	lr, r0, #32
    8d8c:	e1a07019 	lsl	r7, r9, r0
    8d90:	e1877e18 	orr	r7, r7, r8, lsl lr
    8d94:	e260c020 	rsb	ip, r0, #32
    8d98:	e1877c38 	orr	r7, r7, r8, lsr ip
    8d9c:	e1550007 	cmp	r5, r7
    8da0:	e1a06018 	lsl	r6, r8, r0
    8da4:	01540006 	cmpeq	r4, r6
    8da8:	e1a01000 	mov	r1, r0
    8dac:	33a02000 	movcc	r2, #0
    8db0:	33a03000 	movcc	r3, #0
    8db4:	3a000005 	bcc	8dd0 <__divdi3+0xa4>
    8db8:	e3a08001 	mov	r8, #1
    8dbc:	e0544006 	subs	r4, r4, r6
    8dc0:	e1a03e18 	lsl	r3, r8, lr
    8dc4:	e1833c38 	orr	r3, r3, r8, lsr ip
    8dc8:	e0c55007 	sbc	r5, r5, r7
    8dcc:	e1a02018 	lsl	r2, r8, r0
    8dd0:	e3500000 	cmp	r0, #0
    8dd4:	0a00001f 	beq	8e58 <__divdi3+0x12c>
    8dd8:	e1b070a7 	lsrs	r7, r7, #1
    8ddc:	e1a06066 	rrx	r6, r6
    8de0:	ea000007 	b	8e04 <__divdi3+0xd8>
    8de4:	e0544006 	subs	r4, r4, r6
    8de8:	e0c55007 	sbc	r5, r5, r7
    8dec:	e0944004 	adds	r4, r4, r4
    8df0:	e0a55005 	adc	r5, r5, r5
    8df4:	e2944001 	adds	r4, r4, #1
    8df8:	e2a55000 	adc	r5, r5, #0
    8dfc:	e2500001 	subs	r0, r0, #1
    8e00:	0a000006 	beq	8e20 <__divdi3+0xf4>
    8e04:	e1570005 	cmp	r7, r5
    8e08:	01560004 	cmpeq	r6, r4
    8e0c:	9afffff4 	bls	8de4 <__divdi3+0xb8>
    8e10:	e0944004 	adds	r4, r4, r4
    8e14:	e0a55005 	adc	r5, r5, r5
    8e18:	e2500001 	subs	r0, r0, #1
    8e1c:	1afffff8 	bne	8e04 <__divdi3+0xd8>
    8e20:	e261c020 	rsb	ip, r1, #32
    8e24:	e1a00134 	lsr	r0, r4, r1
    8e28:	e0922004 	adds	r2, r2, r4
    8e2c:	e241e020 	sub	lr, r1, #32
    8e30:	e1800c15 	orr	r0, r0, r5, lsl ip
    8e34:	e1a04135 	lsr	r4, r5, r1
    8e38:	e1800e35 	orr	r0, r0, r5, lsr lr
    8e3c:	e1a07114 	lsl	r7, r4, r1
    8e40:	e1877e10 	orr	r7, r7, r0, lsl lr
    8e44:	e1a06110 	lsl	r6, r0, r1
    8e48:	e0a33005 	adc	r3, r3, r5
    8e4c:	e1877c30 	orr	r7, r7, r0, lsr ip
    8e50:	e0522006 	subs	r2, r2, r6
    8e54:	e0c33007 	sbc	r3, r3, r7
    8e58:	e29a0000 	adds	r0, sl, #0
    8e5c:	13a00001 	movne	r0, #1
    8e60:	e3a01000 	mov	r1, #0
    8e64:	e2704000 	rsbs	r4, r0, #0
    8e68:	e2e15000 	rsc	r5, r1, #0
    8e6c:	e0222004 	eor	r2, r2, r4
    8e70:	e0233005 	eor	r3, r3, r5
    8e74:	e0900002 	adds	r0, r0, r2
    8e78:	e0a11003 	adc	r1, r1, r3
    8e7c:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8e80:	e12fff1e 	bx	lr
    8e84:	e2728000 	rsbs	r8, r2, #0
    8e88:	e1e0a00a 	mvn	sl, sl
    8e8c:	e2e39000 	rsc	r9, r3, #0
    8e90:	eaffffaf 	b	8d54 <__divdi3+0x28>
    8e94:	e2704000 	rsbs	r4, r0, #0
    8e98:	e2e15000 	rsc	r5, r1, #0
    8e9c:	e3e0a000 	mvn	sl, #0
    8ea0:	eaffffa7 	b	8d44 <__divdi3+0x18>

00008ea4 <__udivdi3>:
    8ea4:	e1510003 	cmp	r1, r3
    8ea8:	01500002 	cmpeq	r0, r2
    8eac:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    8eb0:	e1a04000 	mov	r4, r0
    8eb4:	e1a05001 	mov	r5, r1
    8eb8:	e1a08002 	mov	r8, r2
    8ebc:	e1a09003 	mov	r9, r3
    8ec0:	33a00000 	movcc	r0, #0
    8ec4:	33a01000 	movcc	r1, #0
    8ec8:	3a00003b 	bcc	8fbc <__udivdi3+0x118>
    8ecc:	e1a01003 	mov	r1, r3
    8ed0:	e1a00002 	mov	r0, r2
    8ed4:	eb00003a 	bl	8fc4 <__clzdi2>
    8ed8:	e1a01005 	mov	r1, r5
    8edc:	e1a0a000 	mov	sl, r0
    8ee0:	e1a00004 	mov	r0, r4
    8ee4:	eb000036 	bl	8fc4 <__clzdi2>
    8ee8:	e060300a 	rsb	r3, r0, sl
    8eec:	e243e020 	sub	lr, r3, #32
    8ef0:	e1a07319 	lsl	r7, r9, r3
    8ef4:	e1877e18 	orr	r7, r7, r8, lsl lr
    8ef8:	e263c020 	rsb	ip, r3, #32
    8efc:	e1877c38 	orr	r7, r7, r8, lsr ip
    8f00:	e1550007 	cmp	r5, r7
    8f04:	e1a06318 	lsl	r6, r8, r3
    8f08:	01540006 	cmpeq	r4, r6
    8f0c:	e1a02003 	mov	r2, r3
    8f10:	33a00000 	movcc	r0, #0
    8f14:	33a01000 	movcc	r1, #0
    8f18:	3a000005 	bcc	8f34 <__udivdi3+0x90>
    8f1c:	e3a08001 	mov	r8, #1
    8f20:	e0544006 	subs	r4, r4, r6
    8f24:	e1a01e18 	lsl	r1, r8, lr
    8f28:	e1811c38 	orr	r1, r1, r8, lsr ip
    8f2c:	e0c55007 	sbc	r5, r5, r7
    8f30:	e1a00318 	lsl	r0, r8, r3
    8f34:	e3530000 	cmp	r3, #0
    8f38:	0a00001f 	beq	8fbc <__udivdi3+0x118>
    8f3c:	e1b070a7 	lsrs	r7, r7, #1
    8f40:	e1a06066 	rrx	r6, r6
    8f44:	ea000007 	b	8f68 <__udivdi3+0xc4>
    8f48:	e0544006 	subs	r4, r4, r6
    8f4c:	e0c55007 	sbc	r5, r5, r7
    8f50:	e0944004 	adds	r4, r4, r4
    8f54:	e0a55005 	adc	r5, r5, r5
    8f58:	e2944001 	adds	r4, r4, #1
    8f5c:	e2a55000 	adc	r5, r5, #0
    8f60:	e2533001 	subs	r3, r3, #1
    8f64:	0a000006 	beq	8f84 <__udivdi3+0xe0>
    8f68:	e1570005 	cmp	r7, r5
    8f6c:	01560004 	cmpeq	r6, r4
    8f70:	9afffff4 	bls	8f48 <__udivdi3+0xa4>
    8f74:	e0944004 	adds	r4, r4, r4
    8f78:	e0a55005 	adc	r5, r5, r5
    8f7c:	e2533001 	subs	r3, r3, #1
    8f80:	1afffff8 	bne	8f68 <__udivdi3+0xc4>
    8f84:	e0948000 	adds	r8, r4, r0
    8f88:	e0a59001 	adc	r9, r5, r1
    8f8c:	e1a03234 	lsr	r3, r4, r2
    8f90:	e2621020 	rsb	r1, r2, #32
    8f94:	e2420020 	sub	r0, r2, #32
    8f98:	e1833115 	orr	r3, r3, r5, lsl r1
    8f9c:	e1a0c235 	lsr	ip, r5, r2
    8fa0:	e1833035 	orr	r3, r3, r5, lsr r0
    8fa4:	e1a0721c 	lsl	r7, ip, r2
    8fa8:	e1877013 	orr	r7, r7, r3, lsl r0
    8fac:	e1a06213 	lsl	r6, r3, r2
    8fb0:	e1877133 	orr	r7, r7, r3, lsr r1
    8fb4:	e0580006 	subs	r0, r8, r6
    8fb8:	e0c91007 	sbc	r1, r9, r7
    8fbc:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    8fc0:	e12fff1e 	bx	lr

00008fc4 <__clzdi2>:
    8fc4:	e92d4010 	push	{r4, lr}
    8fc8:	e3510000 	cmp	r1, #0
    8fcc:	1a000002 	bne	8fdc <__clzdi2+0x18>
    8fd0:	eb000005 	bl	8fec <__clzsi2>
    8fd4:	e2800020 	add	r0, r0, #32
    8fd8:	ea000001 	b	8fe4 <__clzdi2+0x20>
    8fdc:	e1a00001 	mov	r0, r1
    8fe0:	eb000001 	bl	8fec <__clzsi2>
    8fe4:	e8bd4010 	pop	{r4, lr}
    8fe8:	e12fff1e 	bx	lr

00008fec <__clzsi2>:
    8fec:	e3a0101c 	mov	r1, #28
    8ff0:	e3500801 	cmp	r0, #65536	; 0x10000
    8ff4:	21a00820 	lsrcs	r0, r0, #16
    8ff8:	22411010 	subcs	r1, r1, #16
    8ffc:	e3500c01 	cmp	r0, #256	; 0x100
    9000:	21a00420 	lsrcs	r0, r0, #8
    9004:	22411008 	subcs	r1, r1, #8
    9008:	e3500010 	cmp	r0, #16
    900c:	21a00220 	lsrcs	r0, r0, #4
    9010:	22411004 	subcs	r1, r1, #4
    9014:	e28f2008 	add	r2, pc, #8
    9018:	e7d20000 	ldrb	r0, [r2, r0]
    901c:	e0800001 	add	r0, r0, r1
    9020:	e12fff1e 	bx	lr
    9024:	02020304 	andeq	r0, r2, #4, 6	; 0x10000000
    9028:	01010101 	tsteq	r1, r1, lsl #2
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
	...

Disassembly of section .rodata:

<<<<<<< HEAD
00009000 <__rodata_start>:
    9000:	2b2b2b2b 	blcs	ad3cb4 <__user_program+0x7d3cb4>
    9004:	4f2b2b2b 	svcmi	0x002b2b2b
    9008:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
    900c:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
    9010:	6e754620 	cdpvs	6, 7, cr4, cr5, cr0, {1}
    9014:	6f697463 	svcvs	0x00697463
    9018:	2b2b2b6e 	blcs	ad3dd8 <__user_program+0x7d3dd8>
    901c:	2b2b2b2b 	blcs	ad3cd0 <__user_program+0x7d3cd0>
    9020:	0000000a 	andeq	r0, r0, sl

00009024 <.LC1>:
    9024:	000a6425 	andeq	r6, sl, r5, lsr #8

00009028 <.LC2>:
    9028:	2b2b2b2b 	blcs	ad3cdc <__user_program+0x7d3cdc>
    902c:	552b2b2b 	strpl	r2, [fp, #-2859]!	; 0xb2b
    9030:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
    9034:	7a696d69 	bvc	1a645e0 <__user_program+0x17645e0>
    9038:	46206465 	strtmi	r6, [r0], -r5, ror #8
    903c:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xe75
    9040:	2b6e6f69 	blcs	1ba4dec <__user_program+0x18a4dec>
    9044:	2b2b2b2b 	blcs	ad3cf8 <__user_program+0x7d3cf8>
    9048:	000a2b2b 	andeq	r2, sl, fp, lsr #22

0000904c <.LC3>:
    904c:	64253a54 	strtvs	r3, [r5], #-2644	; 0xa54
    9050:	0000000a 	andeq	r0, r0, sl

00009054 <.LC4>:
    9054:	2b2b2b2b 	blcs	ad3d08 <__user_program+0x7d3d08>
    9058:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    905c:	20747365 	rsbscs	r7, r4, r5, ror #6
    9060:	6c696146 	stfvse	f6, [r9], #-280	; 0xfffffee8
    9064:	2b2b6465 	blcs	ae2200 <__user_program+0x7e2200>
    9068:	2b2b2b2b 	blcs	ad3d1c <__user_program+0x7d3d1c>
    906c:	00000a2b 	andeq	r0, r0, fp, lsr #20

00009070 <.LC5>:
    9070:	2b2b2b2b 	blcs	ad3d24 <__user_program+0x7d3d24>
    9074:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    9078:	20747365 	rsbscs	r7, r4, r5, ror #6
    907c:	73736150 	cmnvc	r3, #80, 2
    9080:	2b2b6465 	blcs	ae221c <__user_program+0x7e221c>
    9084:	2b2b2b2b 	blcs	ad3d38 <__user_program+0x7d3d38>
    9088:	00000a2b 	andeq	r0, r0, fp, lsr #20

0000908c <.LC0>:
    908c:	00000030 	andeq	r0, r0, r0, lsr r0

00009090 <.LC1>:
    9090:	Address 0x00009090 is out of bounds.
=======
0000a000 <__rodata_start>:
    a000:	2b2b2b2b 	blcs	ad4cb4 <__user_program+0x7d4cb4>
    a004:	4f2b2b2b 	svcmi	0x002b2b2b
    a008:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
    a00c:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
    a010:	6e754620 	cdpvs	6, 7, cr4, cr5, cr0, {1}
    a014:	6f697463 	svcvs	0x00697463
    a018:	2b2b2b6e 	blcs	ad4dd8 <__user_program+0x7d4dd8>
    a01c:	2b2b2b2b 	blcs	ad4cd0 <__user_program+0x7d4cd0>
    a020:	0000000a 	andeq	r0, r0, sl

0000a024 <.LC1>:
    a024:	000a6425 	andeq	r6, sl, r5, lsr #8

0000a028 <.LC2>:
    a028:	2b2b2b2b 	blcs	ad4cdc <__user_program+0x7d4cdc>
    a02c:	552b2b2b 	strpl	r2, [fp, #-2859]!	; 0xb2b
    a030:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
    a034:	7a696d69 	bvc	1a655e0 <__user_program+0x17655e0>
    a038:	46206465 	strtmi	r6, [r0], -r5, ror #8
    a03c:	74636e75 	strbtvc	r6, [r3], #-3701	; 0xe75
    a040:	2b6e6f69 	blcs	1ba5dec <__user_program+0x18a5dec>
    a044:	2b2b2b2b 	blcs	ad4cf8 <__user_program+0x7d4cf8>
    a048:	000a2b2b 	andeq	r2, sl, fp, lsr #22

0000a04c <.LC3>:
    a04c:	2b2b2b2b 	blcs	ad4d00 <__user_program+0x7d4d00>
    a050:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    a054:	20747365 	rsbscs	r7, r4, r5, ror #6
    a058:	6c696146 	stfvse	f6, [r9], #-280	; 0xfffffee8
    a05c:	2b2b6465 	blcs	ae31f8 <__user_program+0x7e31f8>
    a060:	2b2b2b2b 	blcs	ad4d14 <__user_program+0x7d4d14>
    a064:	00000a2b 	andeq	r0, r0, fp, lsr #20

0000a068 <.LC4>:
    a068:	2b2b2b2b 	blcs	ad4d1c <__user_program+0x7d4d1c>
    a06c:	542b2b2b 	strtpl	r2, [fp], #-2859	; 0xb2b
    a070:	20747365 	rsbscs	r7, r4, r5, ror #6
    a074:	73736150 	cmnvc	r3, #80, 2
    a078:	2b2b6465 	blcs	ae3214 <__user_program+0x7e3214>
    a07c:	2b2b2b2b 	blcs	ad4d30 <__user_program+0x7d4d30>
    a080:	00000a2b 	andeq	r0, r0, fp, lsr #20

0000a084 <.LC0>:
    a084:	00000030 	andeq	r0, r0, r0, lsr r0

0000a088 <.LC1>:
    a088:	Address 0x0000a088 is out of bounds.
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8


Disassembly of section .ARM.exidx:

<<<<<<< HEAD
00009094 <.ARM.exidx>:
    9094:	7ffffc20 	svcvc	0x00fffc20
    9098:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000a000 <__data_start>:
    a000:	33323130 	teqcc	r2, #48, 2
    a004:	37363534 			; <UNDEFINED> instruction: 0x37363534
    a008:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    a00c:	66656463 	strbtvs	r6, [r5], -r3, ror #8
    a010:	00000000 	andeq	r0, r0, r0

0000a014 <aux_mu_baud>:
    a014:	3f215068 	svccc	0x00215068

0000a018 <auxenb>:
    a018:	3f215004 	svccc	0x00215004

0000a01c <aux_mu_ier_reg>:
    a01c:	3f215044 	svccc	0x00215044

0000a020 <aux_mu_iir_reg>:
    a020:	3f215048 	svccc	0x00215048

0000a024 <aux_mu_lcr_reg>:
    a024:	3f21504c 	svccc	0x0021504c

0000a028 <aux_mu_io_reg>:
    a028:	3f215040 	svccc	0x00215040

0000a02c <aux_mu_cntl_reg>:
    a02c:	3f215060 	svccc	0x00215060

0000a030 <aux_mu_lsr_reg>:
    a030:	3f215054 	svccc	0x00215054

0000a034 <timer_load>:
    a034:	3f00b400 	svccc	0x0000b400

0000a038 <timer_value>:
    a038:	3f00b404 	svccc	0x0000b404

0000a03c <timer_control>:
    a03c:	3f00b408 	svccc	0x0000b408

0000a040 <timer_irq_clear>:
    a040:	3f00b40c 	svccc	0x0000b40c

0000a044 <timer_reload>:
    a044:	3f00b418 	svccc	0x0000b418

0000a048 <timer_predivider>:
    a048:	3f00b41c 	svccc	0x0000b41c

Disassembly of section .bss:

0000b000 <__bss_start>:
	...

0000b7d0 <array1>:
=======
0000a08c <.ARM.exidx>:
    a08c:	7fffeca0 	svcvc	0x00ffeca0
    a090:	00000001 	andeq	r0, r0, r1

Disassembly of section .data:

0000b000 <__data_start>:
    b000:	3f200000 	svccc	0x00200000

0000b004 <digits>:
    b004:	33323130 	teqcc	r2, #48, 2
    b008:	37363534 			; <UNDEFINED> instruction: 0x37363534
    b00c:	62613938 	rsbvs	r3, r1, #56, 18	; 0xe0000
    b010:	66656463 	strbtvs	r6, [r5], -r3, ror #8
	...

Disassembly of section .bss:

0000c000 <__bss_start>:
	...

0000c7d0 <array1>:
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
<<<<<<< HEAD
   0:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	0000004a 	andeq	r0, r0, sl, asr #32
  10:	00014501 	andeq	r4, r1, r1, lsl #10
  14:	00010800 	andeq	r0, r1, r0, lsl #16
  18:	00805400 	addeq	r5, r0, r0, lsl #8
  1c:	00016000 	andeq	r6, r1, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	08010200 	stmdaeq	r1, {r9}
  28:	000000d1 	ldrdeq	r0, [r0], -r1
  2c:	da080102 	ble	20043c <__end+0xd343c>
  30:	02000000 	andeq	r0, r0, #0
  34:	01340502 	teqeq	r4, r2, lsl #10
  38:	04030000 	streq	r0, [r3], #-0
  3c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
  40:	05080200 	streq	r0, [r8, #-512]	; 0x200
  44:	00000000 	andeq	r0, r0, r0
  48:	0000c904 	andeq	ip, r0, r4, lsl #18
  4c:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
  50:	02000000 	andeq	r0, r0, #0
  54:	00f50702 	rscseq	r0, r5, r2, lsl #14
  58:	df040000 	svcle	0x00040000
  5c:	02000000 	andeq	r0, r0, #0
  60:	0000651a 	andeq	r6, r0, sl, lsl r5
  64:	07040200 	streq	r0, [r4, -r0, lsl #4]
  68:	00000034 	andeq	r0, r0, r4, lsr r0
  6c:	2a070802 	bcs	1c207c <__end+0x9507c>
  70:	05000000 	streq	r0, [r0, #-0]
  74:	00000128 	andeq	r0, r0, r8, lsr #2
  78:	80545401 	subshi	r5, r4, r1, lsl #8
  7c:	00540000 	subseq	r0, r4, r0
  80:	9c010000 	stcls	0, cr0, [r1], {-0}
  84:	000000d2 	ldrdeq	r0, [r0], -r2
  88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  8c:	48540100 	ldmdami	r4, {r8}^
  90:	00000000 	andeq	r0, r0, r0
  94:	07000000 	streq	r0, [r0, -r0]
  98:	006e7566 	rsbeq	r7, lr, r6, ror #10
  9c:	00485401 	subeq	r5, r8, r1, lsl #8
  a0:	51010000 	mrspl	r0, (UNDEF: 1)
  a4:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
  a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
  ac:	21000000 	mrscs	r0, (UNDEF: 0)
  b0:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
  b4:	0000012d 	andeq	r0, r0, sp, lsr #2
  b8:	005a5b01 	subseq	r5, sl, r1, lsl #22
  bc:	005a0000 	subseq	r0, sl, r0
  c0:	3e090000 	cdpcc	0, 0, cr0, cr9, cr0, {0}
  c4:	01000001 	tsteq	r0, r1
  c8:	00005a5d 	andeq	r5, r0, sp, asr sl
  cc:	00007800 	andeq	r7, r0, r0, lsl #16
  d0:	21050000 	mrscs	r0, (UNDEF: 5)
  d4:	01000000 	mrseq	r0, (UNDEF: 0)
  d8:	0080a864 	addeq	sl, r0, r4, ror #16
  dc:	00004400 	andeq	r4, r0, r0, lsl #8
  e0:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
  e4:	06000000 	streq	r0, [r0], -r0
  e8:	006e6970 	rsbeq	r6, lr, r0, ror r9
  ec:	00486401 	subeq	r6, r8, r1, lsl #8
  f0:	008b0000 	addeq	r0, fp, r0
  f4:	05000000 	streq	r0, [r0, #-0]
  f8:	00000041 	andeq	r0, r0, r1, asr #32
  fc:	80ec7001 	rschi	r7, ip, r1
 100:	00440000 	subeq	r0, r4, r0
 104:	9c010000 	stcls	0, cr0, [r1], {-0}
 108:	0000011c 	andeq	r0, r0, ip, lsl r1
 10c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 110:	48700100 	ldmdami	r0!, {r8}^
 114:	c5000000 	strgt	r0, [r0, #-0]
 118:	00000000 	andeq	r0, r0, r0
 11c:	00000e05 	andeq	r0, r0, r5, lsl #28
 120:	307c0100 	rsbscc	r0, ip, r0, lsl #2
 124:	84000081 	strhi	r0, [r0], #-129	; 0x81
 128:	01000000 	mrseq	r0, (UNDEF: 0)
 12c:	0001889c 	muleq	r1, ip, r8
 130:	69700600 	ldmdbvs	r0!, {r9, sl}^
 134:	7c01006e 	stcvc	0, cr0, [r1], {110}	; 0x6e
 138:	00000048 	andeq	r0, r0, r8, asr #32
 13c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 140:	0001220a 	andeq	r2, r1, sl, lsl #4
 144:	487c0100 	ldmdami	ip!, {r8}^
 148:	20000000 	andcs	r0, r0, r0
 14c:	0b000001 	bleq	158 <__start-0x7ea8>
 150:	00008158 	andeq	r8, r0, r8, asr r1
 154:	000001a7 	andeq	r0, r0, r7, lsr #3
 158:	00000163 	andeq	r0, r0, r3, ror #2
 15c:	0250010c 	subseq	r0, r0, #12, 2
 160:	0b009608 	bleq	25988 <__bss_end+0x19988>
 164:	00008180 	andeq	r8, r0, r0, lsl #3
 168:	000001a7 	andeq	r0, r0, r7, lsr #3
 16c:	00000177 	andeq	r0, r0, r7, ror r1
 170:	0250010c 	subseq	r0, r0, #12, 2
 174:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
 178:	000081a8 	andeq	r8, r0, r8, lsr #3
 17c:	000001a7 	andeq	r0, r0, r7, lsr #3
 180:	0250010c 	subseq	r0, r0, #12, 2
 184:	00009608 	andeq	r9, r0, r8, lsl #12
 188:	00001c0e 	andeq	r1, r0, lr, lsl #24
 18c:	97510100 	ldrbls	r0, [r1, -r0, lsl #2]
 190:	00000001 	andeq	r0, r0, r1
 194:	0f3f2000 	svceq	0x003f2000
 198:	0000019c 	muleq	r0, ip, r1
 19c:	01a20410 			; <UNDEFINED> instruction: 0x01a20410
 1a0:	5a110000 	bpl	4401a8 <__user_program+0x1401a8>
 1a4:	12000000 	andne	r0, r0, #0
 1a8:	000000e8 	andeq	r0, r0, r8, ror #1
 1ac:	5a131903 	bpl	4c65c0 <__user_program+0x1c65c0>
 1b0:	00000000 	andeq	r0, r0, r0
 1b4:	0000dd00 	andeq	sp, r0, r0, lsl #26
 1b8:	fe000400 	cdp2	4, 0, cr0, cr0, cr0, {0}
 1bc:	04000000 	streq	r0, [r0], #-0
 1c0:	00019e01 	andeq	r9, r1, r1, lsl #28
 1c4:	015f0100 	cmpeq	pc, r0, lsl #2
 1c8:	01080000 	mrseq	r0, (UNDEF: 8)
 1cc:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 1d0:	01580000 	cmpeq	r8, r0
 1d4:	00860000 	addeq	r0, r6, r0
 1d8:	01020000 	mrseq	r0, (UNDEF: 2)
 1dc:	0000da08 	andeq	sp, r0, r8, lsl #20
 1e0:	05020200 	streq	r0, [r2, #-512]	; 0x200
 1e4:	00000134 	andeq	r0, r0, r4, lsr r1
 1e8:	69050403 	stmdbvs	r5, {r0, r1, sl}
 1ec:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 1f0:	00000508 	andeq	r0, r0, r8, lsl #10
 1f4:	01020000 	mrseq	r0, (UNDEF: 2)
 1f8:	0000d108 	andeq	sp, r0, r8, lsl #2
 1fc:	07020200 	streq	r0, [r2, -r0, lsl #4]
 200:	000000f5 	strdeq	r0, [r0], -r5
 204:	0000df04 	andeq	sp, r0, r4, lsl #30
 208:	5a1a0200 	bpl	680a10 <__user_program+0x380a10>
 20c:	02000000 	andeq	r0, r0, #0
 210:	00340704 	eorseq	r0, r4, r4, lsl #14
 214:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 218:	00002a07 	andeq	r2, r0, r7, lsl #20
 21c:	01920500 	orrseq	r0, r2, r0, lsl #10
 220:	17010000 	strne	r0, [r1, -r0]
 224:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 228:	00000158 	andeq	r0, r0, r8, asr r1
 22c:	00a69c01 	adceq	r9, r6, r1, lsl #24
 230:	69060000 	stmdbvs	r6, {}	; <UNPREDICTABLE>
 234:	33190100 	tstcc	r9, #0, 2
 238:	02000000 	andeq	r0, r0, #0
 23c:	21077491 			; <UNDEFINED> instruction: 0x21077491
 240:	01000002 	tsteq	r0, r2
 244:	00003319 	andeq	r3, r0, r9, lsl r3
 248:	70910200 	addsvc	r0, r1, r0, lsl #4
 24c:	00018707 	andeq	r8, r1, r7, lsl #14
 250:	4f1a0100 	svcmi	0x001a0100
 254:	02000000 	andeq	r0, r0, #0
 258:	08006c91 	stmdaeq	r0, {r0, r4, r7, sl, fp, sp, lr}
 25c:	00000033 	andeq	r0, r0, r3, lsr r0
 260:	000000b7 	strheq	r0, [r0], -r7
 264:	0000b709 	andeq	fp, r0, r9, lsl #14
 268:	0001f300 	andeq	pc, r1, r0, lsl #6
 26c:	26070402 	strcs	r0, [r7], -r2, lsl #8
 270:	0a000002 	beq	280 <__start-0x7d80>
 274:	00000158 	andeq	r0, r0, r8, asr r1
 278:	00a61201 	adceq	r1, r6, r1, lsl #4
 27c:	03050000 	movweq	r0, #20480	; 0x5000
 280:	0000b7d0 	ldrdeq	fp, [r0], -r0
 284:	0001800a 	andeq	r8, r1, sl
 288:	a6120100 	ldrge	r0, [r2], -r0, lsl #2
 28c:	05000000 	streq	r0, [r0, #-0]
 290:	00b00003 	adcseq	r0, r0, r3
 294:	02350000 	eorseq	r0, r5, #0
 298:	00040000 	andeq	r0, r4, r0
 29c:	00000190 	muleq	r0, r0, r1
 2a0:	019e0104 	orrseq	r0, lr, r4, lsl #2
 2a4:	68010000 	stmdavs	r1, {}	; <UNPREDICTABLE>
 2a8:	08000002 	stmdaeq	r0, {r1}
 2ac:	0c000001 	stceq	0, cr0, [r0], {1}
 2b0:	88000083 	stmdahi	r0, {r0, r1, r7}
 2b4:	38000003 	stmdacc	r0, {r0, r1}
 2b8:	02000001 	andeq	r0, r0, #1
 2bc:	000000ca 	andeq	r0, r0, sl, asr #1
 2c0:	00300e02 	eorseq	r0, r0, r2, lsl #28
 2c4:	01030000 	mrseq	r0, (UNDEF: 3)
 2c8:	0000da08 	andeq	sp, r0, r8, lsl #20
 2cc:	05020300 	streq	r0, [r2, #-768]	; 0x300
 2d0:	00000134 	andeq	r0, r0, r4, lsr r1
 2d4:	0000e002 	andeq	lr, r0, r2
 2d8:	49120200 	ldmdbmi	r2, {r9}
 2dc:	04000000 	streq	r0, [r0], #-0
 2e0:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 2e4:	08030074 	stmdaeq	r3, {r2, r4, r5, r6}
 2e8:	00000005 	andeq	r0, r0, r5
 2ec:	00c90200 	sbceq	r0, r9, r0, lsl #4
 2f0:	16020000 	strne	r0, [r2], -r0
 2f4:	00000062 	andeq	r0, r0, r2, rrx
 2f8:	d1080103 	tstle	r8, r3, lsl #2
 2fc:	03000000 	movweq	r0, #0
 300:	00f50702 	rscseq	r0, r5, r2, lsl #14
 304:	df020000 	svcle	0x00020000
 308:	02000000 	andeq	r0, r0, #0
 30c:	00007b1a 	andeq	r7, r0, sl, lsl fp
 310:	07040300 	streq	r0, [r4, -r0, lsl #6]
 314:	00000034 	andeq	r0, r0, r4, lsr r0
 318:	00023f02 	andeq	r3, r2, r2, lsl #30
 31c:	8d1c0200 	lfmhi	f0, 4, [ip, #-0]
 320:	03000000 	movweq	r0, #0
 324:	002a0708 	eoreq	r0, sl, r8, lsl #14
 328:	4f020000 	svcmi	0x00020000
 32c:	03000002 	movweq	r0, #2
 330:	00009f13 	andeq	r9, r0, r3, lsl pc
 334:	024d0500 	subeq	r0, sp, #0, 10
 338:	04040000 	streq	r0, [r4], #-0
 33c:	0000b600 	andeq	fp, r0, r0, lsl #12
 340:	02950600 	addseq	r0, r5, #0, 12
 344:	00b60000 	adcseq	r0, r6, r0
 348:	00000000 	andeq	r0, r0, r0
 34c:	5e080407 	cdppl	4, 0, cr0, cr8, cr7, {0}
 350:	01000002 	tsteq	r0, r2
 354:	00830c21 	addeq	r0, r3, r1, lsr #24
 358:	00013800 	andeq	r3, r1, r0, lsl #16
 35c:	149c0100 	ldrne	r0, [ip], #256	; 0x100
 360:	09000001 	stmdbeq	r0, {r0}
 364:	00000248 	andeq	r0, r0, r8, asr #4
 368:	00572101 	subseq	r2, r7, r1, lsl #2
 36c:	91020000 	mrsls	r0, (UNDEF: 2)
 370:	756e0a5f 	strbvc	r0, [lr, #-2655]!	; 0xa5f
 374:	2101006d 	tstcs	r1, sp, rrx
 378:	00000082 	andeq	r0, r0, r2, lsl #1
 37c:	0b509102 	bleq	142478c <__user_program+0x112478c>
 380:	00000238 	andeq	r0, r0, r8, lsr r2
 384:	01142201 	tsteq	r4, r1, lsl #4
 388:	91020000 	mrsls	r0, (UNDEF: 2)
 38c:	75620c6c 	strbvc	r0, [r2, #-3180]!	; 0xc6c
 390:	23010066 	movwcs	r0, #4198	; 0x1066
 394:	0000011a 	andeq	r0, r0, sl, lsl r1
 398:	0c609102 	stfeqp	f1, [r0], #-8
 39c:	00727470 	rsbseq	r7, r2, r0, ror r4
 3a0:	01142401 	tsteq	r4, r1, lsl #8
 3a4:	91020000 	mrsls	r0, (UNDEF: 2)
 3a8:	040d0068 	streq	r0, [sp], #-104	; 0x68
 3ac:	00000025 	andeq	r0, r0, r5, lsr #32
 3b0:	0000250e 	andeq	r2, r0, lr, lsl #10
 3b4:	00012a00 	andeq	r2, r1, r0, lsl #20
 3b8:	012a0f00 	teqeq	sl, r0, lsl #30
 3bc:	00070000 	andeq	r0, r7, r0
 3c0:	26070403 	strcs	r0, [r7], -r3, lsl #8
 3c4:	10000002 	andne	r0, r0, r2
 3c8:	00000289 	andeq	r0, r0, r9, lsl #5
 3cc:	00493f01 	subeq	r3, r9, r1, lsl #30
 3d0:	84440000 	strbhi	r0, [r4], #-0
 3d4:	02500000 	subseq	r0, r0, #0
 3d8:	9c010000 	stcls	0, cr0, [r1], {-0}
 3dc:	0000020c 	andeq	r0, r0, ip, lsl #4
 3e0:	746d660a 	strbtvc	r6, [sp], #-1546	; 0x60a
 3e4:	0c3f0100 	ldfeqs	f0, [pc], #-0	; 3ec <__start-0x7c14>
 3e8:	02000002 	andeq	r0, r0, #2
 3ec:	0b117091 	bleq	45c638 <__user_program+0x15c638>
 3f0:	00000290 	muleq	r0, r0, r2
 3f4:	00944001 	addseq	r4, r4, r1
 3f8:	91020000 	mrsls	r0, (UNDEF: 2)
 3fc:	84fc124c 	ldrbthi	r1, [ip], #588	; 0x24c
 400:	005c0000 	subseq	r0, ip, r0
 404:	01830000 	orreq	r0, r3, r0
 408:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 40c:	01006d75 	tsteq	r0, r5, ror sp
 410:	00003e50 	andeq	r3, r0, r0, asr lr
 414:	60910200 	addsvs	r0, r1, r0, lsl #4
 418:	85581200 	ldrbhi	r1, [r8, #-512]	; 0x200
 41c:	002c0000 	eoreq	r0, ip, r0
 420:	019f0000 	orrseq	r0, pc, r0
 424:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 428:	01006d75 	tsteq	r0, r5, ror sp
 42c:	0000705b 	andeq	r7, r0, fp, asr r0
 430:	5c910200 	lfmpl	f0, 4, [r1], {0}
 434:	85841200 	strhi	r1, [r4, #512]	; 0x200
 438:	002c0000 	eoreq	r0, ip, r0
 43c:	01bb0000 			; <UNDEFINED> instruction: 0x01bb0000
 440:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 444:	01006d75 	tsteq	r0, r5, ror sp
 448:	00007061 	andeq	r7, r0, r1, rrx
 44c:	58910200 	ldmpl	r1, {r9}
 450:	85b01200 	ldrhi	r1, [r0, #512]!	; 0x200
 454:	002c0000 	eoreq	r0, ip, r0
 458:	01d70000 	bicseq	r0, r7, r0
 45c:	6e0c0000 	cdpvs	0, 0, cr0, cr12, cr0, {0}
 460:	01006d75 	tsteq	r0, r5, ror sp
 464:	00007068 	andeq	r7, r0, r8, rrx
 468:	54910200 	ldrpl	r0, [r1], #512	; 0x200
 46c:	85dc1200 	ldrbhi	r1, [ip, #512]	; 0x200
 470:	00480000 	subeq	r0, r8, r0
 474:	01f30000 	mvnseq	r0, r0
 478:	2f0b0000 	svccs	0x000b0000
 47c:	01000002 	tsteq	r0, r2
 480:	0001146e 	andeq	r1, r1, lr, ror #8
 484:	64910200 	ldrvs	r0, [r1], #512	; 0x200
 488:	86241300 	strthi	r1, [r4], -r0, lsl #6
 48c:	00280000 	eoreq	r0, r8, r0
 490:	a30b0000 	movwge	r0, #45056	; 0xb000
 494:	01000002 	tsteq	r0, r2
 498:	00003e77 	andeq	r3, r0, r7, ror lr
 49c:	50910200 	addspl	r0, r1, r0, lsl #4
 4a0:	040d0000 	streq	r0, [sp], #-0
 4a4:	00000212 	andeq	r0, r0, r2, lsl r2
 4a8:	00003014 	andeq	r3, r0, r4, lsl r0
 4ac:	00300e00 	eorseq	r0, r0, r0, lsl #28
 4b0:	02270000 	eoreq	r0, r7, #0
 4b4:	2a0f0000 	bcs	3c04bc <__user_program+0xc04bc>
 4b8:	10000001 	andne	r0, r0, r1
 4bc:	02570b00 	subseq	r0, r7, #0, 22
 4c0:	18010000 	stmdane	r1, {}	; <UNPREDICTABLE>
 4c4:	00000217 	andeq	r0, r0, r7, lsl r2
 4c8:	a0000305 	andge	r0, r0, r5, lsl #6
 4cc:	71000000 	mrsvc	r0, (UNDEF: 0)
 4d0:	04000001 	streq	r0, [r0], #-1
 4d4:	00029500 	andeq	r9, r2, r0, lsl #10
 4d8:	9e010400 	cfcpysls	mvf0, mvf1
 4dc:	01000001 	tsteq	r0, r1
 4e0:	000002db 	ldrdeq	r0, [r0], -fp
 4e4:	00000108 	andeq	r0, r0, r8, lsl #2
 4e8:	00008694 	muleq	r0, r4, r6
 4ec:	0000018c 	andeq	r0, r0, ip, lsl #3
 4f0:	00000212 	andeq	r0, r0, r2, lsl r2
 4f4:	da080102 	ble	200904 <__end+0xd3904>
 4f8:	02000000 	andeq	r0, r0, #0
 4fc:	01340502 	teqeq	r4, r2, lsl #10
 500:	04030000 	streq	r0, [r3], #-0
 504:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
 508:	05080200 	streq	r0, [r8, #-512]	; 0x200
 50c:	00000000 	andeq	r0, r0, r0
 510:	0000c904 	andeq	ip, r0, r4, lsl #18
 514:	4c160200 	lfmmi	f0, 4, [r6], {-0}
 518:	02000000 	andeq	r0, r0, #0
 51c:	00d10801 	sbcseq	r0, r1, r1, lsl #16
 520:	02020000 	andeq	r0, r2, #0
 524:	0000f507 	andeq	pc, r0, r7, lsl #10
 528:	00df0400 	sbcseq	r0, pc, r0, lsl #8
 52c:	1a020000 	bne	80534 <__bss_end+0x74534>
 530:	00000065 	andeq	r0, r0, r5, rrx
 534:	34070402 	strcc	r0, [r7], #-1026	; 0x402
 538:	02000000 	andeq	r0, r0, #0
 53c:	002a0708 	eoreq	r0, sl, r8, lsl #14
 540:	22050000 	andcs	r0, r5, #0
 544:	01000003 	tsteq	r0, r3
 548:	00869439 	addeq	r9, r6, r9, lsr r4
 54c:	0000b400 	andeq	fp, r0, r0, lsl #8
 550:	069c0100 	ldreq	r0, [ip], r0, lsl #2
 554:	00000349 	andeq	r0, r0, r9, asr #6
 558:	87485201 	strbhi	r5, [r8, -r1, lsl #4]
 55c:	00280000 	eoreq	r0, r8, r0
 560:	9c010000 	stcls	0, cr0, [r1], {-0}
 564:	00032c07 	andeq	r2, r3, r7, lsl #24
 568:	705b0100 	subsvc	r0, fp, r0, lsl #2
 56c:	58000087 	stmdapl	r0, {r0, r1, r2, r7}
 570:	01000000 	mrseq	r0, (UNDEF: 0)
 574:	0000b99c 	muleq	r0, ip, r9
 578:	02a30800 	adceq	r0, r3, #0, 16
 57c:	5b010000 	blpl	40584 <__bss_end+0x34584>
 580:	00000041 	andeq	r0, r0, r1, asr #32
 584:	00779102 	rsbseq	r9, r7, r2, lsl #2
 588:	00029a09 	andeq	r9, r2, r9, lsl #20
 58c:	416f0100 	cmnmi	pc, r0, lsl #2
 590:	c8000000 	stmdagt	r0, {}	; <UNPREDICTABLE>
 594:	58000087 	stmdapl	r0, {r0, r1, r2, r7}
 598:	01000000 	mrseq	r0, (UNDEF: 0)
 59c:	0000e19c 	muleq	r0, ip, r1
 5a0:	02fa0a00 	rscseq	r0, sl, #0, 20
 5a4:	7a010000 	bvc	405ac <__bss_end+0x345ac>
 5a8:	00000041 	andeq	r0, r0, r1, asr #32
 5ac:	00779102 	rsbseq	r9, r7, r2, lsl #2
 5b0:	0003540a 	andeq	r5, r3, sl, lsl #8
 5b4:	f2250100 	vrhadd.s32	d0, d5, d0
 5b8:	05000000 	streq	r0, [r0, #-0]
 5bc:	00a01403 	adceq	r1, r0, r3, lsl #8
 5c0:	f8040b00 			; <UNDEFINED> instruction: 0xf8040b00
 5c4:	0c000000 	stceq	0, cr0, [r0], {-0}
 5c8:	0000005a 	andeq	r0, r0, sl, asr r0
 5cc:	0002b60a 	andeq	fp, r2, sl, lsl #12
 5d0:	f2270100 	vrhadd.s32	d0, d7, d0
 5d4:	05000000 	streq	r0, [r0, #-0]
 5d8:	00a01803 	adceq	r1, r0, r3, lsl #16
 5dc:	03130a00 	tsteq	r3, #0, 20
 5e0:	29010000 	stmdbcs	r1, {}	; <UNPREDICTABLE>
 5e4:	000000f2 	strdeq	r0, [r0], -r2
 5e8:	a01c0305 	andsge	r0, ip, r5, lsl #6
 5ec:	bd0a0000 	stclt	0, cr0, [sl, #-0]
 5f0:	01000002 	tsteq	r0, r2
 5f4:	0000f22b 	andeq	pc, r0, fp, lsr #4
 5f8:	20030500 	andcs	r0, r3, r0, lsl #10
 5fc:	0a0000a0 	beq	884 <__start-0x777c>
 600:	000002cc 	andeq	r0, r0, ip, asr #5
 604:	00f22d01 	rscseq	r2, r2, r1, lsl #26
 608:	03050000 	movweq	r0, #20480	; 0x5000
 60c:	0000a024 	andeq	sl, r0, r4, lsr #32
 610:	0002a80a 	andeq	sl, r2, sl, lsl #16
 614:	f22f0100 	vrhadd.s32	d0, d15, d0
 618:	05000000 	streq	r0, [r0, #-0]
 61c:	00a02803 	adceq	r2, r0, r3, lsl #16
 620:	03030a00 	movweq	r0, #14848	; 0x3a00
 624:	31010000 	mrscc	r0, (UNDEF: 1)
 628:	000000f2 	strdeq	r0, [r0], -r2
 62c:	a02c0305 	eorge	r0, ip, r5, lsl #6
 630:	3a0a0000 	bcc	280638 <__end+0x153638>
 634:	01000003 	tsteq	r0, r3
 638:	0000f233 	andeq	pc, r0, r3, lsr r2	; <UNPREDICTABLE>
 63c:	30030500 	andcc	r0, r3, r0, lsl #10
 640:	000000a0 	andeq	r0, r0, r0, lsr #1
 644:	000000d5 	ldrdeq	r0, [r0], -r5
 648:	03600004 	cmneq	r0, #4
 64c:	01040000 	mrseq	r0, (UNDEF: 4)
 650:	0000019e 	muleq	r0, lr, r1
 654:	00037401 	andeq	r7, r3, r1, lsl #8
 658:	00010800 	andeq	r0, r1, r0, lsl #16
 65c:	00882000 	addeq	r2, r8, r0
 660:	00008800 	andeq	r8, r0, r0, lsl #16
 664:	00029800 	andeq	r9, r2, r0, lsl #16
 668:	08010200 	stmdaeq	r1, {r9}
 66c:	000000da 	ldrdeq	r0, [r0], -sl
 670:	34050202 	strcc	r0, [r5], #-514	; 0x202
 674:	03000001 	movweq	r0, #1
 678:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 67c:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 680:	00000005 	andeq	r0, r0, r5
 684:	08010200 	stmdaeq	r1, {r9}
 688:	000000d1 	ldrdeq	r0, [r0], -r1
 68c:	f5070202 			; <UNDEFINED> instruction: 0xf5070202
 690:	04000000 	streq	r0, [r0], #-0
 694:	000000df 	ldrdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 698:	005a1a02 	subseq	r1, sl, r2, lsl #20
 69c:	04020000 	streq	r0, [r2], #-0
 6a0:	00003407 	andeq	r3, r0, r7, lsl #8
 6a4:	07080200 	streq	r0, [r8, -r0, lsl #4]
 6a8:	0000002a 	andeq	r0, r0, sl, lsr #32
 6ac:	00039905 	andeq	r9, r3, r5, lsl #18
 6b0:	200c0100 	andcs	r0, ip, r0, lsl #2
 6b4:	20000088 	andcs	r0, r0, r8, lsl #1
 6b8:	01000000 	mrseq	r0, (UNDEF: 0)
 6bc:	00008c9c 	muleq	r0, ip, ip
 6c0:	03940600 	orrseq	r0, r4, #0, 12
 6c4:	0c010000 	stceq	0, cr0, [r1], {-0}
 6c8:	00000033 	andeq	r0, r0, r3, lsr r0
 6cc:	00749102 	rsbseq	r9, r4, r2, lsl #2
 6d0:	0003b607 	andeq	fp, r3, r7, lsl #12
 6d4:	40100100 	andsmi	r0, r0, r0, lsl #2
 6d8:	18000088 	stmdane	r0, {r3, r7}
 6dc:	01000000 	mrseq	r0, (UNDEF: 0)
 6e0:	03c1089c 	biceq	r0, r1, #156, 16	; 0x9c0000
 6e4:	14010000 	strne	r0, [r1], #-0
 6e8:	0000004f 	andeq	r0, r0, pc, asr #32
 6ec:	00008858 	andeq	r8, r0, r8, asr r8
 6f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 6f4:	a5089c01 	strge	r9, [r8, #-3073]	; 0xc01
 6f8:	01000003 	tsteq	r0, r3
 6fc:	00003318 	andeq	r3, r0, r8, lsl r3
 700:	00887400 	addeq	r7, r8, r0, lsl #8
 704:	00001c00 	andeq	r1, r0, r0, lsl #24
 708:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
 70c:	00000360 	andeq	r0, r0, r0, ror #6
 710:	88901d01 	ldmhi	r0, {r0, r8, sl, fp, ip}
 714:	00180000 	andseq	r0, r8, r0
 718:	9c010000 	stcls	0, cr0, [r1], {-0}
 71c:	00010f00 	andeq	r0, r1, r0, lsl #30
 720:	f2000400 	vshl.s8	d0, d0, d0
 724:	04000003 	streq	r0, [r0], #-3
 728:	00019e01 	andeq	r9, r1, r1, lsl #28
 72c:	04270100 	strteq	r0, [r7], #-256	; 0x100
 730:	01080000 	mrseq	r0, (UNDEF: 8)
 734:	88a80000 	stmiahi	r8!, {}	; <UNPREDICTABLE>
 738:	00cc0000 	sbceq	r0, ip, r0
 73c:	03120000 	tsteq	r2, #0
 740:	01020000 	mrseq	r0, (UNDEF: 2)
 744:	0000da08 	andeq	sp, r0, r8, lsl #20
 748:	05020200 	streq	r0, [r2, #-512]	; 0x200
 74c:	00000134 	andeq	r0, r0, r4, lsr r1
 750:	69050403 	stmdbvs	r5, {r0, r1, sl}
 754:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 758:	00000508 	andeq	r0, r0, r8, lsl #10
 75c:	01020000 	mrseq	r0, (UNDEF: 2)
 760:	0000d108 	andeq	sp, r0, r8, lsl #2
 764:	07020200 	streq	r0, [r2, -r0, lsl #4]
 768:	000000f5 	strdeq	r0, [r0], -r5
 76c:	0000df04 	andeq	sp, r0, r4, lsl #30
 770:	5a1a0200 	bpl	680f78 <__user_program+0x380f78>
 774:	02000000 	andeq	r0, r0, #0
 778:	00340704 	eorseq	r0, r4, r4, lsl #14
 77c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 780:	00002a07 	andeq	r2, r0, r7, lsl #20
 784:	69740500 	ldmdbvs	r4!, {r8, sl}^
 788:	30010063 	andcc	r0, r1, r3, rrx
 78c:	000088a8 	andeq	r8, r0, r8, lsr #17
 790:	00000094 	muleq	r0, r4, r0
 794:	74069c01 	strvc	r9, [r6], #-3073	; 0xc01
 798:	0100636f 	tsteq	r0, pc, ror #6
 79c:	00004f4a 	andeq	r4, r0, sl, asr #30
 7a0:	00893c00 	addeq	r3, r9, r0, lsl #24
 7a4:	00003800 	andeq	r3, r0, r0, lsl #16
 7a8:	a19c0100 	orrsge	r0, ip, r0, lsl #2
 7ac:	07000000 	streq	r0, [r0, -r0]
 7b0:	0000041f 	andeq	r0, r0, pc, lsl r4
 7b4:	004f4c01 	subeq	r4, pc, r1, lsl #24
 7b8:	91020000 	mrsls	r0, (UNDEF: 2)
 7bc:	06070074 			; <UNDEFINED> instruction: 0x06070074
 7c0:	01000004 	tsteq	r0, r4
 7c4:	0000b220 	andeq	fp, r0, r0, lsr #4
 7c8:	34030500 	strcc	r0, [r3], #-1280	; 0x500
 7cc:	080000a0 	stmdaeq	r0, {r5, r7}
 7d0:	0000b804 	andeq	fp, r0, r4, lsl #16
 7d4:	004f0900 	subeq	r0, pc, r0, lsl #18
 7d8:	fa070000 	blx	1c07e0 <__end+0x937e0>
 7dc:	01000003 	tsteq	r0, r3
 7e0:	0000b222 	andeq	fp, r0, r2, lsr #4
 7e4:	38030500 	stmdacc	r3, {r8, sl}
 7e8:	070000a0 	streq	r0, [r0, -r0, lsr #1]
 7ec:	00000411 	andeq	r0, r0, r1, lsl r4
 7f0:	00b22401 	adcseq	r2, r2, r1, lsl #8
 7f4:	03050000 	movweq	r0, #20480	; 0x5000
 7f8:	0000a03c 	andeq	sl, r0, ip, lsr r0
 7fc:	0003cc07 	andeq	ip, r3, r7, lsl #24
 800:	b2260100 	eorlt	r0, r6, #0, 2
 804:	05000000 	streq	r0, [r0, #-0]
 808:	00a04003 	adceq	r4, r0, r3
 80c:	03ed0700 	mvneq	r0, #0, 14
 810:	28010000 	stmdacs	r1, {}	; <UNPREDICTABLE>
 814:	000000b2 	strheq	r0, [r0], -r2
 818:	a0440305 	subge	r0, r4, r5, lsl #6
 81c:	dc070000 	stcle	0, cr0, [r7], {-0}
 820:	01000003 	tsteq	r0, r3
 824:	0000b22a 	andeq	fp, r0, sl, lsr #4
 828:	48030500 	stmdami	r3, {r8, sl}
 82c:	000000a0 	andeq	r0, r0, r0, lsr #1
 830:	00000051 	andeq	r0, r0, r1, asr r0
 834:	047c0002 	ldrbteq	r0, [ip], #-2
 838:	01040000 	mrseq	r0, (UNDEF: 4)
 83c:	0000038c 	andeq	r0, r0, ip, lsl #7
 840:	00008000 	andeq	r8, r0, r0
 844:	00008054 	andeq	r8, r0, r4, asr r0
 848:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 84c:	2f6b6269 	svccs	0x006b6269
 850:	2f637273 	svccs	0x00637273
 854:	746f6f62 	strbtvc	r6, [pc], #-3938	; 85c <__start-0x77a4>
 858:	2f00532e 	svccs	0x0000532e
 85c:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 860:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 864:	2f393433 	svccs	0x00393433
 868:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 86c:	2f363166 	svccs	0x00363166
 870:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 874:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 878:	20534120 	subscs	r4, r3, r0, lsr #2
 87c:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 880:	0100302e 	tsteq	r0, lr, lsr #32
 884:	00005080 	andeq	r5, r0, r0, lsl #1
 888:	90000200 	andls	r0, r0, r0, lsl #4
 88c:	04000004 	streq	r0, [r0], #-4
 890:	0003e401 	andeq	lr, r3, r1, lsl #8
 894:	00897400 	addeq	r7, r9, r0, lsl #8
 898:	0089b800 	addeq	fp, r9, r0, lsl #16
 89c:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 8a0:	6b62696c 	blvs	189ae58 <__user_program+0x159ae58>
 8a4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 8a8:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
 8ac:	2f00532e 	svccs	0x0000532e
 8b0:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 8b4:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 8b8:	2f393433 	svccs	0x00393433
 8bc:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 8c0:	2f363166 	svccs	0x00363166
 8c4:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 8c8:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 8cc:	20534120 	subscs	r4, r3, r0, lsr #2
 8d0:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 8d4:	0100302e 	tsteq	r0, lr, lsr #32
 8d8:	00004c80 	andeq	r4, r0, r0, lsl #25
 8dc:	a4000200 	strge	r0, [r0], #-512	; 0x200
 8e0:	04000004 	streq	r0, [r0], #-4
 8e4:	00043501 	andeq	r3, r4, r1, lsl #10
 8e8:	0089b800 	addeq	fp, r9, r0, lsl #16
 8ec:	008b1000 	addeq	r1, fp, r0
 8f0:	6f6e7500 	svcvs	0x006e7500
 8f4:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 8f8:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
 8fc:	2f00632e 	svccs	0x0000632e
 900:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 904:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 908:	2f393433 	svccs	0x00393433
 90c:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 910:	2f363166 	svccs	0x00363166
 914:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 918:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 91c:	20534120 	subscs	r4, r3, r0, lsr #2
 920:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 924:	0100302e 	tsteq	r0, lr, lsr #32
 928:	00004c80 	andeq	r4, r0, r0, lsl #25
 92c:	b8000200 	stmdalt	r0, {r9}
 930:	04000004 	streq	r0, [r0], #-4
 934:	0004c901 	andeq	ip, r4, r1, lsl #18
 938:	008b1000 	addeq	r1, fp, r0
 93c:	008bf000 	addeq	pc, fp, r0
 940:	74706f00 	ldrbtvc	r6, [r0], #-3840	; 0xf00
 944:	7a696d69 	bvc	1a5bef0 <__user_program+0x175bef0>
 948:	656d5f65 	strbvs	r5, [sp, #-3941]!	; 0xf65
 94c:	2f00632e 	svccs	0x0000632e
 950:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 954:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 958:	2f393433 	svccs	0x00393433
 95c:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 960:	2f363166 	svccs	0x00363166
 964:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 968:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 96c:	20534120 	subscs	r4, r3, r0, lsr #2
 970:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 974:	0100302e 	tsteq	r0, lr, lsr #32
 978:	Address 0x00000978 is out of bounds.
=======
   0:	00000162 	andeq	r0, r0, r2, ror #2
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	000000a3 	andeq	r0, r0, r3, lsr #1
  10:	00014201 	andeq	r4, r1, r1, lsl #4
  14:	00001c00 	andeq	r1, r0, r0, lsl #24
  18:	00805400 	addeq	r5, r0, r0, lsl #8
  1c:	00032000 	andeq	r2, r3, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	08010200 	stmdaeq	r1, {r9}
  28:	00000082 	andeq	r0, r0, r2, lsl #1
  2c:	38050202 	stmdacc	r5, {r1, r9}
  30:	03000001 	movweq	r0, #1
  34:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
  38:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
  3c:	00000005 	andeq	r0, r0, r5
  40:	00710400 	rsbseq	r0, r1, r0, lsl #8
  44:	16020000 	strne	r0, [r2], -r0
  48:	0000004c 	andeq	r0, r0, ip, asr #32
  4c:	79080102 	stmdbvc	r8, {r1, r8}
  50:	02000000 	andeq	r0, r0, #0
  54:	00900702 	addseq	r0, r0, r2, lsl #14
  58:	87040000 	strhi	r0, [r4, -r0]
  5c:	02000000 	andeq	r0, r0, #0
  60:	0000651a 	andeq	r6, r0, sl, lsl r5
  64:	07040200 	streq	r0, [r4, -r0, lsl #4]
  68:	00000054 	andeq	r0, r0, r4, asr r0
  6c:	4a070802 	bmi	1c207c <__end+0x9407c>
  70:	05000000 	streq	r0, [r0, #-0]
  74:	0000012c 	andeq	r0, r0, ip, lsr #2
  78:	80545401 	subshi	r5, r4, r1, lsl #8
  7c:	01200000 	teqeq	r0, r0
  80:	9c010000 	stcls	0, cr0, [r1], {-0}
  84:	000000cf 	andeq	r0, r0, pc, asr #1
  88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  8c:	41540100 	cmpmi	r4, r0, lsl #2
  90:	02000000 	andeq	r0, r0, #0
  94:	66066791 			; <UNDEFINED> instruction: 0x66066791
  98:	01006e75 	tsteq	r0, r5, ror lr
  9c:	00004154 	andeq	r4, r0, r4, asr r1
  a0:	66910200 	ldrvs	r0, [r1], r0, lsl #4
  a4:	67657207 	strbvs	r7, [r5, -r7, lsl #4]!
  a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
  ac:	02000000 	andeq	r0, r0, #0
  b0:	31087491 			; <UNDEFINED> instruction: 0x31087491
  b4:	01000001 	tsteq	r0, r1
  b8:	00005a5b 	andeq	r5, r0, fp, asr sl
  bc:	70910200 	addsvc	r0, r1, r0, lsl #4
  c0:	00006a08 	andeq	r6, r0, r8, lsl #20
  c4:	5a5d0100 	bpl	17404cc <__user_program+0x14404cc>
  c8:	02000000 	andeq	r0, r0, #0
  cc:	05006c91 	streq	r6, [r0, #-3217]	; 0xc91
  d0:	00000041 	andeq	r0, r0, r1, asr #32
  d4:	81746401 	cmnhi	r4, r1, lsl #8
  d8:	00840000 	addeq	r0, r4, r0
  dc:	9c010000 	stcls	0, cr0, [r1], {-0}
  e0:	000000f3 	strdeq	r0, [r0], -r3
  e4:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  e8:	41640100 	cmnmi	r4, r0, lsl #2
  ec:	02000000 	andeq	r0, r0, #0
  f0:	05007791 	streq	r7, [r0, #-1937]	; 0x791
  f4:	00000061 	andeq	r0, r0, r1, rrx
  f8:	81f87001 	mvnshi	r7, r1
  fc:	00840000 	addeq	r0, r4, r0
 100:	9c010000 	stcls	0, cr0, [r1], {-0}
 104:	00000117 	andeq	r0, r0, r7, lsl r1
 108:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 10c:	41700100 	cmnmi	r0, r0, lsl #2
 110:	02000000 	andeq	r0, r0, #0
 114:	09007791 	stmdbeq	r0, {r0, r4, r7, r8, r9, sl, ip, sp, lr}
 118:	0000000e 	andeq	r0, r0, lr
 11c:	827c7c01 	rsbshi	r7, ip, #256	; 0x100
 120:	00f80000 	rscseq	r0, r8, r0
 124:	9c010000 	stcls	0, cr0, [r1], {-0}
 128:	00000149 	andeq	r0, r0, r9, asr #2
 12c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 130:	417c0100 	cmnmi	ip, r0, lsl #2
 134:	02000000 	andeq	r0, r0, #0
 138:	260a7791 			; <UNDEFINED> instruction: 0x260a7791
 13c:	01000001 	tsteq	r0, r1
 140:	0000417c 	andeq	r4, r0, ip, ror r1
 144:	76910200 	ldrvc	r0, [r1], r0, lsl #4
 148:	003c0800 	eorseq	r0, ip, r0, lsl #16
 14c:	51010000 	mrspl	r0, (UNDEF: 1)
 150:	0000015a 	andeq	r0, r0, sl, asr r1
 154:	b0000305 	andlt	r0, r0, r5, lsl #6
 158:	040b0000 	streq	r0, [fp], #-0
 15c:	00000160 	andeq	r0, r0, r0, ror #2
 160:	00005a0c 	andeq	r5, r0, ip, lsl #20
 164:	00dd0000 	sbcseq	r0, sp, r0
 168:	00040000 	andeq	r0, r4, r0
 16c:	000000b7 	strheq	r0, [r0], -r7
 170:	00a30104 	adceq	r0, r3, r4, lsl #2
 174:	5c010000 	stcpl	0, cr0, [r1], {-0}
 178:	1c000001 	stcne	0, cr0, [r0], {1}
 17c:	74000000 	strvc	r0, [r0], #-0
 180:	58000083 	stmdapl	r0, {r0, r1, r7}
 184:	96000001 	strls	r0, [r0], -r1
 188:	02000000 	andeq	r0, r0, #0
 18c:	00820801 	addeq	r0, r2, r1, lsl #16
 190:	02020000 	andeq	r0, r2, #0
 194:	00013805 	andeq	r3, r1, r5, lsl #16
 198:	05040300 	streq	r0, [r4, #-768]	; 0x300
 19c:	00746e69 	rsbseq	r6, r4, r9, ror #28
 1a0:	00050802 	andeq	r0, r5, r2, lsl #16
 1a4:	02000000 	andeq	r0, r0, #0
 1a8:	00790801 	rsbseq	r0, r9, r1, lsl #16
 1ac:	02020000 	andeq	r0, r2, #0
 1b0:	00009007 	andeq	r9, r0, r7
 1b4:	00870400 	addeq	r0, r7, r0, lsl #8
 1b8:	1a020000 	bne	801c0 <__bss_end+0x731c0>
 1bc:	0000005a 	andeq	r0, r0, sl, asr r0
 1c0:	54070402 	strpl	r0, [r7], #-1026	; 0x402
 1c4:	02000000 	andeq	r0, r0, #0
 1c8:	004a0708 	subeq	r0, sl, r8, lsl #14
 1cc:	8f050000 	svchi	0x00050000
 1d0:	01000001 	tsteq	r0, r1
 1d4:	00837417 	addeq	r7, r3, r7, lsl r4
 1d8:	00015800 	andeq	r5, r1, r0, lsl #16
 1dc:	a69c0100 	ldrge	r0, [ip], r0, lsl #2
 1e0:	06000000 	streq	r0, [r0], -r0
 1e4:	19010069 	stmdbne	r1, {r0, r3, r5, r6}
 1e8:	00000033 	andeq	r0, r0, r3, lsr r0
 1ec:	07749102 	ldrbeq	r9, [r4, -r2, lsl #2]!
 1f0:	0000019b 	muleq	r0, fp, r1
 1f4:	00331901 	eorseq	r1, r3, r1, lsl #18
 1f8:	91020000 	mrsls	r0, (UNDEF: 2)
 1fc:	01840770 	orreq	r0, r4, r0, ror r7
 200:	1a010000 	bne	40208 <__bss_end+0x33208>
 204:	0000004f 	andeq	r0, r0, pc, asr #32
 208:	006c9102 	rsbeq	r9, ip, r2, lsl #2
 20c:	00003308 	andeq	r3, r0, r8, lsl #6
 210:	0000b700 	andeq	fp, r0, r0, lsl #14
 214:	00b70900 	adcseq	r0, r7, r0, lsl #18
 218:	01f30000 	mvnseq	r0, r0
 21c:	07040200 	streq	r0, [r4, -r0, lsl #4]
 220:	000001a0 	andeq	r0, r0, r0, lsr #3
 224:	0001550a 	andeq	r5, r1, sl, lsl #10
 228:	a6120100 	ldrge	r0, [r2], -r0, lsl #2
 22c:	05000000 	streq	r0, [r0, #-0]
 230:	00c7d003 	sbceq	sp, r7, r3
 234:	017d0a00 	cmneq	sp, r0, lsl #20
 238:	12010000 	andne	r0, r1, #0
 23c:	000000a6 	andeq	r0, r0, r6, lsr #1
 240:	c0000305 	andgt	r0, r0, r5, lsl #6
 244:	35000000 	strcc	r0, [r0, #-0]
 248:	04000002 	streq	r0, [r0], #-2
 24c:	00014900 	andeq	r4, r1, r0, lsl #18
 250:	a3010400 	movwge	r0, #5120	; 0x1400
 254:	01000000 	mrseq	r0, (UNDEF: 0)
 258:	000001e2 	andeq	r0, r0, r2, ror #3
 25c:	0000001c 	andeq	r0, r0, ip, lsl r0
 260:	000084cc 	andeq	r8, r0, ip, asr #9
 264:	00000388 	andeq	r0, r0, r8, lsl #7
 268:	00000148 	andeq	r0, r0, r8, asr #2
 26c:	00007202 	andeq	r7, r0, r2, lsl #4
 270:	300e0200 	andcc	r0, lr, r0, lsl #4
 274:	03000000 	movweq	r0, #0
 278:	00820801 	addeq	r0, r2, r1, lsl #16
 27c:	02030000 	andeq	r0, r3, #0
 280:	00013805 	andeq	r3, r1, r5, lsl #16
 284:	00880200 	addeq	r0, r8, r0, lsl #4
 288:	12020000 	andne	r0, r2, #0
 28c:	00000049 	andeq	r0, r0, r9, asr #32
 290:	69050404 	stmdbvs	r5, {r2, sl}
 294:	0300746e 	movweq	r7, #1134	; 0x46e
 298:	00000508 	andeq	r0, r0, r8, lsl #10
 29c:	71020000 	mrsvc	r0, (UNDEF: 2)
 2a0:	02000000 	andeq	r0, r0, #0
 2a4:	00006216 	andeq	r6, r0, r6, lsl r2
 2a8:	08010300 	stmdaeq	r1, {r8, r9}
 2ac:	00000079 	andeq	r0, r0, r9, ror r0
 2b0:	90070203 	andls	r0, r7, r3, lsl #4
 2b4:	02000000 	andeq	r0, r0, #0
 2b8:	00000087 	andeq	r0, r0, r7, lsl #1
 2bc:	007b1a02 	rsbseq	r1, fp, r2, lsl #20
 2c0:	04030000 	streq	r0, [r3], #-0
 2c4:	00005407 	andeq	r5, r0, r7, lsl #8
 2c8:	01b90200 			; <UNDEFINED> instruction: 0x01b90200
 2cc:	1c020000 	stcne	0, cr0, [r2], {-0}
 2d0:	0000008d 	andeq	r0, r0, sp, lsl #1
 2d4:	4a070803 	bmi	1c22e8 <__end+0x942e8>
 2d8:	02000000 	andeq	r0, r0, #0
 2dc:	000001c9 	andeq	r0, r0, r9, asr #3
 2e0:	009f1303 	addseq	r1, pc, r3, lsl #6
 2e4:	c7050000 	strgt	r0, [r5, -r0]
 2e8:	04000001 	streq	r0, [r0], #-1
 2ec:	00b60004 	adcseq	r0, r6, r4
 2f0:	0f060000 	svceq	0x00060000
 2f4:	b6000002 	strlt	r0, [r0], -r2
 2f8:	00000000 	andeq	r0, r0, r0
 2fc:	08040700 	stmdaeq	r4, {r8, r9, sl}
 300:	000001d1 	ldrdeq	r0, [r0], -r1
 304:	84cc2101 	strbhi	r2, [ip], #257	; 0x101
 308:	01380000 	teqeq	r8, r0
 30c:	9c010000 	stcls	0, cr0, [r1], {-0}
 310:	00000114 	andeq	r0, r0, r4, lsl r1
 314:	0001c209 	andeq	ip, r1, r9, lsl #4
 318:	57210100 	strpl	r0, [r1, -r0, lsl #2]!
 31c:	02000000 	andeq	r0, r0, #0
 320:	6e0a5f91 	mcrvs	15, 0, r5, cr10, cr1, {4}
 324:	01006d75 	tsteq	r0, r5, ror sp
 328:	00008221 	andeq	r8, r0, r1, lsr #4
 32c:	50910200 	addspl	r0, r1, r0, lsl #4
 330:	0001b20b 	andeq	fp, r1, fp, lsl #4
 334:	14220100 	strtne	r0, [r2], #-256	; 0x100
 338:	02000001 	andeq	r0, r0, #1
 33c:	620c6c91 	andvs	r6, ip, #37120	; 0x9100
 340:	01006675 	tsteq	r0, r5, ror r6
 344:	00011a23 	andeq	r1, r1, r3, lsr #20
 348:	60910200 	addsvs	r0, r1, r0, lsl #4
 34c:	7274700c 	rsbsvc	r7, r4, #12
 350:	14240100 	strtne	r0, [r4], #-256	; 0x100
 354:	02000001 	andeq	r0, r0, #1
 358:	0d006891 	stceq	8, cr6, [r0, #-580]	; 0xfffffdbc
 35c:	00002504 	andeq	r2, r0, r4, lsl #10
 360:	00250e00 	eoreq	r0, r5, r0, lsl #28
 364:	012a0000 	teqeq	sl, r0
 368:	2a0f0000 	bcs	3c0370 <__user_program+0xc0370>
 36c:	07000001 	streq	r0, [r0, -r1]
 370:	07040300 	streq	r0, [r4, -r0, lsl #6]
 374:	000001a0 	andeq	r0, r0, r0, lsr #3
 378:	00020310 	andeq	r0, r2, r0, lsl r3
 37c:	493f0100 	ldmdbmi	pc!, {r8}	; <UNPREDICTABLE>
 380:	04000000 	streq	r0, [r0], #-0
 384:	50000086 	andpl	r0, r0, r6, lsl #1
 388:	01000002 	tsteq	r0, r2
 38c:	00020c9c 	muleq	r2, ip, ip
 390:	6d660a00 	vstmdbvs	r6!, {s1-s0}
 394:	3f010074 	svccc	0x00010074
 398:	0000020c 	andeq	r0, r0, ip, lsl #4
 39c:	11709102 	cmnne	r0, r2, lsl #2
 3a0:	00020a0b 	andeq	r0, r2, fp, lsl #20
 3a4:	94400100 	strbls	r0, [r0], #-256	; 0x100
 3a8:	02000000 	andeq	r0, r0, #0
 3ac:	bc124c91 	ldclt	12, cr4, [r2], {145}	; 0x91
 3b0:	5c000086 	stcpl	0, cr0, [r0], {134}	; 0x86
 3b4:	83000000 	movwhi	r0, #0
 3b8:	0c000001 	stceq	0, cr0, [r0], {1}
 3bc:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3c0:	003e5001 	eorseq	r5, lr, r1
 3c4:	91020000 	mrsls	r0, (UNDEF: 2)
 3c8:	18120060 	ldmdane	r2, {r5, r6}
 3cc:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 3d0:	9f000000 	svcls	0x00000000
 3d4:	0c000001 	stceq	0, cr0, [r0], {1}
 3d8:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3dc:	00705b01 	rsbseq	r5, r0, r1, lsl #22
 3e0:	91020000 	mrsls	r0, (UNDEF: 2)
 3e4:	4412005c 	ldrmi	r0, [r2], #-92	; 0x5c
 3e8:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 3ec:	bb000000 	bllt	3f4 <__start-0x7c0c>
 3f0:	0c000001 	stceq	0, cr0, [r0], {1}
 3f4:	006d756e 	rsbeq	r7, sp, lr, ror #10
 3f8:	00706101 	rsbseq	r6, r0, r1, lsl #2
 3fc:	91020000 	mrsls	r0, (UNDEF: 2)
 400:	70120058 	andsvc	r0, r2, r8, asr r0
 404:	2c000087 	stccs	0, cr0, [r0], {135}	; 0x87
 408:	d7000000 	strle	r0, [r0, -r0]
 40c:	0c000001 	stceq	0, cr0, [r0], {1}
 410:	006d756e 	rsbeq	r7, sp, lr, ror #10
 414:	00706801 	rsbseq	r6, r0, r1, lsl #16
 418:	91020000 	mrsls	r0, (UNDEF: 2)
 41c:	9c120054 	ldcls	0, cr0, [r2], {84}	; 0x54
 420:	48000087 	stmdami	r0, {r0, r1, r2, r7}
 424:	f3000000 	vhadd.u8	d0, d0, d0
 428:	0b000001 	bleq	434 <__start-0x7bcc>
 42c:	000001a9 	andeq	r0, r0, r9, lsr #3
 430:	01146e01 	tsteq	r4, r1, lsl #28
 434:	91020000 	mrsls	r0, (UNDEF: 2)
 438:	e4130064 	ldr	r0, [r3], #-100	; 0x64
 43c:	28000087 	stmdacs	r0, {r0, r1, r2, r7}
 440:	0b000000 	bleq	448 <__start-0x7bb8>
 444:	0000021d 	andeq	r0, r0, sp, lsl r2
 448:	003e7701 	eorseq	r7, lr, r1, lsl #14
 44c:	91020000 	mrsls	r0, (UNDEF: 2)
 450:	0d000050 	stceq	0, cr0, [r0, #-320]	; 0xfffffec0
 454:	00021204 	andeq	r1, r2, r4, lsl #4
 458:	00301400 	eorseq	r1, r0, r0, lsl #8
 45c:	300e0000 	andcc	r0, lr, r0
 460:	27000000 	strcs	r0, [r0, -r0]
 464:	0f000002 	svceq	0x00000002
 468:	0000012a 	andeq	r0, r0, sl, lsr #2
 46c:	db0b0010 	blle	2c04b4 <__end+0x1924b4>
 470:	01000001 	tsteq	r0, r1
 474:	00021718 	andeq	r1, r2, r8, lsl r7
 478:	04030500 	streq	r0, [r3], #-1280	; 0x500
 47c:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
 480:	000000c0 	andeq	r0, r0, r0, asr #1
 484:	024e0004 	subeq	r0, lr, #4
 488:	01040000 	mrseq	r0, (UNDEF: 4)
 48c:	000000a3 	andeq	r0, r0, r3, lsr #1
 490:	00022201 	andeq	r2, r2, r1, lsl #4
 494:	00001c00 	andeq	r1, r0, r0, lsl #24
 498:	00885400 	addeq	r5, r8, r0, lsl #8
 49c:	00006400 	andeq	r6, r0, r0, lsl #8
 4a0:	00022200 	andeq	r2, r2, r0, lsl #4
 4a4:	08010200 	stmdaeq	r1, {r9}
 4a8:	00000082 	andeq	r0, r0, r2, lsl #1
 4ac:	38050202 	stmdacc	r5, {r1, r9}
 4b0:	03000001 	movweq	r0, #1
 4b4:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 4b8:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 4bc:	00000005 	andeq	r0, r0, r5
 4c0:	00710400 	rsbseq	r0, r1, r0, lsl #8
 4c4:	16020000 	strne	r0, [r2], -r0
 4c8:	0000004c 	andeq	r0, r0, ip, asr #32
 4cc:	79080102 	stmdbvc	r8, {r1, r8}
 4d0:	02000000 	andeq	r0, r0, #0
 4d4:	00900702 	addseq	r0, r0, r2, lsl #14
 4d8:	04020000 	streq	r0, [r2], #-0
 4dc:	00005407 	andeq	r5, r0, r7, lsl #8
 4e0:	07080200 	streq	r0, [r8, -r0, lsl #4]
 4e4:	0000004a 	andeq	r0, r0, sl, asr #32
 4e8:	00024105 	andeq	r4, r2, r5, lsl #2
 4ec:	540d0100 	strpl	r0, [sp], #-256	; 0x100
 4f0:	14000088 	strne	r0, [r0], #-136	; 0x88
 4f4:	01000000 	mrseq	r0, (UNDEF: 0)
 4f8:	0259059c 	subseq	r0, r9, #156, 10	; 0x27000000
 4fc:	11010000 	mrsne	r0, (UNDEF: 1)
 500:	00008868 	andeq	r8, r0, r8, ror #16
 504:	00000014 	andeq	r0, r0, r4, lsl r0
 508:	4b069c01 	blmi	1a7514 <__end+0x79514>
 50c:	01000002 	tsteq	r0, r2
 510:	00887c15 	addeq	r7, r8, r5, lsl ip
 514:	00002000 	andeq	r2, r0, r0
 518:	ae9c0100 	fmlgee	f0, f4, f0
 51c:	07000000 	streq	r0, [r0, -r0]
 520:	0000021d 	andeq	r0, r0, sp, lsl r2
 524:	00411501 	subeq	r1, r1, r1, lsl #10
 528:	91020000 	mrsls	r0, (UNDEF: 2)
 52c:	14080077 	strne	r0, [r8], #-119	; 0x77
 530:	01000002 	tsteq	r0, r2
 534:	00004119 	andeq	r4, r0, r9, lsl r1
 538:	00889c00 	addeq	r9, r8, r0, lsl #24
 53c:	00001c00 	andeq	r1, r0, r0, lsl #24
 540:	009c0100 	addseq	r0, ip, r0, lsl #2
 544:	000000d5 	ldrdeq	r0, [r0], -r5
 548:	02e00004 	rsceq	r0, r0, #4
 54c:	01040000 	mrseq	r0, (UNDEF: 4)
 550:	000000a3 	andeq	r0, r0, r3, lsr #1
 554:	00027801 	andeq	r7, r2, r1, lsl #16
 558:	00001c00 	andeq	r1, r0, r0, lsl #24
 55c:	0088b800 	addeq	fp, r8, r0, lsl #16
 560:	00008800 	andeq	r8, r0, r0, lsl #16
 564:	00029500 	andeq	r9, r2, r0, lsl #10
 568:	08010200 	stmdaeq	r1, {r9}
 56c:	00000082 	andeq	r0, r0, r2, lsl #1
 570:	38050202 	stmdacc	r5, {r1, r9}
 574:	03000001 	movweq	r0, #1
 578:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 57c:	08020074 	stmdaeq	r2, {r2, r4, r5, r6}
 580:	00000005 	andeq	r0, r0, r5
 584:	08010200 	stmdaeq	r1, {r9}
 588:	00000079 	andeq	r0, r0, r9, ror r0
 58c:	90070202 	andls	r0, r7, r2, lsl #4
 590:	04000000 	streq	r0, [r0], #-0
 594:	00000087 	andeq	r0, r0, r7, lsl #1
 598:	005a1a02 	subseq	r1, sl, r2, lsl #20
 59c:	04020000 	streq	r0, [r2], #-0
 5a0:	00005407 	andeq	r5, r0, r7, lsl #8
 5a4:	07080200 	streq	r0, [r8, -r0, lsl #4]
 5a8:	0000004a 	andeq	r0, r0, sl, asr #32
 5ac:	00029d05 	andeq	r9, r2, r5, lsl #26
 5b0:	b80c0100 	stmdalt	ip, {r8}
 5b4:	20000088 	andcs	r0, r0, r8, lsl #1
 5b8:	01000000 	mrseq	r0, (UNDEF: 0)
 5bc:	00008c9c 	muleq	r0, ip, ip
 5c0:	02980600 	addseq	r0, r8, #0, 12
 5c4:	0c010000 	stceq	0, cr0, [r1], {-0}
 5c8:	00000033 	andeq	r0, r0, r3, lsr r0
 5cc:	00749102 	rsbseq	r9, r4, r2, lsl #2
 5d0:	0002ba07 	andeq	fp, r2, r7, lsl #20
 5d4:	d8100100 	ldmdale	r0, {r8}
 5d8:	18000088 	stmdane	r0, {r3, r7}
 5dc:	01000000 	mrseq	r0, (UNDEF: 0)
 5e0:	02c5089c 	sbceq	r0, r5, #156, 16	; 0x9c0000
 5e4:	14010000 	strne	r0, [r1], #-0
 5e8:	0000004f 	andeq	r0, r0, pc, asr #32
 5ec:	000088f0 	strdeq	r8, [r0], -r0
 5f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 5f4:	a9089c01 	stmdbge	r8, {r0, sl, fp, ip, pc}
 5f8:	01000002 	tsteq	r0, r2
 5fc:	00003318 	andeq	r3, r0, r8, lsl r3
 600:	00890c00 	addeq	r0, r9, r0, lsl #24
 604:	00001c00 	andeq	r1, r0, r0, lsl #24
 608:	079c0100 	ldreq	r0, [ip, r0, lsl #2]
 60c:	00000264 	andeq	r0, r0, r4, ror #4
 610:	89281d01 	stmdbhi	r8!, {r0, r8, sl, fp, ip}
 614:	00180000 	andseq	r0, r8, r0
 618:	9c010000 	stcls	0, cr0, [r1], {-0}
 61c:	00008b00 	andeq	r8, r0, r0, lsl #22
 620:	72000400 	andvc	r0, r0, #0, 8
 624:	04000003 	streq	r0, [r0], #-3
 628:	0000a301 	andeq	sl, r0, r1, lsl #6
 62c:	02d00100 	sbcseq	r0, r0, #0, 2
 630:	001c0000 	andseq	r0, ip, r0
 634:	89400000 	stmdbhi	r0, {}^	; <UNPREDICTABLE>
 638:	00340000 	eorseq	r0, r4, r0
 63c:	030f0000 	movweq	r0, #61440	; 0xf000
 640:	01020000 	mrseq	r0, (UNDEF: 2)
 644:	00008208 	andeq	r8, r0, r8, lsl #4
 648:	05020200 	streq	r0, [r2, #-512]	; 0x200
 64c:	00000138 	andeq	r0, r0, r8, lsr r1
 650:	69050403 	stmdbvs	r5, {r0, r1, sl}
 654:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 658:	00000508 	andeq	r0, r0, r8, lsl #10
 65c:	01020000 	mrseq	r0, (UNDEF: 2)
 660:	00007908 	andeq	r7, r0, r8, lsl #18
 664:	07020200 	streq	r0, [r2, -r0, lsl #4]
 668:	00000090 	muleq	r0, r0, r0
 66c:	00008704 	andeq	r8, r0, r4, lsl #14
 670:	5a1a0200 	bpl	680e78 <__user_program+0x380e78>
 674:	02000000 	andeq	r0, r0, #0
 678:	00540704 	subseq	r0, r4, r4, lsl #14
 67c:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 680:	00004a07 	andeq	r4, r0, r7, lsl #20
 684:	69740500 	ldmdbvs	r4!, {r8, sl}^
 688:	0c010063 	stceq	0, cr0, [r1], {99}	; 0x63
 68c:	00008940 	andeq	r8, r0, r0, asr #18
 690:	00000018 	andeq	r0, r0, r8, lsl r0
 694:	74069c01 	strvc	r9, [r6], #-3073	; 0xc01
 698:	0100636f 	tsteq	r0, pc, ror #6
 69c:	00004f10 	andeq	r4, r0, r0, lsl pc
 6a0:	00895800 	addeq	r5, r9, r0, lsl #16
 6a4:	00001c00 	andeq	r1, r0, r0, lsl #24
 6a8:	009c0100 	addseq	r0, ip, r0, lsl #2
 6ac:	00000057 	andeq	r0, r0, r7, asr r0
 6b0:	03db0002 	bicseq	r0, fp, #2
 6b4:	01040000 	mrseq	r0, (UNDEF: 4)
 6b8:	00000382 	andeq	r0, r0, r2, lsl #7
 6bc:	00008000 	andeq	r8, r0, r0
 6c0:	00008054 	andeq	r8, r0, r4, asr r0
 6c4:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 6c8:	2f6b6269 	svccs	0x006b6269
 6cc:	2f637273 	svccs	0x00637273
 6d0:	746f6f62 	strbtvc	r6, [pc], #-3938	; 6d8 <__start-0x7928>
 6d4:	2f00532e 	svccs	0x0000532e
 6d8:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 6dc:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 6e0:	2f393433 	svccs	0x00393433
 6e4:	6f706572 	svcvs	0x00706572
 6e8:	34362f73 	ldrtcc	r2, [r6], #-3955	; 0xf73
 6ec:	31662d32 	cmncc	r6, r2, lsr sp
 6f0:	6f632f36 	svcvs	0x00632f36
 6f4:	47006564 	strmi	r6, [r0, -r4, ror #10]
 6f8:	4120554e 	teqmi	r0, lr, asr #10
 6fc:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 700:	302e3432 	eorcc	r3, lr, r2, lsr r4
 704:	56800100 	strpl	r0, [r0], r0, lsl #2
 708:	02000000 	andeq	r0, r0, #0
 70c:	0003ef00 	andeq	lr, r3, r0, lsl #30
 710:	da010400 	ble	41718 <__bss_end+0x34718>
 714:	74000003 	strvc	r0, [r0], #-3
 718:	b8000089 	stmdalt	r0, {r0, r3, r7}
 71c:	33000089 	movwcc	r0, #137	; 0x89
 720:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 724:	732f6b62 	teqvc	pc, #100352	; 0x18800
 728:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 72c:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 730:	6f682f00 	svcvs	0x00682f00
 734:	652f656d 	strvs	r6, [pc, #-1389]!	; 1cf <__start-0x7e31>
 738:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 73c:	65722f39 	ldrbvs	r2, [r2, #-3897]!	; 0xf39
 740:	2f736f70 	svccs	0x00736f70
 744:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 748:	2f363166 	svccs	0x00363166
 74c:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 750:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 754:	20534120 	subscs	r4, r3, r0, lsr #2
 758:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 75c:	0100302e 	tsteq	r0, lr, lsr #32
 760:	00005280 	andeq	r5, r0, r0, lsl #5
 764:	03000200 	movweq	r0, #512	; 0x200
 768:	04000004 	streq	r0, [r0], #-4
 76c:	00042b01 	andeq	r2, r4, r1, lsl #22
 770:	0089b800 	addeq	fp, r9, r0, lsl #16
 774:	008b1000 	addeq	r1, fp, r0
 778:	6f6e7500 	svcvs	0x006e7500
 77c:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 780:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
 784:	2f00632e 	svccs	0x0000632e
 788:	656d6f68 	strbvs	r6, [sp, #-3944]!	; 0xf68
 78c:	6563652f 	strbvs	r6, [r3, #-1327]!	; 0x52f
 790:	2f393433 	svccs	0x00393433
 794:	6f706572 	svcvs	0x00706572
 798:	34362f73 	ldrtcc	r2, [r6], #-3955	; 0xf73
 79c:	31662d32 	cmncc	r6, r2, lsr sp
 7a0:	6f632f36 	svcvs	0x00632f36
 7a4:	47006564 	strmi	r6, [r0, -r4, ror #10]
 7a8:	4120554e 	teqmi	r0, lr, asr #10
 7ac:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 7b0:	302e3432 	eorcc	r3, lr, r2, lsr r4
 7b4:	52800100 	addpl	r0, r0, #0, 2
 7b8:	02000000 	andeq	r0, r0, #0
 7bc:	00041700 	andeq	r1, r4, r0, lsl #14
 7c0:	bf010400 	svclt	0x00010400
 7c4:	10000004 	andne	r0, r0, r4
 7c8:	6800008b 	stmdavs	r0, {r0, r1, r3, r7}
 7cc:	6f00008c 	svcvs	0x0000008c
 7d0:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 7d4:	5f657a69 	svcpl	0x00657a69
 7d8:	632e656d 	teqvs	lr, #457179136	; 0x1b400000
 7dc:	6f682f00 	svcvs	0x00682f00
 7e0:	652f656d 	strvs	r6, [pc, #-1389]!	; 27b <__start-0x7d85>
 7e4:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 7e8:	65722f39 	ldrbvs	r2, [r2, #-3897]!	; 0xf39
 7ec:	2f736f70 	svccs	0x00736f70
 7f0:	2d323436 	cfldrscs	mvf3, [r2, #-216]!	; 0xffffff28
 7f4:	2f363166 	svccs	0x00363166
 7f8:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 7fc:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
 800:	20534120 	subscs	r4, r3, r0, lsr #2
 804:	34322e32 	ldrtcc	r2, [r2], #-3634	; 0xe32
 808:	0100302e 	tsteq	r0, lr, lsr #32
 80c:	Address 0x0000080c is out of bounds.
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
<<<<<<< HEAD
  14:	0b0b0024 	bleq	2c00ac <__end+0x1930ac>
=======
  14:	0b0b0024 	bleq	2c00ac <__end+0x1920ac>
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
<<<<<<< HEAD
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a187c>
=======
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a087c>
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
<<<<<<< HEAD
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a187c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd3c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a18d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  c4:	0b3b0b3a 	bleq	ec2db4 <__user_program+0xbc2db4>
  c8:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  cc:	260f0000 	strcs	r0, [pc], -r0
  d0:	00134900 	andseq	r4, r3, r0, lsl #18
  d4:	000f1000 	andeq	r1, pc, r0
  d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  dc:	35110000 	ldrcc	r0, [r1, #-0]
  e0:	00134900 	andseq	r4, r3, r0, lsl #18
  e4:	012e1200 	teqeq	lr, r0, lsl #4
  e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <__user_program+0xbc2ddc>
  f0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
  f4:	05130000 	ldreq	r0, [r3, #-0]
  f8:	00134900 	andseq	r4, r3, r0, lsl #18
  fc:	11010000 	mrsne	r0, (UNDEF: 1)
 100:	130e2501 	movwne	r2, #58625	; 0xe501
 104:	1b0e030b 	blne	380d38 <__user_program+0x80d38>
 108:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 10c:	00171006 	andseq	r1, r7, r6
 110:	00240200 	eoreq	r0, r4, r0, lsl #4
 114:	0b3e0b0b 	bleq	f82d48 <__user_program+0xc82d48>
 118:	00000e03 	andeq	r0, r0, r3, lsl #28
 11c:	0b002403 	bleq	9130 <.LC1+0xa0>
 120:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 124:	04000008 	streq	r0, [r0], #-8
 128:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 12c:	0b3b0b3a 	bleq	ec2e1c <__user_program+0xbc2e1c>
 130:	00001349 	andeq	r1, r0, r9, asr #6
 134:	3f012e05 	svccc	0x00012e05
 138:	3a0e0319 	bcc	380da4 <__user_program+0x80da4>
 13c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 140:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 144:	96184006 	ldrls	r4, [r8], -r6
 148:	13011942 	movwne	r1, #6466	; 0x1942
 14c:	34060000 	strcc	r0, [r6], #-0
 150:	3a080300 	bcc	200d58 <__end+0xd3d58>
 154:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	00180213 	andseq	r0, r8, r3, lsl r2
 15c:	00340700 	eorseq	r0, r4, r0, lsl #14
 160:	0b3a0e03 	bleq	e83974 <__user_program+0xb83974>
 164:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 168:	00001802 	andeq	r1, r0, r2, lsl #16
 16c:	49010108 	stmdbmi	r1, {r3, r8}
 170:	00130113 	andseq	r0, r3, r3, lsl r1
 174:	00210900 	eoreq	r0, r1, r0, lsl #18
 178:	052f1349 	streq	r1, [pc, #-841]!	; fffffe37 <__user_program+0xffcffe37>
 17c:	340a0000 	strcc	r0, [sl], #-0
 180:	3a0e0300 	bcc	380d88 <__user_program+0x80d88>
 184:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 188:	02193f13 	andseq	r3, r9, #19, 30	; 0x4c
 18c:	00000018 	andeq	r0, r0, r8, lsl r0
 190:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 194:	030b130e 	movweq	r1, #45838	; 0xb30e
 198:	110e1b0e 	tstne	lr, lr, lsl #22
 19c:	10061201 	andne	r1, r6, r1, lsl #4
 1a0:	02000017 	andeq	r0, r0, #23
 1a4:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 1a8:	0b3b0b3a 	bleq	ec2e98 <__user_program+0xbc2e98>
 1ac:	00001349 	andeq	r1, r0, r9, asr #6
 1b0:	0b002403 	bleq	91c4 <.LC1+0x134>
 1b4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 1b8:	0400000e 	streq	r0, [r0], #-14
 1bc:	0b0b0024 	bleq	2c0254 <__end+0x193254>
 1c0:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 1c4:	13050000 	movwne	r0, #20480	; 0x5000
 1c8:	0b0e0301 	bleq	380dd4 <__user_program+0x80dd4>
 1cc:	3b0b3a0b 	blcc	2cea00 <__end+0x1a1a00>
 1d0:	0013010b 	andseq	r0, r3, fp, lsl #2
 1d4:	000d0600 	andeq	r0, sp, r0, lsl #12
 1d8:	13490e03 	movtne	r0, #40451	; 0x9e03
 1dc:	19340b38 	ldmdbne	r4!, {r3, r4, r5, r8, r9, fp}
 1e0:	0f070000 	svceq	0x00070000
 1e4:	000b0b00 	andeq	r0, fp, r0, lsl #22
 1e8:	012e0800 	teqeq	lr, r0, lsl #16
 1ec:	0b3a0e03 	bleq	e83a00 <__user_program+0xb83a00>
 1f0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 1f4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 1f8:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 1fc:	00130119 	andseq	r0, r3, r9, lsl r1
 200:	00050900 	andeq	r0, r5, r0, lsl #18
 204:	0b3a0e03 	bleq	e83a18 <__user_program+0xb83a18>
 208:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 20c:	00001802 	andeq	r1, r0, r2, lsl #16
 210:	0300050a 	movweq	r0, #1290	; 0x50a
 214:	3b0b3a08 	blcc	2cea3c <__end+0x1a1a3c>
 218:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 21c:	0b000018 	bleq	284 <__start-0x7d7c>
 220:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 224:	0b3b0b3a 	bleq	ec2f14 <__user_program+0xbc2f14>
 228:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 22c:	340c0000 	strcc	r0, [ip], #-0
 230:	3a080300 	bcc	200e38 <__end+0xd3e38>
 234:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 238:	00180213 	andseq	r0, r8, r3, lsl r2
 23c:	000f0d00 	andeq	r0, pc, r0, lsl #26
 240:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 244:	010e0000 	mrseq	r0, (UNDEF: 14)
 248:	01134901 	tsteq	r3, r1, lsl #18
 24c:	0f000013 	svceq	0x00000013
 250:	13490021 	movtne	r0, #36897	; 0x9021
 254:	00000b2f 	andeq	r0, r0, pc, lsr #22
 258:	3f012e10 	svccc	0x00012e10
 25c:	3a0e0319 	bcc	380ec8 <__user_program+0x80ec8>
 260:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 264:	11134919 	tstne	r3, r9, lsl r9
 268:	40061201 	andmi	r1, r6, r1, lsl #4
 26c:	19429618 	stmdbne	r2, {r3, r4, r9, sl, ip, pc}^
 270:	00001301 	andeq	r1, r0, r1, lsl #6
 274:	00001811 	andeq	r1, r0, r1, lsl r8
 278:	010b1200 	mrseq	r1, R11_fiq
 27c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 280:	00001301 	andeq	r1, r0, r1, lsl #6
 284:	11010b13 	tstne	r1, r3, lsl fp
 288:	00061201 	andeq	r1, r6, r1, lsl #4
 28c:	00261400 	eoreq	r1, r6, r0, lsl #8
 290:	00001349 	andeq	r1, r0, r9, asr #6
 294:	01110100 	tsteq	r1, r0, lsl #2
 298:	0b130e25 	bleq	4c3b34 <__user_program+0x1c3b34>
 29c:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 2a0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2a4:	00001710 	andeq	r1, r0, r0, lsl r7
 2a8:	0b002402 	bleq	92b8 <.LC1+0x228>
 2ac:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2b0:	0300000e 	movweq	r0, #14
 2b4:	0b0b0024 	bleq	2c034c <__end+0x19334c>
 2b8:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 2bc:	16040000 	strne	r0, [r4], -r0
 2c0:	3a0e0300 	bcc	380ec8 <__user_program+0x80ec8>
 2c4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2c8:	05000013 	streq	r0, [r0, #-19]
 2cc:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 2d0:	0b3a0e03 	bleq	e83ae4 <__user_program+0xb83ae4>
 2d4:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2d8:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2dc:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 2e0:	06000019 			; <UNDEFINED> instruction: 0x06000019
 2e4:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 2e8:	0b3a0e03 	bleq	e83afc <__user_program+0xb83afc>
 2ec:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 2f0:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2f4:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2f8:	07000019 	smladeq	r0, r9, r0, r0
 2fc:	193f012e 	ldmdbne	pc!, {r1, r2, r3, r5, r8}	; <UNPREDICTABLE>
 300:	0b3a0e03 	bleq	e83b14 <__user_program+0xb83b14>
 304:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 308:	06120111 			; <UNDEFINED> instruction: 0x06120111
 30c:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 310:	00130119 	andseq	r0, r3, r9, lsl r1
 314:	00050800 	andeq	r0, r5, r0, lsl #16
 318:	0b3a0e03 	bleq	e83b2c <__user_program+0xb83b2c>
 31c:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 320:	00001802 	andeq	r1, r0, r2, lsl #16
 324:	3f012e09 	svccc	0x00012e09
 328:	3a0e0319 	bcc	380f94 <__user_program+0x80f94>
 32c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 330:	11134919 	tstne	r3, r9, lsl r9
 334:	40061201 	andmi	r1, r6, r1, lsl #4
 338:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 33c:	00001301 	andeq	r1, r0, r1, lsl #6
 340:	0300340a 	movweq	r3, #1034	; 0x40a
 344:	3b0b3a0e 	blcc	2ceb84 <__end+0x1a1b84>
 348:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 34c:	0b000018 	bleq	3b4 <__start-0x7c4c>
 350:	0b0b000f 	bleq	2c0394 <__end+0x193394>
 354:	00001349 	andeq	r1, r0, r9, asr #6
 358:	4900350c 	stmdbmi	r0, {r2, r3, r8, sl, ip, sp}
 35c:	00000013 	andeq	r0, r0, r3, lsl r0
 360:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 364:	030b130e 	movweq	r1, #45838	; 0xb30e
 368:	110e1b0e 	tstne	lr, lr, lsl #22
 36c:	10061201 	andne	r1, r6, r1, lsl #4
 370:	02000017 	andeq	r0, r0, #23
 374:	0b0b0024 	bleq	2c040c <__end+0x19340c>
 378:	0e030b3e 	vmoveq.16	d3[0], r0
 37c:	24030000 	strcs	r0, [r3], #-0
 380:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 384:	0008030b 	andeq	r0, r8, fp, lsl #6
 388:	00160400 	andseq	r0, r6, r0, lsl #8
 38c:	0b3a0e03 	bleq	e83ba0 <__user_program+0xb83ba0>
 390:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 394:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 398:	03193f01 	tsteq	r9, #1, 30
 39c:	3b0b3a0e 	blcc	2cebdc <__end+0x1a1bdc>
 3a0:	1119270b 	tstne	r9, fp, lsl #14
 3a4:	40061201 	andmi	r1, r6, r1, lsl #4
 3a8:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 3ac:	00001301 	andeq	r1, r0, r1, lsl #6
 3b0:	03000506 	movweq	r0, #1286	; 0x506
 3b4:	3b0b3a0e 	blcc	2cebf4 <__end+0x1a1bf4>
 3b8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 3bc:	07000018 	smladeq	r0, r8, r0, r0
 3c0:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 3c4:	0b3a0e03 	bleq	e83bd8 <__user_program+0xb83bd8>
 3c8:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3cc:	06120111 			; <UNDEFINED> instruction: 0x06120111
 3d0:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 3d4:	08000019 	stmdaeq	r0, {r0, r3, r4}
 3d8:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 3dc:	0b3a0e03 	bleq	e83bf0 <__user_program+0xb83bf0>
 3e0:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 3e4:	01111349 	tsteq	r1, r9, asr #6
 3e8:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 3ec:	00194297 	mulseq	r9, r7, r2
 3f0:	11010000 	mrsne	r0, (UNDEF: 1)
 3f4:	130e2501 	movwne	r2, #58625	; 0xe501
 3f8:	1b0e030b 	blne	38102c <__user_program+0x8102c>
 3fc:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 400:	00171006 	andseq	r1, r7, r6
 404:	00240200 	eoreq	r0, r4, r0, lsl #4
 408:	0b3e0b0b 	bleq	f8303c <__user_program+0xc8303c>
 40c:	00000e03 	andeq	r0, r0, r3, lsl #28
 410:	0b002403 	bleq	9424 <.LC1+0x394>
 414:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 418:	04000008 	streq	r0, [r0], #-8
 41c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 420:	0b3b0b3a 	bleq	ec3110 <__user_program+0xbc3110>
 424:	00001349 	andeq	r1, r0, r9, asr #6
 428:	3f002e05 	svccc	0x00002e05
 42c:	3a080319 	bcc	201098 <__end+0xd4098>
 430:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 434:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 438:	97184006 	ldrls	r4, [r8, -r6]
 43c:	00001942 	andeq	r1, r0, r2, asr #18
 440:	3f012e06 	svccc	0x00012e06
 444:	3a080319 	bcc	2010b0 <__end+0xd40b0>
 448:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 44c:	11134919 	tstne	r3, r9, lsl r9
 450:	40061201 	andmi	r1, r6, r1, lsl #4
 454:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 458:	00001301 	andeq	r1, r0, r1, lsl #6
 45c:	03003407 	movweq	r3, #1031	; 0x407
 460:	3b0b3a0e 	blcc	2ceca0 <__end+0x1a1ca0>
 464:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 468:	08000018 	stmdaeq	r0, {r3, r4}
 46c:	0b0b000f 	bleq	2c04b0 <__end+0x1934b0>
 470:	00001349 	andeq	r1, r0, r9, asr #6
 474:	49003509 	stmdbmi	r0, {r0, r3, r8, sl, ip, sp}
 478:	00000013 	andeq	r0, r0, r3, lsl r0
 47c:	10001101 	andne	r1, r0, r1, lsl #2
 480:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 484:	1b080301 	blne	201090 <__end+0xd4090>
 488:	13082508 	movwne	r2, #34056	; 0x8508
 48c:	00000005 	andeq	r0, r0, r5
 490:	10001101 	andne	r1, r0, r1, lsl #2
 494:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 498:	1b080301 	blne	2010a4 <__end+0xd40a4>
 49c:	13082508 	movwne	r2, #34056	; 0x8508
 4a0:	00000005 	andeq	r0, r0, r5
 4a4:	10001101 	andne	r1, r0, r1, lsl #2
 4a8:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 4ac:	1b080301 	blne	2010b8 <__end+0xd40b8>
 4b0:	13082508 	movwne	r2, #34056	; 0x8508
 4b4:	00000005 	andeq	r0, r0, r5
 4b8:	10001101 	andne	r1, r0, r1, lsl #2
 4bc:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 4c0:	1b080301 	blne	2010cc <__end+0xd40cc>
 4c4:	13082508 	movwne	r2, #34056	; 0x8508
 4c8:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	38500001 	ldmdacc	r0, {r0}^
   c:	54000000 	strpl	r0, [r0], #-0
  10:	04000000 	streq	r0, [r0], #-0
  14:	5001f300 	andpl	pc, r1, r0, lsl #6
  18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  1c:	00000000 	andeq	r0, r0, r0
  20:	00000c00 	andeq	r0, r0, r0, lsl #24
  24:	00003800 	andeq	r3, r0, r0, lsl #16
  28:	70000e00 	andvc	r0, r0, r0, lsl #28
  2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
  30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
  34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
  38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
  3c:	00005400 	andeq	r5, r0, r0, lsl #8
  40:	f3000f00 	vpmax.f32	d0, d0, d0
  44:	25f75001 	ldrbcs	r5, [r7, #1]!
  48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
  4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
  50:	00009f1a 	andeq	r9, r0, sl, lsl pc
  54:	00000000 	andeq	r0, r0, r0
  58:	00300000 	eorseq	r0, r0, r0
  5c:	004c0000 	subeq	r0, ip, r0
  60:	00010000 	andeq	r0, r1, r0
  64:	00004c52 	andeq	r4, r0, r2, asr ip
  68:	00005400 	andeq	r5, r0, r0, lsl #8
  6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
  78:	00000040 	andeq	r0, r0, r0, asr #32
  7c:	0000004c 	andeq	r0, r0, ip, asr #32
  80:	00500001 	subseq	r0, r0, r1
  84:	00000000 	andeq	r0, r0, r0
  88:	54000000 	strpl	r0, [r0], #-0
  8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
  90:	01000000 	mrseq	r0, (UNDEF: 0)
  94:	00685000 	rsbeq	r5, r8, r0
  98:	00800000 	addeq	r0, r0, r0
  9c:	00040000 	andeq	r0, r4, r0
  a0:	9f5001f3 	svcls	0x005001f3
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	00000088 	andeq	r0, r0, r8, lsl #1
  ac:	88500001 	ldmdahi	r0, {r0}^
  b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
  b4:	04000000 	streq	r0, [r0], #-0
  b8:	5001f300 	andpl	pc, r1, r0, lsl #6
  bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  c0:	00000000 	andeq	r0, r0, r0
  c4:	00009800 	andeq	r9, r0, r0, lsl #16
  c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
  cc:	50000100 	andpl	r0, r0, r0, lsl #2
  d0:	000000ac 	andeq	r0, r0, ip, lsr #1
  d4:	000000c4 	andeq	r0, r0, r4, asr #1
  d8:	01f30004 	mvnseq	r0, r4
  dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
  e0:	00cc0000 	sbceq	r0, ip, r0
  e4:	00010000 	andeq	r0, r1, r0
  e8:	0000cc50 	andeq	ip, r0, r0, asr ip
  ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
  f0:	f3000400 	vshl.u8	d0, d0, d0
  f4:	009f5001 	addseq	r5, pc, r1
  f8:	00000000 	andeq	r0, r0, r0
  fc:	dc000000 	stcle	0, cr0, [r0], {-0}
 100:	00000000 	andeq	r0, r0, r0
 104:	01000001 	tsteq	r0, r1
 108:	01005000 	mrseq	r5, (UNDEF: 0)
 10c:	01600000 	cmneq	r0, r0
 110:	00040000 	andeq	r0, r4, r0
 114:	9f5001f3 	svcls	0x005001f3
	...
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00000103 	andeq	r0, r0, r3, lsl #2
 128:	03510001 	cmpeq	r1, #1
 12c:	60000001 	andvs	r0, r0, r1
 130:	04000001 	streq	r0, [r0], #-1
 134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 13c:	00000000 	andeq	r0, r0, r0
	...
=======
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a087c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000018 	smladeq	r0, r8, r0, r0
  60:	08030034 	stmdaeq	r3, {r2, r4, r5}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a0e0300 	bcc	380c78 <__user_program+0x80c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00180213 	andseq	r0, r8, r3, lsl r2
  7c:	012e0900 	teqeq	lr, r0, lsl #18
  80:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  84:	0b3b0b3a 	bleq	ec2d74 <__user_program+0xbc2d74>
  88:	01111927 	tsteq	r1, r7, lsr #18
  8c:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
  90:	01194296 			; <UNDEFINED> instruction: 0x01194296
  94:	0a000013 	beq	e8 <__start-0x7f18>
  98:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
  9c:	0b3b0b3a 	bleq	ec2d8c <__user_program+0xbc2d8c>
  a0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  a4:	0f0b0000 	svceq	0x000b0000
  a8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
  ac:	0c000013 	stceq	0, cr0, [r0], {19}
  b0:	13490035 	movtne	r0, #36917	; 0x9035
  b4:	01000000 	mrseq	r0, (UNDEF: 0)
  b8:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
  bc:	0e030b13 	vmoveq.32	d3[0], r0
  c0:	01110e1b 	tsteq	r1, fp, lsl lr
  c4:	17100612 			; <UNDEFINED> instruction: 0x17100612
  c8:	24020000 	strcs	r0, [r2], #-0
  cc:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  d0:	000e030b 	andeq	r0, lr, fp, lsl #6
  d4:	00240300 	eoreq	r0, r4, r0, lsl #6
  d8:	0b3e0b0b 	bleq	f82d0c <__user_program+0xc82d0c>
  dc:	00000803 	andeq	r0, r0, r3, lsl #16
  e0:	03001604 	movweq	r1, #1540	; 0x604
  e4:	3b0b3a0e 	blcc	2ce924 <__end+0x1a0924>
  e8:	0013490b 	andseq	r4, r3, fp, lsl #18
  ec:	012e0500 	teqeq	lr, r0, lsl #10
  f0:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  f4:	0b3b0b3a 	bleq	ec2de4 <__user_program+0xbc2de4>
  f8:	01111927 	tsteq	r1, r7, lsr #18
  fc:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 100:	01194296 			; <UNDEFINED> instruction: 0x01194296
 104:	06000013 			; <UNDEFINED> instruction: 0x06000013
 108:	08030034 	stmdaeq	r3, {r2, r4, r5}
 10c:	0b3b0b3a 	bleq	ec2dfc <__user_program+0xbc2dfc>
 110:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 114:	34070000 	strcc	r0, [r7], #-0
 118:	3a0e0300 	bcc	380d20 <__user_program+0x80d20>
 11c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 120:	00180213 	andseq	r0, r8, r3, lsl r2
 124:	01010800 	tsteq	r1, r0, lsl #16
 128:	13011349 	movwne	r1, #4937	; 0x1349
 12c:	21090000 	mrscs	r0, (UNDEF: 9)
 130:	2f134900 	svccs	0x00134900
 134:	0a000005 	beq	150 <__start-0x7eb0>
 138:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 13c:	0b3b0b3a 	bleq	ec2e2c <__user_program+0xbc2e2c>
 140:	193f1349 	ldmdbne	pc!, {r0, r3, r6, r8, r9, ip}	; <UNPREDICTABLE>
 144:	00001802 	andeq	r1, r0, r2, lsl #16
 148:	01110100 	tsteq	r1, r0, lsl #2
 14c:	0b130e25 	bleq	4c39e8 <__user_program+0x1c39e8>
 150:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 154:	06120111 			; <UNDEFINED> instruction: 0x06120111
 158:	00001710 	andeq	r1, r0, r0, lsl r7
 15c:	03001602 	movweq	r1, #1538	; 0x602
 160:	3b0b3a0e 	blcc	2ce9a0 <__end+0x1a09a0>
 164:	0013490b 	andseq	r4, r3, fp, lsl #18
 168:	00240300 	eoreq	r0, r4, r0, lsl #6
 16c:	0b3e0b0b 	bleq	f82da0 <__user_program+0xc82da0>
 170:	00000e03 	andeq	r0, r0, r3, lsl #28
 174:	0b002404 	bleq	918c <__clzsi2+0x1a0>
 178:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 17c:	05000008 	streq	r0, [r0, #-8]
 180:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 184:	0b3a0b0b 	bleq	e82db8 <__user_program+0xb82db8>
 188:	13010b3b 	movwne	r0, #6971	; 0x1b3b
 18c:	0d060000 	stceq	0, cr0, [r6, #-0]
 190:	490e0300 	stmdbmi	lr, {r8, r9}
 194:	340b3813 	strcc	r3, [fp], #-2067	; 0x813
 198:	07000019 	smladeq	r0, r9, r0, r0
 19c:	0b0b000f 	bleq	2c01e0 <__end+0x1921e0>
 1a0:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 1a4:	3a0e0301 	bcc	380db0 <__user_program+0x80db0>
 1a8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1ac:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 1b0:	96184006 	ldrls	r4, [r8], -r6
 1b4:	13011942 	movwne	r1, #6466	; 0x1942
 1b8:	05090000 	streq	r0, [r9, #-0]
 1bc:	3a0e0300 	bcc	380dc4 <__user_program+0x80dc4>
 1c0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1c4:	00180213 	andseq	r0, r8, r3, lsl r2
 1c8:	00050a00 	andeq	r0, r5, r0, lsl #20
 1cc:	0b3a0803 	bleq	e821e0 <__user_program+0xb821e0>
 1d0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1d4:	00001802 	andeq	r1, r0, r2, lsl #16
 1d8:	0300340b 	movweq	r3, #1035	; 0x40b
 1dc:	3b0b3a0e 	blcc	2cea1c <__end+0x1a0a1c>
 1e0:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1e4:	0c000018 	stceq	0, cr0, [r0], {24}
 1e8:	08030034 	stmdaeq	r3, {r2, r4, r5}
 1ec:	0b3b0b3a 	bleq	ec2edc <__user_program+0xbc2edc>
 1f0:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
 1f4:	0f0d0000 	svceq	0x000d0000
 1f8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 1fc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
 200:	13490101 	movtne	r0, #37121	; 0x9101
 204:	00001301 	andeq	r1, r0, r1, lsl #6
 208:	4900210f 	stmdbmi	r0, {r0, r1, r2, r3, r8, sp}
 20c:	000b2f13 	andeq	r2, fp, r3, lsl pc
 210:	012e1000 	teqeq	lr, r0
 214:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 218:	0b3b0b3a 	bleq	ec2f08 <__user_program+0xbc2f08>
 21c:	13491927 	movtne	r1, #39207	; 0x9927
 220:	06120111 			; <UNDEFINED> instruction: 0x06120111
 224:	42961840 	addsmi	r1, r6, #64, 16	; 0x400000
 228:	00130119 	andseq	r0, r3, r9, lsl r1
 22c:	00181100 	andseq	r1, r8, r0, lsl #2
 230:	0b120000 	bleq	480238 <__user_program+0x180238>
 234:	12011101 	andne	r1, r1, #1073741824	; 0x40000000
 238:	00130106 	andseq	r0, r3, r6, lsl #2
 23c:	010b1300 	mrseq	r1, (UNDEF: 59)
 240:	06120111 			; <UNDEFINED> instruction: 0x06120111
 244:	26140000 	ldrcs	r0, [r4], -r0
 248:	00134900 	andseq	r4, r3, r0, lsl #18
 24c:	11010000 	mrsne	r0, (UNDEF: 1)
 250:	130e2501 	movwne	r2, #58625	; 0xe501
 254:	1b0e030b 	blne	380e88 <__user_program+0x80e88>
 258:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 25c:	00171006 	andseq	r1, r7, r6
 260:	00240200 	eoreq	r0, r4, r0, lsl #4
 264:	0b3e0b0b 	bleq	f82e98 <__user_program+0xc82e98>
 268:	00000e03 	andeq	r0, r0, r3, lsl #28
 26c:	0b002403 	bleq	9280 <__clzsi2+0x294>
 270:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 274:	04000008 	streq	r0, [r0], #-8
 278:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 27c:	0b3b0b3a 	bleq	ec2f6c <__user_program+0xbc2f6c>
 280:	00001349 	andeq	r1, r0, r9, asr #6
 284:	3f002e05 	svccc	0x00002e05
 288:	3a0e0319 	bcc	380ef4 <__user_program+0x80ef4>
 28c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 290:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 294:	97184006 	ldrls	r4, [r8, -r6]
 298:	00001942 	andeq	r1, r0, r2, asr #18
 29c:	3f012e06 	svccc	0x00012e06
 2a0:	3a0e0319 	bcc	380f0c <__user_program+0x80f0c>
 2a4:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2a8:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 2ac:	97184006 	ldrls	r4, [r8, -r6]
 2b0:	13011942 	movwne	r1, #6466	; 0x1942
 2b4:	05070000 	streq	r0, [r7, #-0]
 2b8:	3a0e0300 	bcc	380ec0 <__user_program+0x80ec0>
 2bc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2c0:	00180213 	andseq	r0, r8, r3, lsl r2
 2c4:	002e0800 	eoreq	r0, lr, r0, lsl #16
 2c8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 2cc:	0b3b0b3a 	bleq	ec2fbc <__user_program+0xbc2fbc>
 2d0:	13491927 	movtne	r1, #39207	; 0x9927
 2d4:	06120111 			; <UNDEFINED> instruction: 0x06120111
 2d8:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 2dc:	00000019 	andeq	r0, r0, r9, lsl r0
 2e0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 2e4:	030b130e 	movweq	r1, #45838	; 0xb30e
 2e8:	110e1b0e 	tstne	lr, lr, lsl #22
 2ec:	10061201 	andne	r1, r6, r1, lsl #4
 2f0:	02000017 	andeq	r0, r0, #23
 2f4:	0b0b0024 	bleq	2c038c <__end+0x19238c>
 2f8:	0e030b3e 	vmoveq.16	d3[0], r0
 2fc:	24030000 	strcs	r0, [r3], #-0
 300:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 304:	0008030b 	andeq	r0, r8, fp, lsl #6
 308:	00160400 	andseq	r0, r6, r0, lsl #8
 30c:	0b3a0e03 	bleq	e83b20 <__user_program+0xb83b20>
 310:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 314:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
 318:	03193f01 	tsteq	r9, #1, 30
 31c:	3b0b3a0e 	blcc	2ceb5c <__end+0x1a0b5c>
 320:	1119270b 	tstne	r9, fp, lsl #14
 324:	40061201 	andmi	r1, r6, r1, lsl #4
 328:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 32c:	00001301 	andeq	r1, r0, r1, lsl #6
 330:	03000506 	movweq	r0, #1286	; 0x506
 334:	3b0b3a0e 	blcc	2ceb74 <__end+0x1a0b74>
 338:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 33c:	07000018 	smladeq	r0, r8, r0, r0
 340:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 344:	0b3a0e03 	bleq	e83b58 <__user_program+0xb83b58>
 348:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 34c:	06120111 			; <UNDEFINED> instruction: 0x06120111
 350:	42971840 	addsmi	r1, r7, #64, 16	; 0x400000
 354:	08000019 	stmdaeq	r0, {r0, r3, r4}
 358:	193f002e 	ldmdbne	pc!, {r1, r2, r3, r5}	; <UNPREDICTABLE>
 35c:	0b3a0e03 	bleq	e83b70 <__user_program+0xb83b70>
 360:	19270b3b 	stmdbne	r7!, {r0, r1, r3, r4, r5, r8, r9, fp}
 364:	01111349 	tsteq	r1, r9, asr #6
 368:	18400612 	stmdane	r0, {r1, r4, r9, sl}^
 36c:	00194297 	mulseq	r9, r7, r2
 370:	11010000 	mrsne	r0, (UNDEF: 1)
 374:	130e2501 	movwne	r2, #58625	; 0xe501
 378:	1b0e030b 	blne	380fac <__user_program+0x80fac>
 37c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 380:	00171006 	andseq	r1, r7, r6
 384:	00240200 	eoreq	r0, r4, r0, lsl #4
 388:	0b3e0b0b 	bleq	f82fbc <__user_program+0xc82fbc>
 38c:	00000e03 	andeq	r0, r0, r3, lsl #28
 390:	0b002403 	bleq	93a4 <__clzsi2+0x3b8>
 394:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 398:	04000008 	streq	r0, [r0], #-8
 39c:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 3a0:	0b3b0b3a 	bleq	ec3090 <__user_program+0xbc3090>
 3a4:	00001349 	andeq	r1, r0, r9, asr #6
 3a8:	3f002e05 	svccc	0x00002e05
 3ac:	3a080319 	bcc	201018 <__end+0xd3018>
 3b0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3b4:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 3b8:	97184006 	ldrls	r4, [r8, -r6]
 3bc:	00001942 	andeq	r1, r0, r2, asr #18
 3c0:	3f002e06 	svccc	0x00002e06
 3c4:	3a080319 	bcc	201030 <__end+0xd3030>
 3c8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3cc:	11134919 	tstne	r3, r9, lsl r9
 3d0:	40061201 	andmi	r1, r6, r1, lsl #4
 3d4:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
 3d8:	01000000 	mrseq	r0, (UNDEF: 0)
 3dc:	06100011 			; <UNDEFINED> instruction: 0x06100011
 3e0:	01120111 	tsteq	r2, r1, lsl r1
 3e4:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 3e8:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 3ec:	01000000 	mrseq	r0, (UNDEF: 0)
 3f0:	06100011 			; <UNDEFINED> instruction: 0x06100011
 3f4:	01120111 	tsteq	r2, r1, lsl r1
 3f8:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 3fc:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 400:	01000000 	mrseq	r0, (UNDEF: 0)
 404:	06100011 			; <UNDEFINED> instruction: 0x06100011
 408:	01120111 	tsteq	r2, r1, lsl r1
 40c:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 410:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 414:	01000000 	mrseq	r0, (UNDEF: 0)
 418:	06100011 			; <UNDEFINED> instruction: 0x06100011
 41c:	01120111 	tsteq	r2, r1, lsl r1
 420:	081b0803 	ldmdaeq	fp, {r0, r1, fp}
 424:	05130825 	ldreq	r0, [r3, #-2085]	; 0x825
 428:	Address 0x00000428 is out of bounds.

>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
<<<<<<< HEAD
  14:	00000160 	andeq	r0, r0, r0, ror #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01b50002 			; <UNDEFINED> instruction: 0x01b50002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  34:	00000158 	andeq	r0, r0, r8, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	02960002 	addseq	r0, r6, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	0000830c 	andeq	r8, r0, ip, lsl #6
  54:	00000388 	andeq	r0, r0, r8, lsl #7
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04cf0002 	strbeq	r0, [pc], #2	; 6c <__start-0x7f94>
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008694 	muleq	r0, r4, r6
  74:	0000018c 	andeq	r0, r0, ip, lsl #3
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	06440002 	strbeq	r0, [r4], -r2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008820 	andeq	r8, r0, r0, lsr #16
  94:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	071d0002 	ldreq	r0, [sp, -r2]
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	000088a8 	andeq	r8, r0, r8, lsr #17
  b4:	000000cc 	andeq	r0, r0, ip, asr #1
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	08300002 	ldmdaeq	r0!, {r1}
=======
  14:	00000320 	andeq	r0, r0, r0, lsr #6
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01660002 	cmneq	r6, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	00008374 	andeq	r8, r0, r4, ror r3
  34:	00000158 	andeq	r0, r0, r8, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	02470002 	subeq	r0, r7, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	000084cc 	andeq	r8, r0, ip, asr #9
  54:	00000388 	andeq	r0, r0, r8, lsl #7
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	04800002 	streq	r0, [r0], #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008854 	andeq	r8, r0, r4, asr r8
  74:	00000064 	andeq	r0, r0, r4, rrx
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	05440002 	strbeq	r0, [r4, #-2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	000088b8 			; <UNDEFINED> instruction: 0x000088b8
  94:	00000088 	andeq	r0, r0, r8, lsl #1
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	061d0002 	ldreq	r0, [sp], -r2
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00008940 	andeq	r8, r0, r0, asr #18
  b4:	00000034 	andeq	r0, r0, r4, lsr r0
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	06ac0002 	strteq	r0, [ip], r2
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00008000 	andeq	r8, r0, r0
  d4:	00000054 	andeq	r0, r0, r4, asr r0
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
<<<<<<< HEAD
  e4:	08850002 	stmeq	r5, {r1}
=======
  e4:	07070002 	streq	r0, [r7, -r2]
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00008974 	andeq	r8, r0, r4, ror r9
  f4:	00000044 	andeq	r0, r0, r4, asr #32
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
<<<<<<< HEAD
 104:	08d90002 	ldmeq	r9, {r1}^
=======
 104:	07610002 	strbeq	r0, [r1, -r2]!
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000089b8 			; <UNDEFINED> instruction: 0x000089b8
 114:	00000158 	andeq	r0, r0, r8, asr r1
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
<<<<<<< HEAD
 124:	09290002 	stmdbeq	r9!, {r1}
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008b10 	andeq	r8, r0, r0, lsl fp
 134:	000000e0 	andeq	r0, r0, r0, ror #1
=======
 124:	07b70002 	ldreq	r0, [r7, r2]!
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00008b10 	andeq	r8, r0, r0, lsl fp
 134:	00000158 	andeq	r0, r0, r8, asr r1
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
<<<<<<< HEAD
   0:	00000082 	andeq	r0, r0, r2, lsl #1
   4:	004f0002 	subeq	r0, pc, r2
=======
   0:	00000092 	muleq	r0, r2, r0
   4:	00460002 	subeq	r0, r6, r2
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
<<<<<<< HEAD
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d303 	tsteq	r0, r3, lsl #6
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	0006024b 	andeq	r0, r6, fp, asr #4
  84:	00ae0101 	adceq	r0, lr, r1, lsl #2
  88:	00020000 	andeq	r0, r2, r0
  8c:	00000054 	andeq	r0, r0, r4, asr r0
  90:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  94:	0101000d 	tsteq	r1, sp
  98:	00000101 	andeq	r0, r0, r1, lsl #2
  9c:	00000100 	andeq	r0, r0, r0, lsl #2
  a0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  a4:	5f6c656e 	svcpl	0x006c656e
  a8:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
  ac:	617a696d 	cmnvs	sl, sp, ror #18
  b0:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
  b4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  b8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  bc:	6b62696c 	blvs	189a674 <__user_program+0x159a674>
  c0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  c4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  c8:	656b0000 	strbvs	r0, [fp, #-0]!
  cc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  d0:	0100632e 	tsteq	r0, lr, lsr #6
  d4:	736b0000 	cmnvc	fp, #0
  d8:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  dc:	00682e74 	rsbeq	r2, r8, r4, ror lr
  e0:	00000002 	andeq	r0, r0, r2
  e4:	b4020500 	strlt	r0, [r2], #-1280	; 0x500
  e8:	03000081 	movweq	r0, #129	; 0x81
  ec:	4d670117 	stfmie	f0, [r7, #-92]!	; 0xffffffa4
  f0:	04020030 	streq	r0, [r2], #-48	; 0x30
  f4:	02006803 	andeq	r6, r0, #196608	; 0x30000
  f8:	009f0304 	addseq	r0, pc, r4, lsl #6
  fc:	9b030402 	blls	c110c <__bss_end+0xb510c>
 100:	01040200 	mrseq	r0, R12_usr
 104:	6d066606 	stcvs	6, cr6, [r6, #-24]	; 0xffffffe8
 108:	4b672f67 	blmi	19cbeac <__user_program+0x16cbeac>
 10c:	672f6785 	strvs	r6, [pc, -r5, lsl #15]!
 110:	0868854b 	stmdaeq	r8!, {r0, r1, r3, r6, r8, sl, pc}^
 114:	004b673f 	subeq	r6, fp, pc, lsr r7
 118:	03020402 	movweq	r0, #9218	; 0x2402
 11c:	02002e79 	andeq	r2, r0, #1936	; 0x790
 120:	66060104 	strvs	r0, [r6], -r4, lsl #2
 124:	660a0306 	strvs	r0, [sl], -r6, lsl #6
 128:	04020069 	streq	r0, [r2], #-105	; 0x69
 12c:	02006a01 	andeq	r6, r0, #4096	; 0x1000
 130:	02670104 	rsbeq	r0, r7, #4, 2
 134:	01010002 	tsteq	r1, r2
 138:	000000d6 	ldrdeq	r0, [r0], -r6
 13c:	006f0002 	rsbeq	r0, pc, r2
 140:	01020000 	mrseq	r0, (UNDEF: 2)
 144:	000d0efb 	strdeq	r0, [sp], -fp
 148:	01010101 	tsteq	r1, r1, lsl #2
 14c:	01000000 	mrseq	r0, (UNDEF: 0)
 150:	6b010000 	blvs	40158 <__bss_end+0x34158>
 154:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 158:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 15c:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 160:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 164:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 168:	33006372 	movwcc	r6, #882	; 0x372
 16c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 170:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 174:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 178:	00006564 	andeq	r6, r0, r4, ror #10
 17c:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 180:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 184:	00000100 	andeq	r0, r0, r0, lsl #2
 188:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 18c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 190:	00020068 	andeq	r0, r2, r8, rrx
 194:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 198:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
 19c:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1a0:	623c0000 	eorsvs	r0, ip, #0
 1a4:	746c6975 	strbtvc	r6, [ip], #-2421	; 0x975
 1a8:	3e6e692d 	cdpcc	9, 6, cr6, cr14, cr13, {1}
 1ac:	00000000 	andeq	r0, r0, r0
 1b0:	02050000 	andeq	r0, r5, #0
 1b4:	0000830c 	andeq	r8, r0, ip, lsl #6
 1b8:	d7012003 	strle	r2, [r1, -r3]
 1bc:	8367694c 	cmnhi	r7, #76, 18	; 0x130000
 1c0:	04020067 	streq	r0, [r2], #-103	; 0x67
 1c4:	02006b01 	andeq	r6, r0, #1024	; 0x400
 1c8:	ad080104 	stfges	f0, [r8, #-16]
 1cc:	01040200 	mrseq	r0, R12_usr
 1d0:	2f6769d7 	svccs	0x006769d7
 1d4:	812f86b9 			; <UNDEFINED> instruction: 0x812f86b9
 1d8:	4d854df5 	stcmi	13, cr4, [r5, #980]	; 0x3d4
 1dc:	30bb8330 	adcscc	r8, fp, r0, lsr r3
 1e0:	15320268 	ldrne	r0, [r2, #-616]!	; 0x268
 1e4:	be4b679f 	mcrlt	7, 2, r6, cr11, cr15, {4}
 1e8:	9f32a02c 	svcls	0x0032a02c
 1ec:	9f9f329f 	svcls	0x009f329f
 1f0:	329f9f33 	addscc	r9, pc, #51, 30	; 0xcc
 1f4:	64832f9f 	strvs	r2, [r3], #3999	; 0xf9f
 1f8:	839f3286 	orrshi	r3, pc, #1610612744	; 0x60000008
 1fc:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 200:	667fbf03 	ldrbtvs	fp, [pc], -r3, lsl #30
 204:	8200c503 	andhi	ip, r0, #12582912	; 0xc00000
 208:	01040200 	mrseq	r0, R12_usr
 20c:	000a022f 	andeq	r0, sl, pc, lsr #4
 210:	00820101 	addeq	r0, r2, r1, lsl #2
 214:	00020000 	andeq	r0, r2, r0
 218:	00000052 	andeq	r0, r0, r2, asr r0
 21c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 220:	0101000d 	tsteq	r1, sp
 224:	00000101 	andeq	r0, r0, r1, lsl #2
 228:	00000100 	andeq	r0, r0, r0, lsl #2
 22c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 230:	5f6c656e 	svcpl	0x006c656e
 234:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 238:	617a696d 	cmnvs	sl, sp, ror #18
 23c:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
 240:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 244:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 248:	6b62696c 	blvs	189a800 <__user_program+0x159a800>
 24c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 250:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 254:	61750000 	cmnvs	r5, r0
 258:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 25c:	00000100 	andeq	r0, r0, r0, lsl #2
 260:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 264:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 268:	00020068 	andeq	r0, r2, r8, rrx
 26c:	05000000 	streq	r0, [r0, #-0]
 270:	00869402 	addeq	r9, r6, r2, lsl #8
 274:	01380300 	teqeq	r8, r0, lsl #6
 278:	6768674c 	strbvs	r6, [r8, -ip, asr #14]!
 27c:	a0a0a069 	adcge	sl, r0, r9, rrx
 280:	339f9fa1 	orrscc	r9, pc, #644	; 0x284
 284:	a46d9f4b 	strbtge	r9, [sp], #-3915	; 0xf4b
 288:	9f3130d7 	svcls	0x003130d7
 28c:	30d76c6d 	sbcscc	r6, r7, sp, ror #24
 290:	022fa030 	eoreq	sl, pc, #48	; 0x30
 294:	01010008 	tsteq	r1, r8
 298:	00000076 	andeq	r0, r0, r6, ror r0
 29c:	00530002 	subseq	r0, r3, r2
 2a0:	01020000 	mrseq	r0, (UNDEF: 2)
 2a4:	000d0efb 	strdeq	r0, [sp], -fp
 2a8:	01010101 	tsteq	r1, r1, lsl #2
 2ac:	01000000 	mrseq	r0, (UNDEF: 0)
 2b0:	6b010000 	blvs	402b8 <__bss_end+0x342b8>
 2b4:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2b8:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 2bc:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 2c0:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 2c4:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 2c8:	33006372 	movwcc	r6, #882	; 0x372
 2cc:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 2d0:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 2d4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 2d8:	00006564 	andeq	r6, r0, r4, ror #10
 2dc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 2e0:	00632e72 	rsbeq	r2, r3, r2, ror lr
 2e4:	6b000001 	blvs	2f0 <__start-0x7d10>
 2e8:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 2ec:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 2f0:	00000200 	andeq	r0, r0, r0, lsl #4
 2f4:	02050000 	andeq	r0, r5, #0
 2f8:	00008820 	andeq	r8, r0, r0, lsr #16
 2fc:	83010b03 	movwhi	r0, #6915	; 0x1b03
 300:	2f4b682f 	svccs	0x004b682f
 304:	842f4b68 	strthi	r4, [pc], #-2920	; 30c <__start-0x7cf4>
 308:	4b852f4b 	blmi	fe14c03c <__user_program+0xfde4c03c>
 30c:	0006022f 	andeq	r0, r6, pc, lsr #4
 310:	00760101 	rsbseq	r0, r6, r1, lsl #2
 314:	00020000 	andeq	r0, r2, r0
 318:	00000055 	andeq	r0, r0, r5, asr r0
 31c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 320:	0101000d 	tsteq	r1, sp
 324:	00000101 	andeq	r0, r0, r1, lsl #2
 328:	00000100 	andeq	r0, r0, r0, lsl #2
 32c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 330:	5f6c656e 	svcpl	0x006c656e
 334:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 338:	617a696d 	cmnvs	sl, sp, ror #18
 33c:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
 340:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 344:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 348:	6b62696c 	blvs	189a900 <__user_program+0x159a900>
 34c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 350:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 354:	69740000 	ldmdbvs	r4!, {}^	; <UNPREDICTABLE>
 358:	6f745f63 	svcvs	0x00745f63
 35c:	00632e63 	rsbeq	r2, r3, r3, ror #28
 360:	6b000001 	blvs	36c <__start-0x7c94>
 364:	69647473 	stmdbvs	r4!, {r0, r1, r4, r5, r6, sl, ip, sp, lr}^
 368:	682e746e 	stmdavs	lr!, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
 36c:	00000200 	andeq	r0, r0, r0, lsl #4
 370:	02050000 	andeq	r0, r5, #0
 374:	000088a8 	andeq	r8, r0, r8, lsr #17
 378:	4b012f03 	blmi	4bf8c <__bss_end+0x3ff8c>
 37c:	a19fa1c0 	orrsge	sl, pc, r0, asr #3
 380:	6d2fa0a0 	stcvs	0, cr10, [pc, #-640]!	; 108 <__start-0x7ef8>
 384:	022fbb68 	eoreq	fp, pc, #104, 22	; 0x1a000
 388:	01010008 	tsteq	r1, r8
 38c:	00000054 	andeq	r0, r0, r4, asr r0
 390:	00290002 	eoreq	r0, r9, r2
 394:	01020000 	mrseq	r0, (UNDEF: 2)
 398:	000d0efb 	strdeq	r0, [sp], -fp
 39c:	01010101 	tsteq	r1, r1, lsl #2
 3a0:	01000000 	mrseq	r0, (UNDEF: 0)
 3a4:	33010000 	movwcc	r0, #4096	; 0x1000
 3a8:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 3ac:	732f6b62 	teqvc	pc, #100352	; 0x18800
 3b0:	00006372 	andeq	r6, r0, r2, ror r3
 3b4:	746f6f62 	strbtvc	r6, [pc], #-3938	; 3bc <__start-0x7c44>
 3b8:	0100532e 	tsteq	r0, lr, lsr #6
 3bc:	00000000 	andeq	r0, r0, r0
 3c0:	80000205 	andhi	r0, r0, r5, lsl #4
 3c4:	1b030000 	blne	c03cc <__bss_end+0xb43cc>
 3c8:	2f2f2f01 	svccs	0x002f2f01
 3cc:	2f2f2f30 	svccs	0x002f2f30
 3d0:	312f2f2f 	teqcc	pc, pc, lsr #30
 3d4:	33312f2f 	teqcc	r1, #47, 30	; 0xbc
 3d8:	2e69032f 	cdpcs	3, 6, cr0, cr9, cr15, {1}
 3dc:	022f2f31 	eoreq	r2, pc, #49, 30	; 0xc4
 3e0:	01010002 	tsteq	r1, r2
 3e4:	0000004d 	andeq	r0, r0, sp, asr #32
 3e8:	00280002 	eoreq	r0, r8, r2
 3ec:	01020000 	mrseq	r0, (UNDEF: 2)
 3f0:	000d0efb 	strdeq	r0, [sp], -fp
 3f4:	01010101 	tsteq	r1, r1, lsl #2
 3f8:	01000000 	mrseq	r0, (UNDEF: 0)
 3fc:	33010000 	movwcc	r0, #4096	; 0x1000
 400:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 404:	732f6b62 	teqvc	pc, #100352	; 0x18800
 408:	00006372 	andeq	r6, r0, r2, ror r3
 40c:	2e6d7261 	cdpcs	2, 6, cr7, cr13, cr1, {3}
 410:	00010053 	andeq	r0, r1, r3, asr r0
 414:	05000000 	streq	r0, [r0, #-0]
 418:	00897402 	addeq	r7, r9, r2, lsl #8
 41c:	01100300 	tsteq	r0, r0, lsl #6
 420:	2f332f2f 	svccs	0x00332f2f
 424:	2f332f33 	svccs	0x00332f33
 428:	332f2f2f 	teqcc	pc, #47, 30	; 0xbc
 42c:	2f2f2f2f 	svccs	0x002f2f2f
 430:	01000202 	tsteq	r0, r2, lsl #4
 434:	00009001 	andeq	r9, r0, r1
 438:	24000200 	strcs	r0, [r0], #-512	; 0x200
 43c:	02000000 	andeq	r0, r0, #0
 440:	0d0efb01 	vstreq	d15, [lr, #-4]
 444:	01010100 	mrseq	r0, (UNDEF: 17)
 448:	00000001 	andeq	r0, r0, r1
 44c:	01000001 	tsteq	r0, r1
 450:	6f6e7500 	svcvs	0x006e7500
 454:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 458:	64657a69 	strbtvs	r7, [r5], #-2665	; 0xa69
 45c:	0000632e 	andeq	r6, r0, lr, lsr #6
 460:	00000000 	andeq	r0, r0, r0
 464:	89b80205 	ldmibhi	r8!, {r0, r2, r9}
 468:	15030000 	strne	r0, [r3, #-0]
 46c:	2f2f2f01 	svccs	0x002f2f01
 470:	2f2f2f2f 	svccs	0x002f2f2f
 474:	2f2f2f2f 	svccs	0x002f2f2f
 478:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 47c:	2e09032f 	cdpcs	3, 0, cr0, cr9, cr15, {1}
 480:	2f2f2f2f 	svccs	0x002f2f2f
 484:	2f302f2f 	svccs	0x00302f2f
 488:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
=======
  4c:	00000002 	andeq	r0, r0, r2
  50:	54020500 	strpl	r0, [r2], #-1280	; 0x500
  54:	03000080 	movweq	r0, #128	; 0x80
  58:	f30100d3 	vqadd.u8	q0, <illegal reg q8.5>, <illegal reg q1.5>
  5c:	01040200 	mrseq	r0, R12_usr
  60:	67066606 	strvs	r6, [r6, -r6, lsl #12]
  64:	08f4d831 	ldmeq	r4!, {r0, r4, r5, fp, ip, lr, pc}^
  68:	f3d7f3e5 			; <UNDEFINED> instruction: 0xf3d7f3e5
  6c:	30679f69 	rsbcc	r9, r7, r9, ror #30
  70:	f43e0867 			; <UNDEFINED> instruction: 0xf43e0867
  74:	30679f69 	rsbcc	r9, r7, r9, ror #30
  78:	f43e0867 			; <UNDEFINED> instruction: 0xf43e0867
  7c:	0200f369 	andeq	pc, r0, #-1543503871	; 0xa4000001
  80:	66060104 	strvs	r0, [r6], -r4, lsl #2
  84:	bb316706 	bllt	c59ca4 <__user_program+0x959ca4>
  88:	2108674b 	tstcs	r8, fp, asr #14
  8c:	4bf3d84b 	blmi	ffcf61c0 <__user_program+0xff9f61c0>
  90:	000402bc 			; <UNDEFINED> instruction: 0x000402bc
  94:	00ae0101 	adceq	r0, lr, r1, lsl #2
  98:	00020000 	andeq	r0, r2, r0
  9c:	00000054 	andeq	r0, r0, r4, asr r0
  a0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  a4:	0101000d 	tsteq	r1, sp
  a8:	00000101 	andeq	r0, r0, r1, lsl #2
  ac:	00000100 	andeq	r0, r0, r0, lsl #2
  b0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
  b4:	5f6c656e 	svcpl	0x006c656e
  b8:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
  bc:	617a696d 	cmnvs	sl, sp, ror #18
  c0:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
  c4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  c8:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  cc:	6b62696c 	blvs	189a684 <__user_program+0x159a684>
  d0:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  d4:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  d8:	656b0000 	strbvs	r0, [fp, #-0]!
  dc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
  e0:	0100632e 	tsteq	r0, lr, lsr #6
  e4:	736b0000 	cmnvc	fp, #0
  e8:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  ec:	00682e74 	rsbeq	r2, r8, r4, ror lr
  f0:	00000002 	andeq	r0, r0, r2
  f4:	74020500 	strvc	r0, [r2], #-1280	; 0x500
  f8:	03000083 	movweq	r0, #131	; 0x83
  fc:	4d670117 	stfmie	f0, [r7, #-92]!	; 0xffffffa4
 100:	04020030 	streq	r0, [r2], #-48	; 0x30
 104:	02006803 	andeq	r6, r0, #196608	; 0x30000
 108:	009f0304 	addseq	r0, pc, r4, lsl #6
 10c:	9b030402 	blls	c111c <__bss_end+0xb411c>
 110:	01040200 	mrseq	r0, R12_usr
 114:	6d066606 	stcvs	6, cr6, [r6, #-24]	; 0xffffffe8
 118:	4b672f67 	blmi	19cbebc <__user_program+0x16cbebc>
 11c:	672f6785 	strvs	r6, [pc, -r5, lsl #15]!
 120:	0868854b 	stmdaeq	r8!, {r0, r1, r3, r6, r8, sl, pc}^
 124:	004b673f 	subeq	r6, fp, pc, lsr r7
 128:	03020402 	movweq	r0, #9218	; 0x2402
 12c:	02002e79 	andeq	r2, r0, #1936	; 0x790
 130:	66060104 	strvs	r0, [r6], -r4, lsl #2
 134:	660a0306 	strvs	r0, [sl], -r6, lsl #6
 138:	04020069 	streq	r0, [r2], #-105	; 0x69
 13c:	02006a01 	andeq	r6, r0, #4096	; 0x1000
 140:	02670104 	rsbeq	r0, r7, #4, 2
 144:	01010002 	tsteq	r1, r2
 148:	000000d6 	ldrdeq	r0, [r0], -r6
 14c:	006f0002 	rsbeq	r0, pc, r2
 150:	01020000 	mrseq	r0, (UNDEF: 2)
 154:	000d0efb 	strdeq	r0, [sp], -fp
 158:	01010101 	tsteq	r1, r1, lsl #2
 15c:	01000000 	mrseq	r0, (UNDEF: 0)
 160:	6b010000 	blvs	40168 <__bss_end+0x33168>
 164:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 168:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 16c:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 170:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 174:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 178:	33006372 	movwcc	r6, #882	; 0x372
 17c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 180:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
 184:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 188:	00006564 	andeq	r6, r0, r4, ror #10
 18c:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 190:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 194:	00000100 	andeq	r0, r0, r0, lsl #2
 198:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 19c:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 1a0:	00020068 	andeq	r0, r2, r8, rrx
 1a4:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 1a8:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
 1ac:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 1b0:	623c0000 	eorsvs	r0, ip, #0
 1b4:	746c6975 	strbtvc	r6, [ip], #-2421	; 0x975
 1b8:	3e6e692d 	cdpcc	9, 6, cr6, cr14, cr13, {1}
 1bc:	00000000 	andeq	r0, r0, r0
 1c0:	02050000 	andeq	r0, r5, #0
 1c4:	000084cc 	andeq	r8, r0, ip, asr #9
 1c8:	d7012003 	strle	r2, [r1, -r3]
 1cc:	8367694c 	cmnhi	r7, #76, 18	; 0x130000
 1d0:	04020067 	streq	r0, [r2], #-103	; 0x67
 1d4:	02006b01 	andeq	r6, r0, #1024	; 0x400
 1d8:	ad080104 	stfges	f0, [r8, #-16]
 1dc:	01040200 	mrseq	r0, R12_usr
 1e0:	2f6769d7 	svccs	0x006769d7
 1e4:	812f86b9 			; <UNDEFINED> instruction: 0x812f86b9
 1e8:	4d854df5 	stcmi	13, cr4, [r5, #980]	; 0x3d4
 1ec:	30bb8330 	adcscc	r8, fp, r0, lsr r3
 1f0:	15320268 	ldrne	r0, [r2, #-616]!	; 0x268
 1f4:	be4b679f 	mcrlt	7, 2, r6, cr11, cr15, {4}
 1f8:	9f32a02c 	svcls	0x0032a02c
 1fc:	9f9f329f 	svcls	0x009f329f
 200:	329f9f33 	addscc	r9, pc, #51, 30	; 0xcc
 204:	64832f9f 	strvs	r2, [r3], #3999	; 0xf9f
 208:	839f3286 	orrshi	r3, pc, #1610612744	; 0x60000008
 20c:	4d334b32 	vldmdbmi	r3!, {d4-d28}
 210:	667fbf03 	ldrbtvs	fp, [pc], -r3, lsl #30
 214:	8200c503 	andhi	ip, r0, #12582912	; 0xc00000
 218:	01040200 	mrseq	r0, R12_usr
 21c:	000a022f 	andeq	r0, sl, pc, lsr #4
 220:	006f0101 	rsbeq	r0, pc, r1, lsl #2
 224:	00020000 	andeq	r0, r2, r0
 228:	00000052 	andeq	r0, r0, r2, asr r0
 22c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 230:	0101000d 	tsteq	r1, sp
 234:	00000101 	andeq	r0, r0, r1, lsl #2
 238:	00000100 	andeq	r0, r0, r0, lsl #2
 23c:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 240:	5f6c656e 	svcpl	0x006c656e
 244:	6974706f 	ldmdbvs	r4!, {r0, r1, r2, r3, r5, r6, ip, sp, lr}^
 248:	617a696d 	cmnvs	sl, sp, ror #18
 24c:	6e6f6974 	mcrvs	9, 3, r6, cr15, cr4, {3}
 250:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 254:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 258:	6b62696c 	blvs	189a810 <__user_program+0x159a810>
 25c:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 260:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 264:	61750000 	cmnvs	r5, r0
 268:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 26c:	00000100 	andeq	r0, r0, r0, lsl #2
 270:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 274:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 278:	00020068 	andeq	r0, r2, r8, rrx
 27c:	05000000 	streq	r0, [r0, #-0]
 280:	00885402 	addeq	r5, r8, r2, lsl #8
 284:	010c0300 	mrseq	r0, LR_mon
 288:	694b694b 	stmdbvs	fp, {r0, r1, r3, r6, r8, fp, sp, lr}^
 28c:	2f4b699f 	svccs	0x004b699f
 290:	01000802 	tsteq	r0, r2, lsl #16
 294:	00007601 	andeq	r7, r0, r1, lsl #12
 298:	53000200 	movwpl	r0, #512	; 0x200
 29c:	02000000 	andeq	r0, r0, #0
 2a0:	0d0efb01 	vstreq	d15, [lr, #-4]
 2a4:	01010100 	mrseq	r0, (UNDEF: 17)
 2a8:	00000001 	andeq	r0, r0, r1
 2ac:	01000001 	tsteq	r0, r1
 2b0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2b4:	6f5f6c65 	svcvs	0x005f6c65
 2b8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2bc:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2c0:	2f6e6f69 	svccs	0x006e6f69
 2c4:	00637273 	rsbeq	r7, r3, r3, ror r2
 2c8:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 2cc:	2f6b6269 	svccs	0x006b6269
 2d0:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2d4:	00656475 	rsbeq	r6, r5, r5, ror r4
 2d8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2dc:	632e7265 	teqvs	lr, #1342177286	; 0x50000006
 2e0:	00000100 	andeq	r0, r0, r0, lsl #2
 2e4:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 2e8:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 2ec:	00020068 	andeq	r0, r2, r8, rrx
 2f0:	05000000 	streq	r0, [r0, #-0]
 2f4:	0088b802 	addeq	fp, r8, r2, lsl #16
 2f8:	010b0300 	mrseq	r0, (UNDEF: 59)
 2fc:	4b682f83 	blmi	1a0c110 <__user_program+0x170c110>
 300:	2f4b682f 	svccs	0x004b682f
 304:	852f4b84 	strhi	r4, [pc, #-2948]!	; fffff788 <__user_program+0xffcff788>
 308:	06022f4b 	streq	r2, [r2], -fp, asr #30
 30c:	6f010100 	svcvs	0x00010100
 310:	02000000 	andeq	r0, r0, #0
 314:	00005500 	andeq	r5, r0, r0, lsl #10
 318:	fb010200 	blx	40b22 <__bss_end+0x33b22>
 31c:	01000d0e 	tsteq	r0, lr, lsl #26
 320:	00010101 	andeq	r0, r1, r1, lsl #2
 324:	00010000 	andeq	r0, r1, r0
 328:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 32c:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 330:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 334:	7a696d69 	bvc	1a5b8e0 <__user_program+0x175b8e0>
 338:	6f697461 	svcvs	0x00697461
 33c:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 340:	34330063 	ldrtcc	r0, [r3], #-99	; 0x63
 344:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 348:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 34c:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 350:	74000065 	strvc	r0, [r0], #-101	; 0x65
 354:	745f6369 	ldrbvc	r6, [pc], #-873	; 35c <__start-0x7ca4>
 358:	632e636f 	teqvs	lr, #-1140850687	; 0xbc000001
 35c:	00000100 	andeq	r0, r0, r0, lsl #2
 360:	6474736b 	ldrbtvs	r7, [r4], #-875	; 0x36b
 364:	2e746e69 	cdpcs	14, 7, cr6, cr4, cr9, {3}
 368:	00020068 	andeq	r0, r2, r8, rrx
 36c:	05000000 	streq	r0, [r0, #-0]
 370:	00894002 	addeq	r4, r9, r2
 374:	010b0300 	mrseq	r0, (UNDEF: 59)
 378:	4b682f4b 	blmi	1a0c0ac <__user_program+0x170c0ac>
 37c:	0008022f 	andeq	r0, r8, pc, lsr #4
 380:	00540101 	subseq	r0, r4, r1, lsl #2
 384:	00020000 	andeq	r0, r2, r0
 388:	00000029 	andeq	r0, r0, r9, lsr #32
 38c:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 390:	0101000d 	tsteq	r1, sp
 394:	00000101 	andeq	r0, r0, r1, lsl #2
 398:	00000100 	andeq	r0, r0, r0, lsl #2
 39c:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 3a0:	6b62696c 	blvs	189a958 <__user_program+0x159a958>
 3a4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 3a8:	6f620000 	svcvs	0x00620000
 3ac:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 3b0:	00000100 	andeq	r0, r0, r0, lsl #2
 3b4:	02050000 	andeq	r0, r5, #0
 3b8:	00008000 	andeq	r8, r0, r0
 3bc:	2f011b03 	svccs	0x00011b03
 3c0:	2f302f2f 	svccs	0x00302f2f
 3c4:	2f2f2f2f 	svccs	0x002f2f2f
 3c8:	2f2f312f 	svccs	0x002f312f
 3cc:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 3d0:	2f312e69 	svccs	0x00312e69
 3d4:	0002022f 	andeq	r0, r2, pc, lsr #4
 3d8:	004d0101 	subeq	r0, sp, r1, lsl #2
 3dc:	00020000 	andeq	r0, r2, r0
 3e0:	00000028 	andeq	r0, r0, r8, lsr #32
 3e4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 3e8:	0101000d 	tsteq	r1, sp
 3ec:	00000101 	andeq	r0, r0, r1, lsl #2
 3f0:	00000100 	andeq	r0, r0, r0, lsl #2
 3f4:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 3f8:	6b62696c 	blvs	189a9b0 <__user_program+0x159a9b0>
 3fc:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 400:	72610000 	rsbvc	r0, r1, #0
 404:	00532e6d 	subseq	r2, r3, sp, ror #28
 408:	00000001 	andeq	r0, r0, r1
 40c:	74020500 	strvc	r0, [r2], #-1280	; 0x500
 410:	03000089 	movweq	r0, #137	; 0x89
 414:	2f2f0110 	svccs	0x002f0110
 418:	2f332f33 	svccs	0x00332f33
 41c:	2f2f2f33 	svccs	0x002f2f33
 420:	2f2f332f 	svccs	0x002f332f
 424:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 428:	90010100 	andls	r0, r1, r0, lsl #2
 42c:	02000000 	andeq	r0, r0, #0
 430:	00002400 	andeq	r2, r0, r0, lsl #8
 434:	fb010200 	blx	40c3e <__bss_end+0x33c3e>
 438:	01000d0e 	tsteq	r0, lr, lsl #26
 43c:	00010101 	andeq	r0, r1, r1, lsl #2
 440:	00010000 	andeq	r0, r1, r0
 444:	75000100 	strvc	r0, [r0, #-256]	; 0x100
 448:	74706f6e 	ldrbtvc	r6, [r0], #-3950	; 0xf6e
 44c:	7a696d69 	bvc	1a5b9f8 <__user_program+0x175b9f8>
 450:	632e6465 	teqvs	lr, #1694498816	; 0x65000000
 454:	00000000 	andeq	r0, r0, r0
 458:	02050000 	andeq	r0, r5, #0
 45c:	000089b8 			; <UNDEFINED> instruction: 0x000089b8
 460:	2f011503 	svccs	0x00011503
 464:	2f2f2f2f 	svccs	0x002f2f2f
 468:	2f2f2f2f 	svccs	0x002f2f2f
 46c:	2f2f2f2f 	svccs	0x002f2f2f
 470:	032f302f 	teqeq	pc, #47	; 0x2f
 474:	2f2f2e09 	svccs	0x002f2e09
 478:	2f2f2f2f 	svccs	0x002f2f2f
 47c:	2f2f2f30 	svccs	0x002f2f30
 480:	2f2f302f 	svccs	0x002f302f
 484:	2f2f2f2f 	svccs	0x002f2f2f
 488:	2f2f2f2f 	svccs	0x002f2f2f
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
 48c:	2f2f2f2f 	svccs	0x002f2f2f
 490:	2f2f2f2f 	svccs	0x002f2f2f
 494:	2f2f2f2f 	svccs	0x002f2f2f
 498:	2f2f2f2f 	svccs	0x002f2f2f
 49c:	2f2f2f2f 	svccs	0x002f2f2f
 4a0:	2f2f2f2f 	svccs	0x002f2f2f
 4a4:	2f2f2f2f 	svccs	0x002f2f2f
 4a8:	2f2f2f2f 	svccs	0x002f2f2f
<<<<<<< HEAD
 4ac:	2f2f2f2f 	svccs	0x002f2f2f
 4b0:	2f2f2f2f 	svccs	0x002f2f2f
 4b4:	2f2f2f2f 	svccs	0x002f2f2f
 4b8:	2f2f2f30 	svccs	0x002f2f30
 4bc:	2f302f2f 	svccs	0x00302f2f
 4c0:	2f302f2f 	svccs	0x00302f2f
 4c4:	01000202 	tsteq	r0, r2, lsl #4
 4c8:	00007401 	andeq	r7, r0, r1, lsl #8
 4cc:	24000200 	strcs	r0, [r0], #-512	; 0x200
 4d0:	02000000 	andeq	r0, r0, #0
 4d4:	0d0efb01 	vstreq	d15, [lr, #-4]
 4d8:	01010100 	mrseq	r0, (UNDEF: 17)
 4dc:	00000001 	andeq	r0, r0, r1
 4e0:	01000001 	tsteq	r0, r1
 4e4:	74706f00 	ldrbtvc	r6, [r0], #-3840	; 0xf00
 4e8:	7a696d69 	bvc	1a5ba94 <__user_program+0x175ba94>
 4ec:	656d5f65 	strbvs	r5, [sp, #-3941]!	; 0xf65
 4f0:	0000632e 	andeq	r6, r0, lr, lsr #6
 4f4:	00000000 	andeq	r0, r0, r0
 4f8:	8b100205 	blhi	400d14 <__user_program+0x100d14>
 4fc:	15030000 	strne	r0, [r3, #-0]
 500:	2f2f2f01 	svccs	0x002f2f01
 504:	31302f2f 	teqcc	r0, pc, lsr #30
 508:	30302f2f 	eorscc	r2, r0, pc, lsr #30
 50c:	09032f30 	stmdbeq	r3, {r4, r5, r8, r9, sl, fp, sp}
 510:	2f2f2f2e 	svccs	0x002f2f2e
 514:	032f362f 	teqeq	pc, #49283072	; 0x2f00000
 518:	2f2f2e09 	svccs	0x002f2e09
 51c:	302f3030 	eorcc	r3, pc, r0, lsr r0	; <UNPREDICTABLE>
 520:	2f2f2f2f 	svccs	0x002f2f2f
 524:	2f302f2f 	svccs	0x00302f2f
 528:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 52c:	302f2f2f 	eorcc	r2, pc, pc, lsr #30
 530:	302f302f 	eorcc	r3, pc, pc, lsr #32
 534:	31302f32 	teqcc	r0, r2, lsr pc
 538:	2f302f2f 	svccs	0x00302f2f
 53c:	01000202 	tsteq	r0, r2, lsl #4
 540:	Address 0x00000540 is out of bounds.
=======
 4ac:	2f302f2f 	svccs	0x00302f2f
 4b0:	2f2f2f2f 	svccs	0x002f2f2f
 4b4:	2f2f2f30 	svccs	0x002f2f30
 4b8:	02022f30 	andeq	r2, r2, #48, 30	; 0xc0
 4bc:	90010100 	andls	r0, r1, r0, lsl #2
 4c0:	02000000 	andeq	r0, r0, #0
 4c4:	00002400 	andeq	r2, r0, r0, lsl #8
 4c8:	fb010200 	blx	40cd2 <__bss_end+0x33cd2>
 4cc:	01000d0e 	tsteq	r0, lr, lsl #26
 4d0:	00010101 	andeq	r0, r1, r1, lsl #2
 4d4:	00010000 	andeq	r0, r1, r0
 4d8:	6f000100 	svcvs	0x00000100
 4dc:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 4e0:	5f657a69 	svcpl	0x00657a69
 4e4:	632e656d 	teqvs	lr, #457179136	; 0x1b400000
 4e8:	00000000 	andeq	r0, r0, r0
 4ec:	02050000 	andeq	r0, r5, #0
 4f0:	00008b10 	andeq	r8, r0, r0, lsl fp
 4f4:	2f011503 	svccs	0x00011503
 4f8:	2f2f2f2f 	svccs	0x002f2f2f
 4fc:	2f2f2f2f 	svccs	0x002f2f2f
 500:	2f2f2f2f 	svccs	0x002f2f2f
 504:	032f302f 	teqeq	pc, #47	; 0x2f
 508:	2f2f2e09 	svccs	0x002f2e09
 50c:	2f2f2f2f 	svccs	0x002f2f2f
 510:	2f2f2f30 	svccs	0x002f2f30
 514:	2f2f302f 	svccs	0x002f302f
 518:	2f2f2f2f 	svccs	0x002f2f2f
 51c:	2f2f2f2f 	svccs	0x002f2f2f
 520:	2f2f2f2f 	svccs	0x002f2f2f
 524:	2f2f2f2f 	svccs	0x002f2f2f
 528:	2f2f2f2f 	svccs	0x002f2f2f
 52c:	2f2f2f2f 	svccs	0x002f2f2f
 530:	2f2f2f2f 	svccs	0x002f2f2f
 534:	2f2f2f2f 	svccs	0x002f2f2f
 538:	2f2f2f2f 	svccs	0x002f2f2f
 53c:	2f2f2f2f 	svccs	0x002f2f2f
 540:	2f302f2f 	svccs	0x00302f2f
 544:	2f2f2f2f 	svccs	0x002f2f2f
 548:	2f2f2f30 	svccs	0x002f2f30
 54c:	02022f30 	andeq	r2, r2, #48, 30	; 0xc0
 550:	Address 0x00000550 is out of bounds.
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
<<<<<<< HEAD
  1c:	6f697067 	svcvs	0x00697067
  20:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  24:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  28:	6f6c0074 	svcvs	0x006c0074
  2c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  30:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  34:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  38:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  3c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  48:	4e470072 	mcrmi	0, 2, r0, cr7, cr2, {3}
  4c:	20432055 	subcs	r2, r3, r5, asr r0
  50:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
  54:	30322033 	eorscc	r2, r2, r3, lsr r0
  58:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
  5c:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
  60:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
  64:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
  68:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
  6c:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
  70:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
  74:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
  78:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
  7c:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  80:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
  84:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  88:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  8c:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
  90:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
  94:	6f6c666d 	svcvs	0x006c666d
  98:	612d7461 	teqvs	sp, r1, ror #8
  9c:	733d6962 	teqvc	sp, #1605632	; 0x188000
  a0:	2074666f 	rsbscs	r6, r4, pc, ror #12
  a4:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
  a8:	613d6863 	teqvs	sp, r3, ror #16
  ac:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
  b0:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
  b4:	4f2d2067 	svcmi	0x002d2067
  b8:	662d2031 			; <UNDEFINED> instruction: 0x662d2031
  bc:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
  c0:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
  c4:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
  c8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  cc:	745f3874 	ldrbvc	r3, [pc], #-2164	; d4 <__start-0x7f2c>
  d0:	736e7500 	cmnvc	lr, #0, 10
  d4:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  d8:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  dc:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  e0:	33746e69 	cmncc	r4, #1680	; 0x690
  e4:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  e8:	616c6564 	cmnvs	ip, r4, ror #10
  ec:	79635f79 	stmdbvc	r3!, {r0, r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  f0:	73656c63 	cmnvc	r5, #25344	; 0x6300
  f4:	6f687300 	svcvs	0x00687300
  f8:	75207472 	strvc	r7, [r0, #-1138]!	; 0x472
  fc:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 100:	2064656e 	rsbcs	r6, r4, lr, ror #10
 104:	00746e69 	rsbseq	r6, r4, r9, ror #28
 108:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 54 <__start-0x7fac>
 10c:	63652f65 	cmnvs	r5, #404	; 0x194
 110:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
 114:	3234362f 	eorscc	r3, r4, #49283072	; 0x2f00000
 118:	3631662d 	ldrtcc	r6, [r1], -sp, lsr #12
 11c:	646f632f 	strbtvs	r6, [pc], #-815	; 124 <__start-0x7edc>
 120:	74730065 	ldrbtvc	r0, [r3], #-101	; 0x65
 124:	00657461 	rsbeq	r7, r5, r1, ror #8
 128:	6f697067 	svcvs	0x00697067
 12c:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 130:	00676966 	rsbeq	r6, r7, r6, ror #18
 134:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 138:	6e692074 	mcrvs	0, 3, r2, cr9, cr4, {3}
 13c:	666f0074 			; <UNDEFINED> instruction: 0x666f0074
 140:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
 144:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
 148:	6b62696c 	blvs	189a700 <__user_program+0x159a700>
 14c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 150:	6970672f 	ldmdbvs	r0!, {r0, r1, r2, r3, r5, r8, r9, sl, sp, lr}^
 154:	00632e6f 	rsbeq	r2, r3, pc, ror #28
 158:	61727261 	cmnvs	r2, r1, ror #4
 15c:	6b003179 	blvs	c748 <__bss_end+0x748>
 160:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 164:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 168:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 16c:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 170:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 174:	6b2f6372 	blvs	bd8f44 <__user_program+0x8d8f44>
 178:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 17c:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 180:	61727261 	cmnvs	r2, r1, ror #4
 184:	74003279 	strvc	r3, [r0], #-633	; 0x279
 188:	72656d69 	rsbvc	r6, r5, #6720	; 0x1a40
 18c:	756c6156 	strbvc	r6, [ip, #-342]!	; 0x156
 190:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 194:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 198:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 19c:	4e47006e 	cdpmi	0, 4, cr0, cr7, cr14, {3}
 1a0:	20432055 	subcs	r2, r3, r5, asr r0
 1a4:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
 1a8:	30322033 	eorscc	r2, r2, r3, lsr r0
 1ac:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
 1b0:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
 1b4:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
 1b8:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
 1bc:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
 1c0:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
 1c4:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
 1c8:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
 1cc:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
 1d0:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
 1d4:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
 1d8:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
 1dc:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
 1e0:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
 1e4:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
 1e8:	6f6c666d 	svcvs	0x006c666d
 1ec:	612d7461 	teqvs	sp, r1, ror #8
 1f0:	733d6962 	teqvc	sp, #1605632	; 0x188000
 1f4:	2074666f 	rsbscs	r6, r4, pc, ror #12
 1f8:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
 1fc:	613d6863 	teqvs	sp, r3, ror #16
 200:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
 204:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
 208:	4f2d2067 	svcmi	0x002d2067
 20c:	4f2d2031 	svcmi	0x002d2031
 210:	662d2030 			; <UNDEFINED> instruction: 0x662d2030
 214:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
 218:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
 21c:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
 220:	6f6f6700 	svcvs	0x006f6700
 224:	69730064 	ldmdbvs	r3!, {r2, r5, r6}^
 228:	7974657a 	ldmdbvc	r4!, {r1, r3, r4, r5, r6, r8, sl, sp, lr}^
 22c:	62006570 	andvs	r6, r0, #112, 10	; 0x1c000000
 230:	5f657479 	svcpl	0x00657479
 234:	00727470 	rsbseq	r7, r2, r0, ror r4
 238:	66657270 			; <UNDEFINED> instruction: 0x66657270
 23c:	75007869 	strvc	r7, [r0, #-2153]	; 0x869
 240:	36746e69 	ldrbtcc	r6, [r4], -r9, ror #28
 244:	00745f34 	rsbseq	r5, r4, r4, lsr pc
 248:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0x162
 24c:	765f5f00 	ldrbvc	r5, [pc], -r0, lsl #30
 250:	696c5f61 	stmdbvs	ip!, {r0, r5, r6, r8, r9, sl, fp, ip, lr}^
 254:	64007473 	strvs	r7, [r0], #-1139	; 0x473
 258:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 25c:	72700073 	rsbsvc	r0, r0, #115	; 0x73
 260:	6e746e69 	cdpvs	14, 7, cr6, cr4, cr9, {3}
 264:	006b6d75 	rsbeq	r6, fp, r5, ror sp
 268:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 26c:	6f5f6c65 	svcvs	0x005f6c65
 270:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 274:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 278:	2f6e6f69 	svccs	0x006e6f69
 27c:	2f637273 	svccs	0x00637273
 280:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 284:	632e6b74 	teqvs	lr, #116, 22	; 0x1d000
 288:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 28c:	006b746e 	rsbeq	r7, fp, lr, ror #8
 290:	73677261 	cmnvc	r7, #268435462	; 0x10000006
 294:	615f5f00 	cmpvs	pc, r0, lsl #30
 298:	61750070 	cmnvs	r5, r0, ror r0
 29c:	675f7472 			; <UNDEFINED> instruction: 0x675f7472
 2a0:	625f7465 	subsvs	r7, pc, #1694498816	; 0x65000000
 2a4:	00657479 	rsbeq	r7, r5, r9, ror r4
 2a8:	5f787561 	svcpl	0x00787561
 2ac:	695f756d 	ldmdbvs	pc, {r0, r2, r3, r5, r6, r8, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 2b0:	65725f6f 	ldrbvs	r5, [r2, #-3951]!	; 0xf6f
 2b4:	75610067 	strbvc	r0, [r1, #-103]!	; 0x67
 2b8:	626e6578 	rsbvs	r6, lr, #120, 10	; 0x1e000000
 2bc:	78756100 	ldmdavc	r5!, {r8, sp, lr}^
 2c0:	5f756d5f 	svcpl	0x00756d5f
 2c4:	5f726969 	svcpl	0x00726969
 2c8:	00676572 	rsbeq	r6, r7, r2, ror r5
 2cc:	5f787561 	svcpl	0x00787561
 2d0:	6c5f756d 	cfldr64vs	mvdx7, [pc], {109}	; 0x6d
 2d4:	725f7263 	subsvc	r7, pc, #805306374	; 0x30000006
 2d8:	6b006765 	blvs	1a074 <__bss_end+0xe074>
 2dc:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2e0:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 2e4:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 2e8:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 2ec:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 2f0:	752f6372 	strvc	r6, [pc, #-882]!	; ffffff86 <__user_program+0xffcfff86>
 2f4:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 2f8:	6e690063 	cdpvs	0, 6, cr0, cr9, cr3, {3}
 2fc:	696d6f63 	stmdbvs	sp!, {r0, r1, r5, r6, r8, r9, sl, fp, sp, lr}^
 300:	6100676e 	tstvs	r0, lr, ror #14
 304:	6d5f7875 	ldclvs	8, cr7, [pc, #-468]	; 138 <__start-0x7ec8>
 308:	6e635f75 	mcrvs	15, 3, r5, cr3, cr5, {3}
 30c:	725f6c74 	subsvc	r6, pc, #116, 24	; 0x7400
 310:	61006765 	tstvs	r0, r5, ror #14
 314:	6d5f7875 	ldclvs	8, cr7, [pc, #-468]	; 148 <__start-0x7eb8>
 318:	65695f75 	strbvs	r5, [r9, #-3957]!	; 0xf75
 31c:	65725f72 	ldrbvs	r5, [r2, #-3954]!	; 0xf72
 320:	61750067 	cmnvs	r5, r7, rrx
 324:	695f7472 	ldmdbvs	pc, {r1, r4, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 328:	0074696e 	rsbseq	r6, r4, lr, ror #18
 32c:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 330:	7475705f 	ldrbtvc	r7, [r5], #-95	; 0x5f
 334:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 338:	75610065 	strbvc	r0, [r1, #-101]!	; 0x65
 33c:	756d5f78 	strbvc	r5, [sp, #-3960]!	; 0xf78
 340:	72736c5f 	rsbsvc	r6, r3, #24320	; 0x5f00
 344:	6765725f 			; <UNDEFINED> instruction: 0x6765725f
 348:	72617500 	rsbvc	r7, r1, #0, 10
 34c:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 350:	0065736f 	rsbeq	r7, r5, pc, ror #6
 354:	5f787561 	svcpl	0x00787561
 358:	625f756d 	subsvs	r7, pc, #457179136	; 0x1b400000
 35c:	00647561 	rsbeq	r7, r4, r1, ror #10
 360:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 364:	6c635f72 	stclvs	15, cr5, [r3], #-456	; 0xfffffe38
 368:	5f726165 	svcpl	0x00726165
 36c:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 370:	00676e69 	rsbeq	r6, r7, r9, ror #28
 374:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 378:	6f5f6c65 	svcvs	0x005f6c65
 37c:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 380:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 384:	2f6e6f69 	svccs	0x006e6f69
 388:	2f637273 	svccs	0x00637273
 38c:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 390:	00632e72 	rsbeq	r2, r3, r2, ror lr
 394:	71657266 	cmnvc	r5, r6, ror #4
 398:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 39c:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 3a0:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 3a4:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 3a8:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 3ac:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xf73
 3b0:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 3b4:	69740067 	ldmdbvs	r4!, {r0, r1, r2, r5, r6}^
 3b8:	5f72656d 	svcpl	0x0072656d
 3bc:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
 3c0:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 3c4:	725f7265 	subsvc	r7, pc, #1342177286	; 0x50000006
 3c8:	00646165 	rsbeq	r6, r4, r5, ror #2
 3cc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 3d0:	72695f72 	rsbvc	r5, r9, #456	; 0x1c8
 3d4:	6c635f71 	stclvs	15, cr5, [r3], #-452	; 0xfffffe3c
 3d8:	00726165 	rsbseq	r6, r2, r5, ror #2
 3dc:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 3e0:	72705f72 	rsbsvc	r5, r0, #456	; 0x1c8
 3e4:	76696465 	strbtvc	r6, [r9], -r5, ror #8
 3e8:	72656469 	rsbvc	r6, r5, #1761607680	; 0x69000000
 3ec:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 3f0:	725f7265 	subsvc	r7, pc, #1342177286	; 0x50000006
 3f4:	616f6c65 	cmnvs	pc, r5, ror #24
 3f8:	69740064 	ldmdbvs	r4!, {r2, r5, r6}^
 3fc:	5f72656d 	svcpl	0x0072656d
 400:	756c6176 	strbvc	r6, [ip, #-374]!	; 0x176
 404:	69740065 	ldmdbvs	r4!, {r0, r2, r5, r6}^
 408:	5f72656d 	svcpl	0x0072656d
 40c:	64616f6c 	strbtvs	r6, [r1], #-3948	; 0xf6c
 410:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 414:	635f7265 	cmpvs	pc, #1342177286	; 0x50000006
 418:	72746e6f 	rsbsvc	r6, r4, #1776	; 0x6f0
 41c:	65006c6f 	strvs	r6, [r0, #-3183]	; 0xc6f
 420:	7370616c 	cmnvc	r0, #108, 2
 424:	6b006465 	blvs	195c0 <__bss_end+0xd5c0>
 428:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 42c:	706f5f6c 	rsbvc	r5, pc, ip, ror #30
 430:	696d6974 	stmdbvs	sp!, {r2, r4, r5, r6, r8, fp, sp, lr}^
 434:	6974617a 	ldmdbvs	r4!, {r1, r3, r4, r5, r6, r8, sp, lr}^
 438:	732f6e6f 	teqvc	pc, #1776	; 0x6f0
 43c:	742f6372 	strtvc	r6, [pc], #-882	; 444 <__start-0x7bbc>
 440:	745f6369 	ldrbvc	r6, [pc], #-873	; 448 <__start-0x7bb8>
 444:	632e636f 	teqvs	lr, #-1140850687	; 0xbc000001
	...
=======
  1c:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; ffffff68 <__user_program+0xffcfff68>
  20:	63652f65 	cmnvs	r5, #404	; 0x194
  24:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
  28:	7065722f 	rsbvc	r7, r5, pc, lsr #4
  2c:	362f736f 	strtcc	r7, [pc], -pc, ror #6
  30:	662d3234 			; <UNDEFINED> instruction: 0x662d3234
  34:	632f3631 	teqvs	pc, #51380224	; 0x3100000
  38:	0065646f 	rsbeq	r6, r5, pc, ror #8
  3c:	6f697067 	svcvs	0x00697067
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  48:	6f6c0074 	svcvs	0x006c0074
  4c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  50:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  54:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  58:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  5c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  60:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  64:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  68:	666f0072 			; <UNDEFINED> instruction: 0x666f0072
  6c:	74657366 	strbtvc	r7, [r5], #-870	; 0x366
  70:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  74:	745f3874 	ldrbvc	r3, [pc], #-2164	; 7c <__start-0x7f84>
  78:	736e7500 	cmnvc	lr, #0, 10
  7c:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  80:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  84:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  88:	33746e69 	cmncc	r4, #1680	; 0x690
  8c:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  90:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
  94:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
  98:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
  9c:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
  a0:	4700746e 	strmi	r7, [r0, -lr, ror #8]
  a4:	4320554e 	teqmi	r0, #327155712	; 0x13800000
  a8:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  ac:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  b0:	30353130 	eorscc	r3, r5, r0, lsr r1
  b4:	20393235 	eorscs	r3, r9, r5, lsr r2
  b8:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  bc:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  c0:	415b2029 	cmpmi	fp, r9, lsr #32
  c4:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff37a <__user_program+0xffcff37a>
  c8:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  cc:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  d0:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  d4:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  d8:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  dc:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  e0:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  e4:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  e8:	205d3838 	subscs	r3, sp, r8, lsr r8
  ec:	6c666d2d 	stclvs	13, cr6, [r6], #-180	; 0xffffff4c
  f0:	2d74616f 	ldfcse	f6, [r4, #-444]!	; 0xfffffe44
  f4:	3d696261 	sfmcc	f6, 2, [r9, #-388]!	; 0xfffffe7c
  f8:	74666f73 	strbtvc	r6, [r6], #-3955	; 0xf73
  fc:	616d2d20 	cmnvs	sp, r0, lsr #26
 100:	3d686372 	stclcc	3, cr6, [r8, #-456]!	; 0xfffffe38
 104:	766d7261 	strbtvc	r7, [sp], -r1, ror #4
 108:	20612d37 	rsbcs	r2, r1, r7, lsr sp
 10c:	2d20672d 	stccs	7, cr6, [r0, #-180]!	; 0xffffff4c
 110:	2d20314f 	stfcss	f3, [r0, #-316]!	; 0xfffffec4
 114:	2d20304f 	stccs	0, cr3, [r0, #-316]!	; 0xfffffec4
 118:	65726666 	ldrbvs	r6, [r2, #-1638]!	; 0x666
 11c:	61747365 	cmnvs	r4, r5, ror #6
 120:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 124:	74730067 	ldrbtvc	r0, [r3], #-103	; 0x67
 128:	00657461 	rsbeq	r7, r5, r1, ror #8
 12c:	6f697067 	svcvs	0x00697067
 130:	6e6f635f 	mcrvs	3, 3, r6, cr15, cr15, {2}
 134:	00676966 	rsbeq	r6, r7, r6, ror #18
 138:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 13c:	6e692074 	mcrvs	0, 3, r2, cr9, cr4, {3}
 140:	34330074 	ldrtcc	r0, [r3], #-116	; 0x74
 144:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 148:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 14c:	70672f63 	rsbvc	r2, r7, r3, ror #30
 150:	632e6f69 	teqvs	lr, #420	; 0x1a4
 154:	72726100 	rsbsvc	r6, r2, #0, 2
 158:	00317961 	eorseq	r7, r1, r1, ror #18
 15c:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 160:	6f5f6c65 	svcvs	0x005f6c65
 164:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 168:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 16c:	2f6e6f69 	svccs	0x006e6f69
 170:	2f637273 	svccs	0x00637273
 174:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 178:	632e6c65 	teqvs	lr, #25856	; 0x6500
 17c:	72726100 	rsbsvc	r6, r2, #0, 2
 180:	00327961 	eorseq	r7, r2, r1, ror #18
 184:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 188:	6c615672 	stclvs	6, cr5, [r1], #-456	; 0xfffffe38
 18c:	6b006575 	blvs	19768 <__bss_end+0xc768>
 190:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 194:	616d5f6c 	cmnvs	sp, ip, ror #30
 198:	67006e69 	strvs	r6, [r0, -r9, ror #28]
 19c:	00646f6f 	rsbeq	r6, r4, pc, ror #30
 1a0:	657a6973 	ldrbvs	r6, [sl, #-2419]!	; 0x973
 1a4:	65707974 	ldrbvs	r7, [r0, #-2420]!	; 0x974
 1a8:	74796200 	ldrbtvc	r6, [r9], #-512	; 0x200
 1ac:	74705f65 	ldrbtvc	r5, [r0], #-3941	; 0xf65
 1b0:	72700072 	rsbsvc	r0, r0, #114	; 0x72
 1b4:	78696665 	stmdavc	r9!, {r0, r2, r5, r6, r9, sl, sp, lr}^
 1b8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
 1bc:	5f343674 	svcpl	0x00343674
 1c0:	61620074 	smcvs	8196	; 0x2004
 1c4:	5f006573 	svcpl	0x00006573
 1c8:	5f61765f 	svcpl	0x0061765f
 1cc:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0x96c
 1d0:	69727000 	ldmdbvs	r2!, {ip, sp, lr}^
 1d4:	756e746e 	strbvc	r7, [lr, #-1134]!	; 0x46e
 1d8:	64006b6d 	strvs	r6, [r0], #-2925	; 0xb6d
 1dc:	74696769 	strbtvc	r6, [r9], #-1897	; 0x769
 1e0:	656b0073 	strbvs	r0, [fp, #-115]!	; 0x73
 1e4:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 1e8:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 1ec:	7a696d69 	bvc	1a5b798 <__user_program+0x175b798>
 1f0:	6f697461 	svcvs	0x00697461
 1f4:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 1f8:	72702f63 	rsbsvc	r2, r0, #396	; 0x18c
 1fc:	6b746e69 	blvs	1d1bba8 <__user_program+0x1a1bba8>
 200:	7000632e 	andvc	r6, r0, lr, lsr #6
 204:	746e6972 	strbtvc	r6, [lr], #-2418	; 0x972
 208:	7261006b 	rsbvc	r0, r1, #107	; 0x6b
 20c:	5f007367 	svcpl	0x00007367
 210:	0070615f 	rsbseq	r6, r0, pc, asr r1
 214:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 218:	7465675f 	strbtvc	r6, [r5], #-1887	; 0x75f
 21c:	7479625f 	ldrbtvc	r6, [r9], #-607	; 0x25f
 220:	656b0065 	strbvs	r0, [fp, #-101]!	; 0x65
 224:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 228:	74706f5f 	ldrbtvc	r6, [r0], #-3935	; 0xf5f
 22c:	7a696d69 	bvc	1a5b7d8 <__user_program+0x175b7d8>
 230:	6f697461 	svcvs	0x00697461
 234:	72732f6e 	rsbsvc	r2, r3, #440	; 0x1b8
 238:	61752f63 	cmnvs	r5, r3, ror #30
 23c:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 240:	72617500 	rsbvc	r7, r1, #0, 10
 244:	6e695f74 	mcrvs	15, 3, r5, cr9, cr4, {3}
 248:	75007469 	strvc	r7, [r0, #-1129]	; 0x469
 24c:	5f747261 	svcpl	0x00747261
 250:	5f747570 	svcpl	0x00747570
 254:	65747962 	ldrbvs	r7, [r4, #-2402]!	; 0x962
 258:	72617500 	rsbvc	r7, r1, #0, 10
 25c:	6c635f74 	stclvs	15, cr5, [r3], #-464	; 0xfffffe30
 260:	0065736f 	rsbeq	r7, r5, pc, ror #6
 264:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 268:	6c635f72 	stclvs	15, cr5, [r3], #-456	; 0xfffffe38
 26c:	5f726165 	svcpl	0x00726165
 270:	646e6570 	strbtvs	r6, [lr], #-1392	; 0x570
 274:	00676e69 	rsbeq	r6, r7, r9, ror #28
 278:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 27c:	6f5f6c65 	svcvs	0x005f6c65
 280:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 284:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 288:	2f6e6f69 	svccs	0x006e6f69
 28c:	2f637273 	svccs	0x00637273
 290:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0x974
 294:	00632e72 	rsbeq	r2, r3, r2, ror lr
 298:	71657266 	cmnvc	r5, r6, ror #4
 29c:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2a0:	735f7265 	cmpvc	pc, #1342177286	; 0x50000006
 2a4:	74726174 	ldrbtvc	r6, [r2], #-372	; 0x174
 2a8:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2ac:	695f7265 	ldmdbvs	pc, {r0, r2, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 2b0:	65705f73 	ldrbvs	r5, [r0, #-3955]!	; 0xf73
 2b4:	6e69646e 	cdpvs	4, 6, cr6, cr9, cr14, {3}
 2b8:	69740067 	ldmdbvs	r4!, {r0, r1, r2, r5, r6}^
 2bc:	5f72656d 	svcpl	0x0072656d
 2c0:	706f7473 	rsbvc	r7, pc, r3, ror r4	; <UNPREDICTABLE>
 2c4:	6d697400 	cfstrdvs	mvd7, [r9, #-0]
 2c8:	725f7265 	subsvc	r7, pc, #1342177286	; 0x50000006
 2cc:	00646165 	rsbeq	r6, r4, r5, ror #2
 2d0:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 2d4:	6f5f6c65 	svcvs	0x005f6c65
 2d8:	6d697470 	cfstrdvs	mvd7, [r9, #-448]!	; 0xfffffe40
 2dc:	74617a69 	strbtvc	r7, [r1], #-2665	; 0xa69
 2e0:	2f6e6f69 	svccs	0x006e6f69
 2e4:	2f637273 	svccs	0x00637273
 2e8:	5f636974 	svcpl	0x00636974
 2ec:	2e636f74 	mcrcs	15, 3, r6, cr3, cr4, {3}
 2f0:	Address 0x000002f0 is out of bounds.

>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
<<<<<<< HEAD
  24:	1a011803 	bne	46038 <__bss_end+0x3a038>
  28:	22011e01 	andcs	r1, r1, #1, 28
=======
  24:	1a011803 	bne	46038 <__bss_end+0x39038>
  28:	22061e01 	andcs	r1, r6, #1, 28
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
<<<<<<< HEAD
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000018 	andeq	r0, r0, r8, lsl r0
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  78:	00000158 	andeq	r0, r0, r8, asr r1
  7c:	8b080e42 	blhi	20398c <__end+0xd698c>
  80:	42018e02 	andmi	r8, r1, #2, 28
  84:	00040b0c 	andeq	r0, r4, ip, lsl #22
  88:	0000000c 	andeq	r0, r0, ip
  8c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  90:	7c020001 	stcvc	0, cr0, [r2], {1}
  94:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  98:	00000020 	andeq	r0, r0, r0, lsr #32
  9c:	00000088 	andeq	r0, r0, r8, lsl #1
  a0:	0000830c 	andeq	r8, r0, ip, lsl #6
  a4:	00000138 	andeq	r0, r0, r8, lsr r1
  a8:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
  ac:	8e028b03 	vmlahi.f64	d8, d2, d3
  b0:	0b0c4201 	bleq	3108bc <__user_program+0x108bc>
  b4:	0c960204 	lfmeq	f0, 4, [r6], {4}
  b8:	00000c0d 	andeq	r0, r0, sp, lsl #24
  bc:	00000034 	andeq	r0, r0, r4, lsr r0
  c0:	00000088 	andeq	r0, r0, r8, lsl #1
  c4:	00008444 	andeq	r8, r0, r4, asr #8
  c8:	00000250 	andeq	r0, r0, r0, asr r2
  cc:	80100e42 	andshi	r0, r0, r2, asr #28
  d0:	82038104 	andhi	r8, r3, #4, 2
  d4:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
  d8:	068b180e 	streq	r1, [fp], lr, lsl #16
  dc:	0c42058e 	cfstr64eq	mvdx0, [r2], {142}	; 0x8e
  e0:	1c03140b 	cfstrsne	mvf1, [r3], {11}
  e4:	180d0c01 	stmdane	sp, {r0, sl, fp}
  e8:	0ecbce42 	cdpeq	14, 12, cr12, cr11, cr2, {2}
  ec:	c2c34210 	sbcgt	r4, r3, #16, 4
  f0:	000ec0c1 	andeq	ip, lr, r1, asr #1
  f4:	0000000c 	andeq	r0, r0, ip
  f8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  fc:	7c020001 	stcvc	0, cr0, [r2], {1}
 100:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 104:	00000018 	andeq	r0, r0, r8, lsl r0
 108:	000000f4 	strdeq	r0, [r0], -r4
 10c:	00008694 	muleq	r0, r4, r6
 110:	000000b4 	strheq	r0, [r0], -r4
 114:	8b080e42 	blhi	203a24 <__end+0xd6a24>
 118:	42018e02 	andmi	r8, r1, #2, 28
 11c:	00040b0c 	andeq	r0, r4, ip, lsl #22
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	000000f4 	strdeq	r0, [r0], -r4
 128:	00008748 	andeq	r8, r0, r8, asr #14
 12c:	00000028 	andeq	r0, r0, r8, lsr #32
 130:	8b040e42 	blhi	103a40 <__bss_end+0xf7a40>
 134:	0b0d4201 	bleq	350940 <__user_program+0x50940>
 138:	420d0d4c 	andmi	r0, sp, #76, 26	; 0x1300
 13c:	00000ecb 	andeq	r0, r0, fp, asr #29
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	000000f4 	strdeq	r0, [r0], -r4
 148:	00008770 	andeq	r8, r0, r0, ror r7
 14c:	00000058 	andeq	r0, r0, r8, asr r0
 150:	8b040e42 	blhi	103a60 <__bss_end+0xf7a60>
 154:	0b0d4201 	bleq	350960 <__user_program+0x50960>
 158:	420d0d64 	andmi	r0, sp, #100, 26	; 0x1900
 15c:	00000ecb 	andeq	r0, r0, fp, asr #29
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	000000f4 	strdeq	r0, [r0], -r4
 168:	000087c8 	andeq	r8, r0, r8, asr #15
 16c:	00000058 	andeq	r0, r0, r8, asr r0
 170:	8b040e42 	blhi	103a80 <__bss_end+0xf7a80>
 174:	0b0d4201 	bleq	350980 <__user_program+0x50980>
 178:	420d0d64 	andmi	r0, sp, #100, 26	; 0x1900
 17c:	00000ecb 	andeq	r0, r0, fp, asr #29
 180:	0000000c 	andeq	r0, r0, ip
 184:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 188:	7c020001 	stcvc	0, cr0, [r2], {1}
 18c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 190:	0000001c 	andeq	r0, r0, ip, lsl r0
 194:	00000180 	andeq	r0, r0, r0, lsl #3
 198:	00008820 	andeq	r8, r0, r0, lsr #16
 19c:	00000020 	andeq	r0, r0, r0, lsr #32
 1a0:	8b040e42 	blhi	103ab0 <__bss_end+0xf7ab0>
 1a4:	0b0d4201 	bleq	3509b0 <__user_program+0x509b0>
 1a8:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1ac:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b4:	00000180 	andeq	r0, r0, r0, lsl #3
 1b8:	00008840 	andeq	r8, r0, r0, asr #16
 1bc:	00000018 	andeq	r0, r0, r8, lsl r0
 1c0:	8b040e42 	blhi	103ad0 <__bss_end+0xf7ad0>
 1c4:	0b0d4201 	bleq	3509d0 <__user_program+0x509d0>
 1c8:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 1cc:	00000ecb 	andeq	r0, r0, fp, asr #29
 1d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d4:	00000180 	andeq	r0, r0, r0, lsl #3
 1d8:	00008858 	andeq	r8, r0, r8, asr r8
 1dc:	0000001c 	andeq	r0, r0, ip, lsl r0
 1e0:	8b040e42 	blhi	103af0 <__bss_end+0xf7af0>
 1e4:	0b0d4201 	bleq	3509f0 <__user_program+0x509f0>
 1e8:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 1ec:	00000ecb 	andeq	r0, r0, fp, asr #29
 1f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1f4:	00000180 	andeq	r0, r0, r0, lsl #3
 1f8:	00008874 	andeq	r8, r0, r4, ror r8
 1fc:	0000001c 	andeq	r0, r0, ip, lsl r0
 200:	8b040e42 	blhi	103b10 <__bss_end+0xf7b10>
 204:	0b0d4201 	bleq	350a10 <__user_program+0x50a10>
 208:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 20c:	00000ecb 	andeq	r0, r0, fp, asr #29
 210:	0000001c 	andeq	r0, r0, ip, lsl r0
 214:	00000180 	andeq	r0, r0, r0, lsl #3
 218:	00008890 	muleq	r0, r0, r8
 21c:	00000018 	andeq	r0, r0, r8, lsl r0
 220:	8b040e42 	blhi	103b30 <__bss_end+0xf7b30>
 224:	0b0d4201 	bleq	350a30 <__user_program+0x50a30>
 228:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 22c:	00000ecb 	andeq	r0, r0, fp, asr #29
 230:	0000000c 	andeq	r0, r0, ip
 234:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 238:	7c020001 	stcvc	0, cr0, [r2], {1}
 23c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 240:	0000001c 	andeq	r0, r0, ip, lsl r0
 244:	00000230 	andeq	r0, r0, r0, lsr r2
 248:	000088a8 	andeq	r8, r0, r8, lsr #17
 24c:	00000094 	muleq	r0, r4, r0
 250:	8b040e42 	blhi	103b60 <__bss_end+0xf7b60>
 254:	0b0d4201 	bleq	350a60 <__user_program+0x50a60>
 258:	0d0d4202 	sfmeq	f4, 4, [sp, #-8]
 25c:	000ecb42 	andeq	ip, lr, r2, asr #22
 260:	0000001c 	andeq	r0, r0, ip, lsl r0
 264:	00000230 	andeq	r0, r0, r0, lsr r2
 268:	0000893c 	andeq	r8, r0, ip, lsr r9
 26c:	00000038 	andeq	r0, r0, r8, lsr r0
 270:	8b040e42 	blhi	103b80 <__bss_end+0xf7b80>
 274:	0b0d4201 	bleq	350a80 <__user_program+0x50a80>
 278:	420d0d54 	andmi	r0, sp, #84, 26	; 0x1500
 27c:	00000ecb 	andeq	r0, r0, fp, asr #29
 280:	0000000c 	andeq	r0, r0, ip
 284:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 288:	7c010001 	stcvc	0, cr0, [r1], {1}
 28c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 290:	00000014 	andeq	r0, r0, r4, lsl r0
 294:	00000280 	andeq	r0, r0, r0, lsl #5
 298:	00008bf0 	strdeq	r8, [r0], -r0
 29c:	0000003c 	andeq	r0, r0, ip, lsr r0
 2a0:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 2a4:	00000010 	andeq	r0, r0, r0, lsl r0
 2a8:	0000000c 	andeq	r0, r0, ip
 2ac:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2b0:	7c020001 	stcvc	0, cr0, [r2], {1}
 2b4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2b8:	0000002c 	andeq	r0, r0, ip, lsr #32
 2bc:	000002a8 	andeq	r0, r0, r8, lsr #5
 2c0:	00008c2c 	andeq	r8, r0, ip, lsr #24
 2c4:	00000044 	andeq	r0, r0, r4, asr #32
 2c8:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 2cc:	86078508 	strhi	r8, [r7], -r8, lsl #10
 2d0:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 2d4:	8a038904 	bhi	e26ec <__bss_end+0xd66ec>
 2d8:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 2dc:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 2e0:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 2e4:	0000000e 	andeq	r0, r0, lr
 2e8:	00000024 	andeq	r0, r0, r4, lsr #32
 2ec:	000002a8 	andeq	r0, r0, r8, lsr #5
 2f0:	00008c70 	andeq	r8, r0, r0, ror ip
 2f4:	00000040 	andeq	r0, r0, r0, asr #32
 2f8:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 2fc:	86058506 	strhi	r8, [r5], -r6, lsl #10
 300:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 304:	5c018e02 	stcpl	14, cr8, [r1], {2}
 308:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 30c:	000ec4c5 	andeq	ip, lr, r5, asr #9
 310:	0000000c 	andeq	r0, r0, ip
 314:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 318:	7c020001 	stcvc	0, cr0, [r2], {1}
 31c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 320:	00000034 	andeq	r0, r0, r4, lsr r0
 324:	00000310 	andeq	r0, r0, r0, lsl r3
 328:	00008cb4 			; <UNDEFINED> instruction: 0x00008cb4
 32c:	00000178 	andeq	r0, r0, r8, ror r1
 330:	83280e44 	teqhi	r8, #68, 28	; 0x440
 334:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 338:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 33c:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 340:	8b038a04 	blhi	e2b58 <__bss_end+0xd6b58>
 344:	02018e02 	andeq	r8, r1, #2, 28
 348:	cbce0aa6 	blgt	ff382de8 <__user_program+0xff082de8>
 34c:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 350:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 354:	0b42000e 	bleq	1080394 <__user_program+0xd80394>
 358:	0000000c 	andeq	r0, r0, ip
 35c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 360:	7c020001 	stcvc	0, cr0, [r2], {1}
 364:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 368:	0000002c 	andeq	r0, r0, ip, lsr #32
 36c:	00000358 	andeq	r0, r0, r8, asr r3
 370:	00008e2c 	andeq	r8, r0, ip, lsr #28
 374:	00000120 	andeq	r0, r0, r0, lsr #2
 378:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 37c:	86078508 	strhi	r8, [r7], -r8, lsl #10
 380:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 384:	8a038904 	bhi	e279c <__bss_end+0xd679c>
 388:	02018e02 	andeq	r8, r1, #2, 28
 38c:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 390:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 394:	00000ec4 	andeq	r0, r0, r4, asr #29
=======
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000120 	andeq	r0, r0, r0, lsr #2
  20:	8b040e42 	blhi	103930 <__bss_end+0xf6930>
  24:	0b0d4201 	bleq	350830 <__user_program+0x50830>
  28:	0d0d8802 	stceq	8, cr8, [sp, #-8]
  2c:	000ecb42 	andeq	ip, lr, r2, asr #22
  30:	0000001c 	andeq	r0, r0, ip, lsl r0
  34:	00000000 	andeq	r0, r0, r0
  38:	00008174 	andeq	r8, r0, r4, ror r1
  3c:	00000084 	andeq	r0, r0, r4, lsl #1
  40:	8b040e42 	blhi	103950 <__bss_end+0xf6950>
  44:	0b0d4201 	bleq	350850 <__user_program+0x50850>
  48:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  4c:	00000ecb 	andeq	r0, r0, fp, asr #29
  50:	0000001c 	andeq	r0, r0, ip, lsl r0
  54:	00000000 	andeq	r0, r0, r0
  58:	000081f8 	strdeq	r8, [r0], -r8	; <UNPREDICTABLE>
  5c:	00000084 	andeq	r0, r0, r4, lsl #1
  60:	8b040e42 	blhi	103970 <__bss_end+0xf6970>
  64:	0b0d4201 	bleq	350870 <__user_program+0x50870>
  68:	420d0d7a 	andmi	r0, sp, #7808	; 0x1e80
  6c:	00000ecb 	andeq	r0, r0, fp, asr #29
  70:	0000001c 	andeq	r0, r0, ip, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	0000827c 	andeq	r8, r0, ip, ror r2
  7c:	000000f8 	strdeq	r0, [r0], -r8
  80:	8b080e42 	blhi	203990 <__end+0xd5990>
  84:	42018e02 	andmi	r8, r1, #2, 28
  88:	02040b0c 	andeq	r0, r4, #12, 22	; 0x3000
  8c:	080d0c76 	stmdaeq	sp, {r1, r2, r4, r5, r6, sl, fp}
  90:	0000000c 	andeq	r0, r0, ip
  94:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  98:	7c020001 	stcvc	0, cr0, [r2], {1}
  9c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  a0:	00000018 	andeq	r0, r0, r8, lsl r0
  a4:	00000090 	muleq	r0, r0, r0
  a8:	00008374 	andeq	r8, r0, r4, ror r3
  ac:	00000158 	andeq	r0, r0, r8, asr r1
  b0:	8b080e42 	blhi	2039c0 <__end+0xd59c0>
  b4:	42018e02 	andmi	r8, r1, #2, 28
  b8:	00040b0c 	andeq	r0, r4, ip, lsl #22
  bc:	0000000c 	andeq	r0, r0, ip
  c0:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  c4:	7c020001 	stcvc	0, cr0, [r2], {1}
  c8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  cc:	00000020 	andeq	r0, r0, r0, lsr #32
  d0:	000000bc 	strheq	r0, [r0], -ip
  d4:	000084cc 	andeq	r8, r0, ip, asr #9
  d8:	00000138 	andeq	r0, r0, r8, lsr r1
  dc:	840c0e42 	strhi	r0, [ip], #-3650	; 0xe42
  e0:	8e028b03 	vmlahi.f64	d8, d2, d3
  e4:	0b0c4201 	bleq	3108f0 <__user_program+0x108f0>
  e8:	0c960204 	lfmeq	f0, 4, [r6], {4}
  ec:	00000c0d 	andeq	r0, r0, sp, lsl #24
  f0:	00000034 	andeq	r0, r0, r4, lsr r0
  f4:	000000bc 	strheq	r0, [r0], -ip
  f8:	00008604 	andeq	r8, r0, r4, lsl #12
  fc:	00000250 	andeq	r0, r0, r0, asr r2
 100:	80100e42 	andshi	r0, r0, r2, asr #28
 104:	82038104 	andhi	r8, r3, #4, 2
 108:	42018302 	andmi	r8, r1, #134217728	; 0x8000000
 10c:	068b180e 	streq	r1, [fp], lr, lsl #16
 110:	0c42058e 	cfstr64eq	mvdx0, [r2], {142}	; 0x8e
 114:	1c03140b 	cfstrsne	mvf1, [r3], {11}
 118:	180d0c01 	stmdane	sp, {r0, sl, fp}
 11c:	0ecbce42 	cdpeq	14, 12, cr12, cr11, cr2, {2}
 120:	c2c34210 	sbcgt	r4, r3, #16, 4
 124:	000ec0c1 	andeq	ip, lr, r1, asr #1
 128:	0000000c 	andeq	r0, r0, ip
 12c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 130:	7c020001 	stcvc	0, cr0, [r2], {1}
 134:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 138:	0000001c 	andeq	r0, r0, ip, lsl r0
 13c:	00000128 	andeq	r0, r0, r8, lsr #2
 140:	00008854 	andeq	r8, r0, r4, asr r8
 144:	00000014 	andeq	r0, r0, r4, lsl r0
 148:	8b040e42 	blhi	103a58 <__bss_end+0xf6a58>
 14c:	0b0d4201 	bleq	350958 <__user_program+0x50958>
 150:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 154:	00000ecb 	andeq	r0, r0, fp, asr #29
 158:	0000001c 	andeq	r0, r0, ip, lsl r0
 15c:	00000128 	andeq	r0, r0, r8, lsr #2
 160:	00008868 	andeq	r8, r0, r8, ror #16
 164:	00000014 	andeq	r0, r0, r4, lsl r0
 168:	8b040e42 	blhi	103a78 <__bss_end+0xf6a78>
 16c:	0b0d4201 	bleq	350978 <__user_program+0x50978>
 170:	420d0d42 	andmi	r0, sp, #4224	; 0x1080
 174:	00000ecb 	andeq	r0, r0, fp, asr #29
 178:	0000001c 	andeq	r0, r0, ip, lsl r0
 17c:	00000128 	andeq	r0, r0, r8, lsr #2
 180:	0000887c 	andeq	r8, r0, ip, ror r8
 184:	00000020 	andeq	r0, r0, r0, lsr #32
 188:	8b040e42 	blhi	103a98 <__bss_end+0xf6a98>
 18c:	0b0d4201 	bleq	350998 <__user_program+0x50998>
 190:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 194:	00000ecb 	andeq	r0, r0, fp, asr #29
 198:	0000001c 	andeq	r0, r0, ip, lsl r0
 19c:	00000128 	andeq	r0, r0, r8, lsr #2
 1a0:	0000889c 	muleq	r0, ip, r8
 1a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a8:	8b040e42 	blhi	103ab8 <__bss_end+0xf6ab8>
 1ac:	0b0d4201 	bleq	3509b8 <__user_program+0x509b8>
 1b0:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 1b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1b8:	0000000c 	andeq	r0, r0, ip
 1bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 1c0:	7c020001 	stcvc	0, cr0, [r2], {1}
 1c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 1c8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1cc:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1d0:	000088b8 			; <UNDEFINED> instruction: 0x000088b8
 1d4:	00000020 	andeq	r0, r0, r0, lsr #32
 1d8:	8b040e42 	blhi	103ae8 <__bss_end+0xf6ae8>
 1dc:	0b0d4201 	bleq	3509e8 <__user_program+0x509e8>
 1e0:	420d0d48 	andmi	r0, sp, #72, 26	; 0x1200
 1e4:	00000ecb 	andeq	r0, r0, fp, asr #29
 1e8:	0000001c 	andeq	r0, r0, ip, lsl r0
 1ec:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 1f0:	000088d8 	ldrdeq	r8, [r0], -r8	; <UNPREDICTABLE>
 1f4:	00000018 	andeq	r0, r0, r8, lsl r0
 1f8:	8b040e42 	blhi	103b08 <__bss_end+0xf6b08>
 1fc:	0b0d4201 	bleq	350a08 <__user_program+0x50a08>
 200:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 204:	00000ecb 	andeq	r0, r0, fp, asr #29
 208:	0000001c 	andeq	r0, r0, ip, lsl r0
 20c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 210:	000088f0 	strdeq	r8, [r0], -r0
 214:	0000001c 	andeq	r0, r0, ip, lsl r0
 218:	8b040e42 	blhi	103b28 <__bss_end+0xf6b28>
 21c:	0b0d4201 	bleq	350a28 <__user_program+0x50a28>
 220:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 224:	00000ecb 	andeq	r0, r0, fp, asr #29
 228:	0000001c 	andeq	r0, r0, ip, lsl r0
 22c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 230:	0000890c 	andeq	r8, r0, ip, lsl #18
 234:	0000001c 	andeq	r0, r0, ip, lsl r0
 238:	8b040e42 	blhi	103b48 <__bss_end+0xf6b48>
 23c:	0b0d4201 	bleq	350a48 <__user_program+0x50a48>
 240:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 244:	00000ecb 	andeq	r0, r0, fp, asr #29
 248:	0000001c 	andeq	r0, r0, ip, lsl r0
 24c:	000001b8 			; <UNDEFINED> instruction: 0x000001b8
 250:	00008928 	andeq	r8, r0, r8, lsr #18
 254:	00000018 	andeq	r0, r0, r8, lsl r0
 258:	8b040e42 	blhi	103b68 <__bss_end+0xf6b68>
 25c:	0b0d4201 	bleq	350a68 <__user_program+0x50a68>
 260:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 264:	00000ecb 	andeq	r0, r0, fp, asr #29
 268:	0000000c 	andeq	r0, r0, ip
 26c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 270:	7c020001 	stcvc	0, cr0, [r2], {1}
 274:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 278:	0000001c 	andeq	r0, r0, ip, lsl r0
 27c:	00000268 	andeq	r0, r0, r8, ror #4
 280:	00008940 	andeq	r8, r0, r0, asr #18
 284:	00000018 	andeq	r0, r0, r8, lsl r0
 288:	8b040e42 	blhi	103b98 <__bss_end+0xf6b98>
 28c:	0b0d4201 	bleq	350a98 <__user_program+0x50a98>
 290:	420d0d44 	andmi	r0, sp, #68, 26	; 0x1100
 294:	00000ecb 	andeq	r0, r0, fp, asr #29
 298:	0000001c 	andeq	r0, r0, ip, lsl r0
 29c:	00000268 	andeq	r0, r0, r8, ror #4
 2a0:	00008958 	andeq	r8, r0, r8, asr r9
 2a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 2a8:	8b040e42 	blhi	103bb8 <__bss_end+0xf6bb8>
 2ac:	0b0d4201 	bleq	350ab8 <__user_program+0x50ab8>
 2b0:	420d0d46 	andmi	r0, sp, #4480	; 0x1180
 2b4:	00000ecb 	andeq	r0, r0, fp, asr #29
 2b8:	0000000c 	andeq	r0, r0, ip
 2bc:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2c0:	7c010001 	stcvc	0, cr0, [r1], {1}
 2c4:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2c8:	00000014 	andeq	r0, r0, r4, lsl r0
 2cc:	000002b8 			; <UNDEFINED> instruction: 0x000002b8
 2d0:	00008c68 	andeq	r8, r0, r8, ror #24
 2d4:	0000003c 	andeq	r0, r0, ip, lsr r0
 2d8:	0e038e68 	cdpeq	14, 0, cr8, cr3, cr8, {3}
 2dc:	00000010 	andeq	r0, r0, r0, lsl r0
 2e0:	0000000c 	andeq	r0, r0, ip
 2e4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 2e8:	7c020001 	stcvc	0, cr0, [r2], {1}
 2ec:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2f0:	0000002c 	andeq	r0, r0, ip, lsr #32
 2f4:	000002e0 	andeq	r0, r0, r0, ror #5
 2f8:	00008ca4 	andeq	r8, r0, r4, lsr #25
 2fc:	00000044 	andeq	r0, r0, r4, asr #32
 300:	84200e42 	strthi	r0, [r0], #-3650	; 0xe42
 304:	86078508 	strhi	r8, [r7], -r8, lsl #10
 308:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 30c:	8a038904 	bhi	e2724 <__bss_end+0xd5724>
 310:	5e018e02 	cdppl	14, 0, cr8, cr1, cr2, {0}
 314:	c8c9cace 	stmiagt	r9, {r1, r2, r3, r6, r7, r9, fp, lr, pc}^
 318:	c4c5c6c7 	strbgt	ip, [r5], #1735	; 0x6c7
 31c:	0000000e 	andeq	r0, r0, lr
 320:	00000024 	andeq	r0, r0, r4, lsr #32
 324:	000002e0 	andeq	r0, r0, r0, ror #5
 328:	00008ce8 	andeq	r8, r0, r8, ror #25
 32c:	00000040 	andeq	r0, r0, r0, asr #32
 330:	84180e42 	ldrhi	r0, [r8], #-3650	; 0xe42
 334:	86058506 	strhi	r8, [r5], -r6, lsl #10
 338:	88038704 	stmdahi	r3, {r2, r8, r9, sl, pc}
 33c:	5c018e02 	stcpl	14, cr8, [r1], {2}
 340:	c6c7c8ce 	strbgt	ip, [r7], lr, asr #17
 344:	000ec4c5 	andeq	ip, lr, r5, asr #9
 348:	0000000c 	andeq	r0, r0, ip
 34c:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 350:	7c020001 	stcvc	0, cr0, [r2], {1}
 354:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 358:	00000034 	andeq	r0, r0, r4, lsr r0
 35c:	00000348 	andeq	r0, r0, r8, asr #6
 360:	00008d2c 	andeq	r8, r0, ip, lsr #26
 364:	00000178 	andeq	r0, r0, r8, ror r1
 368:	83280e44 	teqhi	r8, #68, 28	; 0x440
 36c:	8509840a 	strhi	r8, [r9, #-1034]	; 0x40a
 370:	87078608 	strhi	r8, [r7, -r8, lsl #12]
 374:	89058806 	stmdbhi	r5, {r1, r2, fp, pc}
 378:	8b038a04 	blhi	e2b90 <__bss_end+0xd5b90>
 37c:	02018e02 	andeq	r8, r1, #2, 28
 380:	cbce0aa6 	blgt	ff382e20 <__user_program+0xff082e20>
 384:	c7c8c9ca 	strbgt	ip, [r8, sl, asr #19]
 388:	c3c4c5c6 	bicgt	ip, r4, #830472192	; 0x31800000
 38c:	0b42000e 	bleq	10803cc <__user_program+0xd803cc>
 390:	0000000c 	andeq	r0, r0, ip
 394:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
 398:	7c020001 	stcvc	0, cr0, [r2], {1}
 39c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3a0:	0000002c 	andeq	r0, r0, ip, lsr #32
 3a4:	00000390 	muleq	r0, r0, r3
 3a8:	00008ea4 	andeq	r8, r0, r4, lsr #29
 3ac:	00000120 	andeq	r0, r0, r0, lsr #2
 3b0:	84200e46 	strthi	r0, [r0], #-3654	; 0xe46
 3b4:	86078508 	strhi	r8, [r7], -r8, lsl #10
 3b8:	88058706 	stmdahi	r5, {r1, r2, r8, r9, sl, pc}
 3bc:	8a038904 	bhi	e27d4 <__bss_end+0xd57d4>
 3c0:	02018e02 	andeq	r8, r1, #2, 28
 3c4:	c9cace88 	stmibgt	sl, {r3, r7, r9, sl, fp, lr, pc}^
 3c8:	c5c6c7c8 	strbgt	ip, [r6, #1992]	; 0x7c8
 3cc:	00000ec4 	andeq	r0, r0, r4, asr #29
>>>>>>> dcaa7ee0294a445dfa86969ffeb4d1f13eb52cb8
