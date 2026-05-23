400d992c <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>:
400d992c:	010136        	entry	a1, 128
400d992f:	3c0c      	movi.n	a12, 3
400d9931:	12c3b2        	addi	a11, a3, 18
400d9934:	34c1a2        	addi	a10, a1, 52
400d9937:	ff8ca5        	call8	400d9200 <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d993a:	700282        	l8ui	a8, a2, 112
400d993d:	0da856        	bnez	a8, 400d9a1b <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0xef>
400d9940:	30c262        	addi	a6, a2, 48
400d9943:	06ad      	mov.n	a10, a6
400d9945:	e178      	l32i.n	a7, a1, 56
400d9947:	ff7125        	call8	400d9058 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv>
400d994a:	0abd      	mov.n	a11, a10
400d994c:	24ba77        	bgeu	a10, a7, 400d9974 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x48>
400d994f:	4179      	s32i.n	a7, a1, 16
400d9951:	10c1a2        	addi	a10, a1, 16
400d9954:	ff46e5        	call8	400d8dc4 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj$isra$0>
400d9957:	0a5d      	mov.n	a5, a10
400d9959:	06ad      	mov.n	a10, a6
400d995b:	ff72a5        	call8	400d9084 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d995e:	4188      	l32i.n	a8, a1, 16
400d9960:	c259      	s32i.n	a5, a2, 48
400d9962:	e289      	s32i.n	a8, a2, 56
400d9964:	0d21b2        	l32i	a11, a1, 52
400d9967:	0c22a2        	l32i	a10, a2, 48
400d996a:	20c770        	or	a12, a7, a7
400d996d:	ff72e5        	call8	400d909c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcj>
400d9970:	0000c6        	j	400d9977 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x4b>
400d9973:	c75600        	lsi	f0, a6, 0x31c
400d9976:	fe          	.byte 0xfe
400d9977:	c288      	l32i.n	a8, a2, 48
400d9979:	d279      	s32i.n	a7, a2, 52
400d997b:	887a      	add.n	a8, a8, a7
400d997d:	090c      	movi.n	a9, 0
400d997f:	004892        	s8i	a9, a8, 0
400d9982:	280382        	l8ui	a8, a3, 40
400d9985:	db68c1        	l32r	a12, 400d0728 <_stext+0x708> (3f4016b0 <_flash_rodata_start+0x1590>)
400d9988:	604282        	s8i	a8, a2, 96
400d998b:	4d0382        	l8ui	a8, a3, 77
400d998e:	4c0392        	l8ui	a9, a3, 76
400d9991:	118880        	slli	a8, a8, 8
400d9994:	208890        	or	a8, a8, a9
400d9997:	4e0392        	l8ui	a9, a3, 78
400d999a:	0b1c      	movi.n	a11, 16
400d999c:	119900        	slli	a9, a9, 16
400d999f:	209980        	or	a9, a9, a8
400d99a2:	4f0382        	l8ui	a8, a3, 79
400d99a5:	4cc1a2        	addi	a10, a1, 76
400d99a8:	018880        	slli	a8, a8, 24
400d99ab:	208890        	or	a8, a8, a9
400d99ae:	196282        	s32i	a8, a2, 100
400d99b1:	4f0382        	l8ui	a8, a3, 79
400d99b4:	0189      	s32i.n	a8, a1, 0
400d99b6:	4e03f2        	l8ui	a15, a3, 78
400d99b9:	4d03e2        	l8ui	a14, a3, 77
400d99bc:	4c03d2        	l8ui	a13, a3, 76
400d99bf:	da4b81        	l32r	a8, 400d02ec <_stext+0x2cc> (4014e3a0 <snprintf>)
400d99c2:	0008e0        	callx8	a8
400d99c5:	4cc1a2        	addi	a10, a1, 76
400d99c8:	d9a681        	l32r	a8, 400d0060 <_stext+0x40> (400014c0 <strlen>)
400d99cb:	0008e0        	callx8	a8
400d99ce:	1322c2        	l32i	a12, a2, 76
400d99d1:	0aed      	mov.n	a14, a10
400d99d3:	4cc1d2        	addi	a13, a1, 76
400d99d6:	0b0c      	movi.n	a11, 0
400d99d8:	48c2a2        	addi	a10, a2, 72
400d99db:	ff92a5        	call8	400d9304 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj>
400d99de:	1c2c      	movi.n	a12, 33
400d99e0:	0b0c      	movi.n	a11, 0
400d99e2:	10c1a2        	addi	a10, a1, 16
400d99e5:	d99781        	l32r	a8, 400d0044 <_stext+0x24> (4000c44c <memset>)
400d99e8:	0008e0        	callx8	a8
400d99eb:	0c2c      	movi.n	a12, 32
400d99ed:	2ac3b2        	addi	a11, a3, 42
400d99f0:	10c1a2        	addi	a10, a1, 16
400d99f3:	d98b81        	l32r	a8, 400d0020 <_stext> (4000c2c8 <memcpy>)
400d99f6:	0008e0        	callx8	a8
400d99f9:	600282        	l8ui	a8, a2, 96
400d99fc:	db4cd1        	l32r	a13, 400d072c <_stext+0x70c> (3f4016bc <_flash_rodata_start+0x159c>)
400d99ff:	1189      	s32i.n	a8, a1, 4
400d9a01:	122282        	l32i	a8, a2, 72
400d9a04:	db12b1        	l32r	a11, 400d064c <_stext+0x62c> (3f4012e1 <_flash_rodata_start+0x11c1>)
400d9a07:	0189      	s32i.n	a8, a1, 0
400d9a09:	c2f8      	l32i.n	a15, a2, 48
400d9a0b:	10c1e2        	addi	a14, a1, 16
400d9a0e:	1fa1c2        	movi	a12, 0x11f
400d9a11:	3a0c      	movi.n	a10, 3
400d9a13:	057c25        	call8	400df1d4 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d9a16:	180c      	movi.n	a8, 1
400d9a18:	704282        	s8i	a8, a2, 112
400d9a1b:	8503b2        	l8ui	a11, a3, 133
400d9a1e:	02ad      	mov.n	a10, a2
400d9a20:	bb0b      	addi.n	a11, a11, -1
400d9a22:	40fbb0        	nsau	a11, a11
400d9a25:	41b5b0        	srli	a11, a11, 5
400d9a28:	ff2465        	call8	400d8c70 <_ZN7esphome7switch_6Switch13publish_stateEb>
400d9a2b:	1a22a2        	l32i	a10, a2, 104
400d9a2e:	8a9c      	beqz.n	a10, 400d9a4a <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x11e>
400d9a30:	87a082        	movi	a8, 135
400d9a33:	838a      	add.n	a8, a3, a8
400d9a35:	000892        	l8ui	a9, a8, 0
400d9a38:	010882        	l8ui	a8, a8, 1
400d9a3b:	118880        	slli	a8, a8, 8
400d9a3e:	208890        	or	a8, a8, a9
400d9a41:	da0800        	ufloat.s	f0, a8, 0
400d9a44:	fab040        	rfr	a11, f0
400d9a47:	fefe25        	call8	400d8a28 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d9a4a:	1b22a2        	l32i	a10, a2, 108
400d9a4d:	aaac      	beqz.n	a10, 400d9a7b <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x14f>
400d9a4f:	93a082        	movi	a8, 147
400d9a52:	338a      	add.n	a3, a3, a8
400d9a54:	010382        	l8ui	a8, a3, 1
400d9a57:	000392        	l8ui	a9, a3, 0
400d9a5a:	118880        	slli	a8, a8, 8
400d9a5d:	208890        	or	a8, a8, a9
400d9a60:	020392        	l8ui	a9, a3, 2
400d9a63:	119900        	slli	a9, a9, 16
400d9a66:	209980        	or	a9, a9, a8
400d9a69:	030382        	l8ui	a8, a3, 3
400d9a6c:	018880        	slli	a8, a8, 24
400d9a6f:	208890        	or	a8, a8, a9
400d9a72:	da0800        	ufloat.s	f0, a8, 0
400d9a75:	fab040        	rfr	a11, f0
400d9a78:	fefae5        	call8	400d8a28 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d9a7b:	34c1a2        	addi	a10, a1, 52
400d9a7e:	ff6065        	call8	400d9084 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d9a81:	f01d      	retw.n
	...

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
