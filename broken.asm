400d9938 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>:
400d9938:	012136        	entry	a1, 144
400d993b:	3c0c      	movi.n	a12, 3
400d993d:	12c3b2        	addi	a11, a3, 18
400d9940:	44c1a2        	addi	a10, a1, 68
400d9943:	ff8ca5        	call8	400d920c <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d9946:	700282        	l8ui	a8, a2, 112
400d9949:	0df856        	bnez	a8, 400d9a2c <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0xf4>
400d994c:	30c262        	addi	a6, a2, 48
400d994f:	20a660        	or	a10, a6, a6
400d9952:	122172        	l32i	a7, a1, 72
400d9955:	ff70e5        	call8	400d9064 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv>
400d9958:	20baa0        	or	a11, a10, a10
400d995b:	25ba77        	bgeu	a10, a7, 400d9984 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x4c>
400d995e:	086172        	s32i	a7, a1, 32
400d9961:	20c1a2        	addi	a10, a1, 32
400d9964:	ff46a5        	call8	400d8dd0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj$isra$0>
400d9967:	0a5d      	mov.n	a5, a10
400d9969:	06ad      	mov.n	a10, a6
400d996b:	ff7265        	call8	400d9090 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d996e:	8188      	l32i.n	a8, a1, 32
400d9970:	c259      	s32i.n	a5, a2, 48
400d9972:	e289      	s32i.n	a8, a2, 56
400d9974:	1121b2        	l32i	a11, a1, 68
400d9977:	c2a8      	l32i.n	a10, a2, 48
400d9979:	07cd      	mov.n	a12, a7
400d997b:	ff72e5        	call8	400d90a8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcj>
400d997e:	000146        	j	400d9987 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x4f>
400d9981:	000000        	ill
400d9984:	fec756        	bnez	a7, 400d9974 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x3c>
400d9987:	0c2282        	l32i	a8, a2, 48
400d998a:	d279      	s32i.n	a7, a2, 52
400d998c:	887a      	add.n	a8, a8, a7
400d998e:	090c      	movi.n	a9, 0
400d9990:	004892        	s8i	a9, a8, 0
400d9993:	280382        	l8ui	a8, a3, 40
400d9996:	db64c1        	l32r	a12, 400d0728 <_stext+0x708> (3f4016b0 <_flash_rodata_start+0x1590>)
400d9999:	604282        	s8i	a8, a2, 96
400d999c:	4d0382        	l8ui	a8, a3, 77
400d999f:	4c0392        	l8ui	a9, a3, 76
400d99a2:	118880        	slli	a8, a8, 8
400d99a5:	208890        	or	a8, a8, a9
400d99a8:	4e0392        	l8ui	a9, a3, 78
400d99ab:	0b1c      	movi.n	a11, 16
400d99ad:	119900        	slli	a9, a9, 16
400d99b0:	209980        	or	a9, a9, a8
400d99b3:	4f0382        	l8ui	a8, a3, 79
400d99b6:	5cc1a2        	addi	a10, a1, 92
400d99b9:	018880        	slli	a8, a8, 24
400d99bc:	208890        	or	a8, a8, a9
400d99bf:	196282        	s32i	a8, a2, 100
400d99c2:	4f0382        	l8ui	a8, a3, 79
400d99c5:	0189      	s32i.n	a8, a1, 0
400d99c7:	4e03f2        	l8ui	a15, a3, 78
400d99ca:	4d03e2        	l8ui	a14, a3, 77
400d99cd:	4c03d2        	l8ui	a13, a3, 76
400d99d0:	da4781        	l32r	a8, 400d02ec <_stext+0x2cc> (4014e3e0 <snprintf>)
400d99d3:	0008e0        	callx8	a8
400d99d6:	5cc1a2        	addi	a10, a1, 92
400d99d9:	d9a181        	l32r	a8, 400d0060 <_stext+0x40> (400014c0 <strlen>)
400d99dc:	0008e0        	callx8	a8
400d99df:	1322c2        	l32i	a12, a2, 76
400d99e2:	0aed      	mov.n	a14, a10
400d99e4:	5cc1d2        	addi	a13, a1, 92
400d99e7:	0b0c      	movi.n	a11, 0
400d99e9:	48c2a2        	addi	a10, a2, 72
400d99ec:	ff9225        	call8	400d9310 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj>
400d99ef:	1c2c      	movi.n	a12, 33
400d99f1:	0b0c      	movi.n	a11, 0
400d99f3:	20c1a2        	addi	a10, a1, 32
400d99f6:	d99381        	l32r	a8, 400d0044 <_stext+0x24> (4000c44c <memset>)
400d99f9:	0008e0        	callx8	a8
400d99fc:	0c2c      	movi.n	a12, 32
400d99fe:	2ac3b2        	addi	a11, a3, 42
400d9a01:	20c1a2        	addi	a10, a1, 32
400d9a04:	d98781        	l32r	a8, 400d0020 <_stext> (4000c2c8 <memcpy>)
400d9a07:	0008e0        	callx8	a8
400d9a0a:	600282        	l8ui	a8, a2, 96
400d9a0d:	db47d1        	l32r	a13, 400d072c <_stext+0x70c> (3f4016bc <_flash_rodata_start+0x159c>)
400d9a10:	1189      	s32i.n	a8, a1, 4
400d9a12:	122282        	l32i	a8, a2, 72
400d9a15:	db0db1        	l32r	a11, 400d064c <_stext+0x62c> (3f4012e1 <_flash_rodata_start+0x11c1>)
400d9a18:	0189      	s32i.n	a8, a1, 0
400d9a1a:	c2f8      	l32i.n	a15, a2, 48
400d9a1c:	20c1e2        	addi	a14, a1, 32
400d9a1f:	1fa1c2        	movi	a12, 0x11f
400d9a22:	3a0c      	movi.n	a10, 3
400d9a24:	057ee5        	call8	400df214 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d9a27:	180c      	movi.n	a8, 1
400d9a29:	704282        	s8i	a8, a2, 112
400d9a2c:	960382        	l8ui	a8, a3, 150
400d9a2f:	db40d1        	l32r	a13, 400d0730 <_stext+0x710> (3f4016f2 <_flash_rodata_start+0x15d2>)
400d9a32:	4189      	s32i.n	a8, a1, 16
400d9a34:	950382        	l8ui	a8, a3, 149
400d9a37:	db05b1        	l32r	a11, 400d064c <_stext+0x62c> (3f4012e1 <_flash_rodata_start+0x11c1>)
400d9a3a:	3189      	s32i.n	a8, a1, 12
400d9a3c:	940382        	l8ui	a8, a3, 148
400d9a3f:	26a1c2        	movi	a12, 0x126
400d9a42:	2189      	s32i.n	a8, a1, 8
400d9a44:	930382        	l8ui	a8, a3, 147
400d9a47:	5a0c      	movi.n	a10, 5
400d9a49:	1189      	s32i.n	a8, a1, 4
400d9a4b:	880382        	l8ui	a8, a3, 136
400d9a4e:	0189      	s32i.n	a8, a1, 0
400d9a50:	8703f2        	l8ui	a15, a3, 135
400d9a53:	8503e2        	l8ui	a14, a3, 133
400d9a56:	057be5        	call8	400df214 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d9a59:	8503b2        	l8ui	a11, a3, 133
400d9a5c:	02ad      	mov.n	a10, a2
400d9a5e:	ffcbb2        	addi	a11, a11, -1
400d9a61:	40fbb0        	nsau	a11, a11
400d9a64:	41b5b0        	srli	a11, a11, 5
400d9a67:	ff2165        	call8	400d8c7c <_ZN7esphome7switch_6Switch13publish_stateEb>
400d9a6a:	1a22a2        	l32i	a10, a2, 104
400d9a6d:	9a9c      	beqz.n	a10, 400d9a8a <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x152>
400d9a6f:	87a082        	movi	a8, 135
400d9a72:	808380        	add	a8, a3, a8
400d9a75:	000892        	l8ui	a9, a8, 0
400d9a78:	010882        	l8ui	a8, a8, 1
400d9a7b:	118880        	slli	a8, a8, 8
400d9a7e:	208890        	or	a8, a8, a9
400d9a81:	da0800        	ufloat.s	f0, a8, 0
400d9a84:	fab040        	rfr	a11, f0
400d9a87:	fefae5        	call8	400d8a34 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d9a8a:	1b22a2        	l32i	a10, a2, 108
400d9a8d:	aaac      	beqz.n	a10, 400d9abb <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x183>
400d9a8f:	93a082        	movi	a8, 147
400d9a92:	338a      	add.n	a3, a3, a8
400d9a94:	010382        	l8ui	a8, a3, 1
400d9a97:	000392        	l8ui	a9, a3, 0
400d9a9a:	118880        	slli	a8, a8, 8
400d9a9d:	208890        	or	a8, a8, a9
400d9aa0:	020392        	l8ui	a9, a3, 2
400d9aa3:	119900        	slli	a9, a9, 16
400d9aa6:	209980        	or	a9, a9, a8
400d9aa9:	030382        	l8ui	a8, a3, 3
400d9aac:	018880        	slli	a8, a8, 24
400d9aaf:	208890        	or	a8, a8, a9
400d9ab2:	da0800        	ufloat.s	f0, a8, 0
400d9ab5:	fab040        	rfr	a11, f0
400d9ab8:	fef7a5        	call8	400d8a34 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d9abb:	44c1a2        	addi	a10, a1, 68
400d9abe:	ff5d25        	call8	400d9090 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d9ac1:	f01d      	retw.n
	...

400d9ac4 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>:
400d9ac4:	008136        	entry	a1, 64
400d9ac7:	a4a082        	movi	a8, 164
400d9aca:	3bb847        	bgeu	a8, a4, 400d9b09 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9acd:	000392        	l8ui	a9, a3, 0
400d9ad0:	fea082        	movi	a8, 254
400d9ad3:	329987        	bne	a9, a8, 400d9b09 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9ad6:	010382        	l8ui	a8, a3, 1
400d9ad9:	10af92        	movi	a9, -240
400d9adc:	808890        	add	a8, a8, a9
400d9adf:	01a092        	movi	a9, 1
400d9ae2:	839880        	moveqz	a9, a8, a8
400d9ae5:	08ec      	bnez.n	a8, 400d9b09 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9ae7:	5baf82        	movi	a8, -165
400d9aea:	448a      	add.n	a4, a4, a8
400d9aec:	180c      	movi.n	a8, 1
400d9aee:	838940        	moveqz	a8, a9, a4
400d9af1:	48dc      	bnez.n	a8, 400d9b09 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9af3:	3c0c      	movi.n	a12, 3
400d9af5:	12c3b2        	addi	a11, a3, 18
400d9af8:	01ad      	mov.n	a10, a1
400d9afa:	ff7125        	call8	400d920c <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d9afd:	4278      	l32i.n	a7, a2, 16
400d9aff:	3248      	l32i.n	a4, a2, 12
400d9b01:	089747        	bne	a7, a4, 400d9b0d <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x49>
400d9b04:	01ad      	mov.n	a10, a1
400d9b06:	ff58a5        	call8	400d9090 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d9b09:	f01d      	retw.n
400d9b0b:	220000        	orb	b0, b0, b0
400d9b0e:	100024        	lsi	f2, a0, 64
400d9b11:	ad20b1        	l32r	a11, 400c4f94 <_rtc_text_end+0x4f94>
400d9b14:	3fa502        	movi	a0, 0x53f
400d9b17:	ff          	.byte 0xff
400d9b18:	8a8c      	beqz.n	a10, 400d9b24 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x60>
400d9b1a:	a5a0c2        	movi	a12, 165
400d9b1d:	03bd      	mov.n	a11, a3
400d9b1f:	02ad      	mov.n	a10, a2
400d9b21:	ffe165        	call8	400d9938 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>
400d9b24:	444b      	addi.n	a4, a4, 4
400d9b26:	fff5c6        	j	400d9b01 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x3d>
400d9b29:	000000        	ill

400d9b2c <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv>:
400d9b2c:	024136        	entry	a1, 0x120
400d9b2f:	022282        	l32i	a8, a2, 8
400d9b32:	01a816        	beqz	a8, 400d9b50 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9b35:	2288      	l32i.n	a8, a2, 8
400d9b37:	00a1c2        	movi	a12, 0x100
400d9b3a:	08a8      	l32i.n	a10, a8, 0
400d9b3c:	01bd      	mov.n	a11, a1
400d9b3e:	230a65        	call8	400fcbe4 <lwip_read>
400d9b41:	0acd      	mov.n	a12, a10
400d9b43:	091aa6        	blti	a10, 1, 400d9b50 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9b46:	01bd      	mov.n	a11, a1
400d9b48:	02ad      	mov.n	a10, a2
