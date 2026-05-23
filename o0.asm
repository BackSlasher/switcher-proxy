400d9548 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>:
400d9548:	012136        	entry	a1, 144
400d954b:	3c0c      	movi.n	a12, 3
400d954d:	12c3b2        	addi	a11, a3, 18
400d9550:	44c1a2        	addi	a10, a1, 68
400d9553:	ff8c65        	call8	400d8e18 <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d9556:	700282        	l8ui	a8, a2, 112
400d9559:	0df856        	bnez	a8, 400d963c <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0xf4>
400d955c:	30c262        	addi	a6, a2, 48
400d955f:	20a660        	or	a10, a6, a6
400d9562:	122172        	l32i	a7, a1, 72
400d9565:	ff7065        	call8	400d8c6c <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE8capacityEv>
400d9568:	20baa0        	or	a11, a10, a10
400d956b:	25ba77        	bgeu	a10, a7, 400d9594 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x4c>
400d956e:	086172        	s32i	a7, a1, 32
400d9571:	20c1a2        	addi	a10, a1, 32
400d9574:	ff4525        	call8	400d89c8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERjj$isra$0>
400d9577:	0a5d      	mov.n	a5, a10
400d9579:	06ad      	mov.n	a10, a6
400d957b:	ff71e5        	call8	400d8c98 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d957e:	8188      	l32i.n	a8, a1, 32
400d9580:	c259      	s32i.n	a5, a2, 48
400d9582:	e289      	s32i.n	a8, a2, 56
400d9584:	1121b2        	l32i	a11, a1, 68
400d9587:	c2a8      	l32i.n	a10, a2, 48
400d9589:	07cd      	mov.n	a12, a7
400d958b:	ff72a5        	call8	400d8cb4 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_S_copyEPcPKcj>
400d958e:	000146        	j	400d9597 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x4f>
400d9591:	000000        	ill
400d9594:	fec756        	bnez	a7, 400d9584 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x3c>
400d9597:	0c2282        	l32i	a8, a2, 48
400d959a:	d279      	s32i.n	a7, a2, 52
400d959c:	887a      	add.n	a8, a8, a7
400d959e:	090c      	movi.n	a9, 0
400d95a0:	004892        	s8i	a9, a8, 0
400d95a3:	280382        	l8ui	a8, a3, 40
400d95a6:	dc66c1        	l32r	a12, 400d0740 <_stext+0x720> (3f4016b0 <_flash_rodata_start+0x1590>)
400d95a9:	604282        	s8i	a8, a2, 96
400d95ac:	4d0382        	l8ui	a8, a3, 77
400d95af:	4c0392        	l8ui	a9, a3, 76
400d95b2:	118880        	slli	a8, a8, 8
400d95b5:	208890        	or	a8, a8, a9
400d95b8:	4e0392        	l8ui	a9, a3, 78
400d95bb:	0b1c      	movi.n	a11, 16
400d95bd:	119900        	slli	a9, a9, 16
400d95c0:	209980        	or	a9, a9, a8
400d95c3:	4f0382        	l8ui	a8, a3, 79
400d95c6:	5cc1a2        	addi	a10, a1, 92
400d95c9:	018880        	slli	a8, a8, 24
400d95cc:	208890        	or	a8, a8, a9
400d95cf:	196282        	s32i	a8, a2, 100
400d95d2:	4f0382        	l8ui	a8, a3, 79
400d95d5:	0189      	s32i.n	a8, a1, 0
400d95d7:	4e03f2        	l8ui	a15, a3, 78
400d95da:	4d03e2        	l8ui	a14, a3, 77
400d95dd:	4c03d2        	l8ui	a13, a3, 76
400d95e0:	db4781        	l32r	a8, 400d02fc <_stext+0x2dc> (40168780 <snprintf>)
400d95e3:	0008e0        	callx8	a8
400d95e6:	5cc1a2        	addi	a10, a1, 92
400d95e9:	da9f81        	l32r	a8, 400d0068 <_stext+0x48> (400014c0 <strlen>)
400d95ec:	0008e0        	callx8	a8
400d95ef:	1322c2        	l32i	a12, a2, 76
400d95f2:	0aed      	mov.n	a14, a10
400d95f4:	5cc1d2        	addi	a13, a1, 92
400d95f7:	0b0c      	movi.n	a11, 0
400d95f9:	48c2a2        	addi	a10, a2, 72
400d95fc:	ff91e5        	call8	400d8f1c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEjjPKcj>
400d95ff:	1c2c      	movi.n	a12, 33
400d9601:	0b0c      	movi.n	a11, 0
400d9603:	20c1a2        	addi	a10, a1, 32
400d9606:	da9181        	l32r	a8, 400d004c <_stext+0x2c> (4000c44c <memset>)
400d9609:	0008e0        	callx8	a8
400d960c:	0c2c      	movi.n	a12, 32
400d960e:	2ac3b2        	addi	a11, a3, 42
400d9611:	20c1a2        	addi	a10, a1, 32
400d9614:	da8481        	l32r	a8, 400d0024 <_stext+0x4> (4000c2c8 <memcpy>)
400d9617:	0008e0        	callx8	a8
400d961a:	600282        	l8ui	a8, a2, 96
400d961d:	dc49d1        	l32r	a13, 400d0744 <_stext+0x724> (3f4016bc <_flash_rodata_start+0x159c>)
400d9620:	1189      	s32i.n	a8, a1, 4
400d9622:	122282        	l32i	a8, a2, 72
400d9625:	dc0eb1        	l32r	a11, 400d0660 <_stext+0x640> (3f4012e1 <_flash_rodata_start+0x11c1>)
400d9628:	0189      	s32i.n	a8, a1, 0
400d962a:	c2f8      	l32i.n	a15, a2, 48
400d962c:	20c1e2        	addi	a14, a1, 32
400d962f:	1fa1c2        	movi	a12, 0x11f
400d9632:	3a0c      	movi.n	a10, 3
400d9634:	0585a5        	call8	400dee90 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d9637:	180c      	movi.n	a8, 1
400d9639:	704282        	s8i	a8, a2, 112
400d963c:	960382        	l8ui	a8, a3, 150
400d963f:	dc42d1        	l32r	a13, 400d0748 <_stext+0x728> (3f4016f2 <_flash_rodata_start+0x15d2>)
400d9642:	4189      	s32i.n	a8, a1, 16
400d9644:	950382        	l8ui	a8, a3, 149
400d9647:	dc06b1        	l32r	a11, 400d0660 <_stext+0x640> (3f4012e1 <_flash_rodata_start+0x11c1>)
400d964a:	3189      	s32i.n	a8, a1, 12
400d964c:	940382        	l8ui	a8, a3, 148
400d964f:	26a1c2        	movi	a12, 0x126
400d9652:	2189      	s32i.n	a8, a1, 8
400d9654:	930382        	l8ui	a8, a3, 147
400d9657:	5a0c      	movi.n	a10, 5
400d9659:	1189      	s32i.n	a8, a1, 4
400d965b:	880382        	l8ui	a8, a3, 136
400d965e:	0189      	s32i.n	a8, a1, 0
400d9660:	8703f2        	l8ui	a15, a3, 135
400d9663:	8503e2        	l8ui	a14, a3, 133
400d9666:	0582a5        	call8	400dee90 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d9669:	8503b2        	l8ui	a11, a3, 133
400d966c:	02ad      	mov.n	a10, a2
400d966e:	ffcbb2        	addi	a11, a11, -1
400d9671:	40fbb0        	nsau	a11, a11
400d9674:	41b5b0        	srli	a11, a11, 5
400d9677:	ff1fe5        	call8	400d8874 <_ZN7esphome7switch_6Switch13publish_stateEb>
400d967a:	1a22a2        	l32i	a10, a2, 104
400d967d:	9a9c      	beqz.n	a10, 400d969a <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x152>
400d967f:	87a082        	movi	a8, 135
400d9682:	808380        	add	a8, a3, a8
400d9685:	000892        	l8ui	a9, a8, 0
400d9688:	010882        	l8ui	a8, a8, 1
400d968b:	118880        	slli	a8, a8, 8
400d968e:	208890        	or	a8, a8, a9
400d9691:	da0800        	ufloat.s	f0, a8, 0
400d9694:	fab040        	rfr	a11, f0
400d9697:	fef8a5        	call8	400d8620 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d969a:	1b22a2        	l32i	a10, a2, 108
400d969d:	aaac      	beqz.n	a10, 400d96cb <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj+0x183>
400d969f:	93a082        	movi	a8, 147
400d96a2:	338a      	add.n	a3, a3, a8
400d96a4:	010382        	l8ui	a8, a3, 1
400d96a7:	000392        	l8ui	a9, a3, 0
400d96aa:	118880        	slli	a8, a8, 8
400d96ad:	208890        	or	a8, a8, a9
400d96b0:	020392        	l8ui	a9, a3, 2
400d96b3:	119900        	slli	a9, a9, 16
400d96b6:	209980        	or	a9, a9, a8
400d96b9:	030382        	l8ui	a8, a3, 3
400d96bc:	018880        	slli	a8, a8, 24
400d96bf:	208890        	or	a8, a8, a9
400d96c2:	da0800        	ufloat.s	f0, a8, 0
400d96c5:	fab040        	rfr	a11, f0
400d96c8:	fef565        	call8	400d8620 <_ZN7esphome6sensor6Sensor13publish_stateEf>
400d96cb:	44c1a2        	addi	a10, a1, 68
400d96ce:	ff5ca5        	call8	400d8c98 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d96d1:	f01d      	retw.n
	...

400d96d4 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>:
400d96d4:	008136        	entry	a1, 64
400d96d7:	a4a082        	movi	a8, 164
400d96da:	3bb847        	bgeu	a8, a4, 400d9719 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d96dd:	000392        	l8ui	a9, a3, 0
400d96e0:	fea082        	movi	a8, 254
400d96e3:	329987        	bne	a9, a8, 400d9719 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d96e6:	010382        	l8ui	a8, a3, 1
400d96e9:	10af92        	movi	a9, -240
400d96ec:	808890        	add	a8, a8, a9
400d96ef:	01a092        	movi	a9, 1
400d96f2:	839880        	moveqz	a9, a8, a8
400d96f5:	08ec      	bnez.n	a8, 400d9719 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d96f7:	5baf82        	movi	a8, -165
400d96fa:	448a      	add.n	a4, a4, a8
400d96fc:	180c      	movi.n	a8, 1
400d96fe:	838940        	moveqz	a8, a9, a4
400d9701:	48dc      	bnez.n	a8, 400d9719 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x45>
400d9703:	3c0c      	movi.n	a12, 3
400d9705:	12c3b2        	addi	a11, a3, 18
400d9708:	01ad      	mov.n	a10, a1
400d970a:	ff70e5        	call8	400d8e18 <_ZN7esphome14switcher_proxyL7hexlifyEPKhj>
400d970d:	4278      	l32i.n	a7, a2, 16
400d970f:	3248      	l32i.n	a4, a2, 12
400d9711:	089747        	bne	a7, a4, 400d971d <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x49>
400d9714:	01ad      	mov.n	a10, a1
400d9716:	ff5825        	call8	400d8c98 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv>
400d9719:	f01d      	retw.n
400d971b:	220000        	orb	b0, b0, b0
400d971e:	100024        	lsi	f2, a0, 64
400d9721:	ad20b1        	l32r	a11, 400c4ba4 <_rtc_text_end+0x4ba4>
400d9724:	3ee502        	s32c1i	a0, a5, 248
400d9727:	ff          	.byte 0xff
400d9728:	8a8c      	beqz.n	a10, 400d9734 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x60>
400d972a:	a5a0c2        	movi	a12, 165
400d972d:	03bd      	mov.n	a11, a3
400d972f:	02ad      	mov.n	a10, a2
400d9731:	ffe165        	call8	400d9548 <_ZN7esphome14switcher_proxy14SwitcherDevice16handle_broadcastEPKhj>
400d9734:	444b      	addi.n	a4, a4, 4
400d9736:	fff5c6        	j	400d9711 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj+0x3d>
400d9739:	000000        	ill

400d973c <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv>:
400d973c:	024136        	entry	a1, 0x120
400d973f:	022282        	l32i	a8, a2, 8
400d9742:	01a816        	beqz	a8, 400d9760 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9745:	2288      	l32i.n	a8, a2, 8
400d9747:	00a1c2        	movi	a12, 0x100
400d974a:	08a8      	l32i.n	a10, a8, 0
400d974c:	01bd      	mov.n	a11, a1
400d974e:	3dd5e5        	call8	401174ac <lwip_read>
400d9751:	0acd      	mov.n	a12, a10
400d9753:	091aa6        	blti	a10, 1, 400d9760 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x24>
400d9756:	01bd      	mov.n	a11, a1
400d9758:	02ad      	mov.n	a10, a2
400d975a:	fff7a5        	call8	400d96d4 <_ZN7esphome14switcher_proxy11SwitcherHub17process_broadcastEPKhj>
400d975d:	fff906        	j	400d9745 <_ZN7esphome14switcher_proxy11SwitcherHub4loopEv+0x9>
400d9760:	f01d      	retw.n
	...

400d9764 <_ZN7esphome10web_server20ListEntitiesIterator9on_sensorEPNS_6sensor6SensorE>:
400d9764:	004136        	entry	a1, 32
400d9767:	32a8      	l32i.n	a10, a2, 12
400d9769:	dbf8d1        	l32r	a13, 400d074c <_stext+0x72c> (400da6ac <_ZN7esphome10web_server9WebServer25sensor_all_json_generatorEPS1_Pv>)
400d976c:	dbf9c1        	l32r	a12, 400d0750 <_stext+0x730> (3f40174a <_flash_rodata_start+0x162a>)
400d976f:	03bd      	mov.n	a11, a3
400d9771:	020ba5        	call8	400db82c <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9774:	120c      	movi.n	a2, 1
400d9776:	f01d      	retw.n

400d9778 <_ZN7esphome10web_server20ListEntitiesIterator9on_switchEPNS_7switch_6SwitchE>:
400d9778:	004136        	entry	a1, 32
400d977b:	32a8      	l32i.n	a10, a2, 12
400d977d:	dbf5d1        	l32r	a13, 400d0754 <_stext+0x734> (400da410 <_ZN7esphome10web_server9WebServer25switch_all_json_generatorEPS1_Pv>)
400d9780:	dbf4c1        	l32r	a12, 400d0750 <_stext+0x730> (3f40174a <_flash_rodata_start+0x162a>)
400d9783:	03bd      	mov.n	a11, a3
400d9785:	020a65        	call8	400db82c <_ZN7esphome14web_server_idf16AsyncEventSource21deferrable_send_stateEPvPKcPFNS_4json19SerializationBufferILj640EEEPNS_10web_server9WebServerES2_E>
400d9788:	120c      	movi.n	a2, 1
400d978a:	f01d      	retw.n

400d978c <_ZN7esphome10web_server20ListEntitiesIteratorC1EPKNS0_9WebServerEPNS_14web_server_idf16AsyncEventSourceE>:
400d978c:	004136        	entry	a1, 32
400d978f:	080c      	movi.n	a8, 0
400d9791:	1289      	s32i.n	a8, a2, 4
400d9793:	dbf181        	l32r	a8, 400d0758 <_stext+0x738> (3f410bf8 <_ZTVN7esphome10web_server20ListEntitiesIteratorE+0x8>)
400d9796:	2239      	s32i.n	a3, a2, 8
400d9798:	0289      	s32i.n	a8, a2, 0
400d979a:	3249      	s32i.n	a4, a2, 12
400d979c:	f01d      	retw.n
	...

400d97a0 <_ZNK7esphome10web_server9WebServer18get_setup_priorityEv>:
400d97a0:	004136        	entry	a1, 32
400d97a3:	dbee21        	l32r	a2, 400d075c <_stext+0x73c> (43790000 <_etext+0x3616850>)
400d97a6:	f01d      	retw.n

400d97a8 <_ZThn4_NK7esphome10web_server9WebServer18get_setup_priorityEv>:
400d97a8:	004136        	entry	a1, 32
400d97ab:	dbec21        	l32r	a2, 400d075c <_stext+0x73c> (43790000 <_etext+0x3616850>)
400d97ae:	f01d      	retw.n

400d97b0 <_ZN7esphome10web_server9WebServer11dump_configEv>:
400d97b0:	004136        	entry	a1, 32
400d97b3:	da9281        	l32r	a8, 400d01fc <_stext+0x1dc> (3ffb3fb0 <_ZN7esphome4wifi21global_wifi_componentE>)
400d97b6:	052292        	l32i	a9, a2, 20
400d97b9:	002882        	l32i	a8, a8, 0
400d97bc:	0119f2        	l16ui	a15, a9, 2
400d97bf:	2c28e2        	l32i	a14, a8, 176
400d97c2:	dbe7d1        	l32r	a13, 400d0760 <_stext+0x740> (3f40175b <_flash_rodata_start+0x163b>)
400d97c5:	dbe7b1        	l32r	a11, 400d0764 <_stext+0x744> (3f401778 <_flash_rodata_start+0x1658>)
400d97c8:	bfa1c2        	movi	a12, 0x1bf
400d97cb:	04a0a2        	movi	a10, 4
400d97ce:	056c25        	call8	400dee90 <_ZN7esphome15esp_log_printf_EiPKciS1_z>
400d97d1:	f01d      	retw.n
	...

400d97d4 <_ZThn4_N7esphome10web_server9WebServer11dump_configEv>:
400d97d4:	004136        	entry	a1, 32
400d97d7:	fcc2a2        	addi	a10, a2, -4
400d97da:	fffd65        	call8	400d97b0 <_ZN7esphome10web_server9WebServer11dump_configEv>
400d97dd:	f01d      	retw.n
	...

400d97e0 <_ZN7esphome14web_server_idf29AsyncWebServerResponseProgmemD0Ev>:
400d97e0:	004136        	entry	a1, 32
400d97e3:	02ad      	mov.n	a10, a2
400d97e5:	0b1c      	movi.n	a11, 16
400d97e7:	da4981        	l32r	a8, 400d010c <_stext+0xec> (4015f290 <_ZdlPvj>)
400d97ea:	0008e0        	callx8	a8
400d97ed:	f01d      	retw.n
	...

400d97f0 <_ZN7esphome14web_server_idf27AsyncWebServerResponseEmptyD0Ev>:
400d97f0:	004136        	entry	a1, 32
400d97f3:	02ad      	mov.n	a10, a2
400d97f5:	8b0c      	movi.n	a11, 8
400d97f7:	da4581        	l32r	a8, 400d010c <_stext+0xec> (4015f290 <_ZdlPvj>)
400d97fa:	0008e0        	callx8	a8
400d97fd:	f01d      	retw.n
	...

400d9800 <_ZN7esphome10web_server9WebServer4loopEv>:
400d9800:	004136        	entry	a1, 32
400d9803:	18c2a2        	addi	a10, a2, 24
400d9806:	01efe5        	call8	400db704 <_ZN7esphome14web_server_idf16AsyncEventSource4loopEv>
400d9809:	005a56        	bnez	a10, 400d9812 <_ZN7esphome10web_server9WebServer4loopEv+0x12>
400d980c:	04c2a2        	addi	a10, a2, 4
400d980f:	04d4a5        	call8	400de558 <_ZN7esphome9Component12disable_loopEv>
400d9812:	f01d      	retw.n

400d9814 <_ZThn4_N7esphome10web_server9WebServer4loopEv>:
400d9814:	004136        	entry	a1, 32
400d9817:	fcc2a2        	addi	a10, a2, -4
400d981a:	fffe65        	call8	400d9800 <_ZN7esphome10web_server9WebServer4loopEv>
400d981d:	f01d      	retw.n
