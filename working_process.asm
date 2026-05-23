400d9a84 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>:
400d9a84:	008136        	entry	a1, 64
400d9a87:	a4a082        	movi	a8, 164
400d9a8a:	3bb847        	bgeu	a8, a4, 400d9ac9 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9a8d:	000392        	l8ui	a9, a3, 0
400d9a90:	fea082        	movi	a8, 254
400d9a93:	329987        	bne	a9, a8, 400d9ac9 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9a96:	010382        	l8ui	a8, a3, 1
400d9a99:	10af92        	movi	a9, -240
400d9a9c:	808890        	add	a8, a8, a9
400d9a9f:	01a092        	movi	a9, 1
400d9aa2:	839880        	moveqz	a9, a8, a8
400d9aa5:	08ec      	bnez.n	a8, 400d9ac9 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9aa7:	5baf82        	movi	a8, -165
400d9aaa:	448a      	add.n	a4, a4, a8
400d9aac:	180c      	movi.n	a8, 1
400d9aae:	838940        	moveqz	a8, a9, a4
400d9ab1:	48dc      	bnez.n	a8, 400d9ac9 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9ab3:	3c0c      	movi.n	a12, 3
400d9ab5:	12c3b2        	addi	a11, a3, 18
400d9ab8:	01ad      	mov.n	a10, a1
400d9aba:	ff7465        	call8	400d9200 <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d9abd:	4278      	l32i.n	a7, a2, 16
400d9abf:	3248      	l32i.n	a4, a2, 12
400d9ac1:	089747        	bne	a7, a4, 400d9acd <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x49>
400d9ac4:	01ad      	mov.n	a10, a1
400d9ac6:	ff5be5        	call8	400d9084 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d9ac9:	f01d      	retw.n
400d9acb:	220000        	orb	b0, b0, b0
400d9ace:	100024        	lsi	f2, a0, 64
400d9ad1:	ad20b1        	l32r	a11, 400c4f54 <_rtc_text_end+0x4f54>
400d9ad4:	42e502        	s32c1i	a0, a5, 0x108
400d9ad7:	ff          	.byte 0xff
400d9ad8:	8a8c      	beqz.n	a10, 400d9ae4 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x60>
400d9ada:	a5a0c2        	movi	a12, 165
400d9add:	03bd      	mov.n	a11, a3
400d9adf:	02ad      	mov.n	a10, a2
400d9ae1:	ffe4a5        	call8	400d992c <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>
400d9ae4:	444b      	addi.n	a4, a4, 4
400d9ae6:	fff5c6        	j	400d9ac1 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x3d>
400d9ae9:	000000        	ill

400d9aec <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv>:
400d9aec:	024136        	entry	a1, 0x120
400d9aef:	022282        	l32i	a8, a2, 8
400d9af2:	01a816        	beqz	a8, 400d9b10 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9af5:	2288      	l32i.n	a8, a2, 8
400d9af7:	00a1c2        	movi	a12, 0x100
400d9afa:	08a8      	l32i.n	a10, a8, 0
400d9afc:	01bd      	mov.n	a11, a1
400d9afe:	230a65        	call8	400fcba4 <lwip_read>
400d9b01:	0acd      	mov.n	a12, a10
400d9b03:	091aa6        	blti	a10, 1, 400d9b10 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9b06:	01bd      	mov.n	a11, a1
400d9b08:	02ad      	mov.n	a10, a2
400d9b0a:	fff7a5        	call8	400d9a84 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>
400d9b0d:	fff906        	j	400d9af5 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x9>
400d9b10:	f01d      	retw.n
	...

400d9b14 <_ZN7esphome10web_server20ListEntitiesIterator9on_sensorEPNS_6sensor6SensorE>:
400d9b14:	004136        	entry	a1, 32
400d9b17:	32a8      	l32i.n	a10, a2, 12
400d9b19:	db05d1        	l32r	a13, 400d0730 <_stext+0x710> (400daa50 <_ZN7esphome10web_server9WebServer25sensor_all_json_generatorEPS1_Pv>)
400d9b1c:	db06c1        	l32r	a12, 400d0734 <_stext+0x714> (3f4016f2 <_flash_rodata_start+0x15d2>)
400d9b1f:	03bd      	mov.n	a11, a3
400d9b21:	0208a5        	call8	400dbbac <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9b24:	120c      	movi.n	a2, 1
400d9b26:	f01d      	retw.n

400d9b28 <_ZN7esphome10web_server20ListEntitiesIterator9on_switchEPNS_7switch_6SwitchE>:
400d9b28:	004136        	entry	a1, 32
400d9b2b:	32a8      	l32i.n	a10, a2, 12
400d9b2d:	db02d1        	l32r	a13, 400d0738 <_stext+0x718> (400da7b4 <_ZN7esphome10web_server9WebServer25switch_all_json_generatorEPS1_Pv>)
400d9b30:	db01c1        	l32r	a12, 400d0734 <_stext+0x714> (3f4016f2 <_flash_rodata_start+0x15d2>)
400d9b33:	03bd      	mov.n	a11, a3
400d9b35:	020765        	call8	400dbbac <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9b38:	120c      	movi.n	a2, 1
400d9b3a:	f01d      	retw.n

400d9b3c <_ZN7esphome10web_server20ListEntitiesIteratorC1EPKNS0_9WebServerEPNS_14web_server_idf16AsyncEventSourceE>:
