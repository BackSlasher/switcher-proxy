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
400d9b4a:	fff7a5        	call8	400d9ac4 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>
400d9b4d:	fff906        	j	400d9b35 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x9>
400d9b50:	f01d      	retw.n
	...

400d9b54 <_ZN7esphome10web_server20ListEntitiesIterator9on_sensorEPNS_6sensor6SensorE>:
400d9b54:	004136        	entry	a1, 32
400d9b57:	32a8      	l32i.n	a10, a2, 12
400d9b59:	daf6d1        	l32r	a13, 400d0734 <_stext+0x714> (400daa90 <_ZN7esphome10web_server9WebServer25sensor_all_json_generatorEPS1_Pv>)
400d9b5c:	daf7c1        	l32r	a12, 400d0738 <_stext+0x718> (3f40174a <_flash_rodata_start+0x162a>)
400d9b5f:	03bd      	mov.n	a11, a3
400d9b61:	0208a5        	call8	400dbbec <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9b64:	120c      	movi.n	a2, 1
400d9b66:	f01d      	retw.n

400d9b68 <_ZN7esphome10web_server20ListEntitiesIterator9on_switchEPNS_7switch_6SwitchE>:
400d9b68:	004136        	entry	a1, 32
400d9b6b:	32a8      	l32i.n	a10, a2, 12
400d9b6d:	daf3d1        	l32r	a13, 400d073c <_stext+0x71c> (400da7f4 <_ZN7esphome10web_server9WebServer25switch_all_json_generatorEPS1_Pv>)
400d9b70:	daf2c1        	l32r	a12, 400d0738 <_stext+0x718> (3f40174a <_flash_rodata_start+0x162a>)
400d9b73:	03bd      	mov.n	a11, a3
400d9b75:	020765        	call8	400dbbec <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9b78:	120c      	movi.n	a2, 1
400d9b7a:	f01d      	retw.n

400d9b7c <_ZN7esphome10web_server20ListEntitiesIteratorC1EPKNS0_9WebServerEPNS_14web_server_idf16AsyncEventSourceE>:
