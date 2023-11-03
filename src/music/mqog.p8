pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
-- moonquest
-- an ezpz experience
-- ⬅️➡️⬆️⬇️❎🅾️
__gfx__
00000000077777700000000007777770077777700000777007777770000000000777777070888800000000008000000800700000070000000000000000000000
00000000777277270777777077727727777277270077777777727727077777707772772708888280000000000000000007700000077007770007770077000777
00070070777877877772772777787787777877870777727777787787777277277778778788822200000000000000000007770000777077277077277007700070
00007700777777777778778777777777777777770727787777777777777877877777777788262000000000000000000007777007770072227072227007770070
00007700777777777777777777777777777777770787777777777777777777777777777788227000000d00000000000007707777070072227072227007070070
00070070077777707777777707777770077777700077777707777770777777770777777082200600000000000000000000700770070072827072827007077070
000000000070060007777770007006000070060000777777007006000777777670000006080000d00d000d0000000000d0700070070078887078887007007770
000000000070060000700600070006000070600000077700070060000077006000000000000006d0d0d0000080000008d07d0000070078887078887007000770
067767600000000000007000e0000ee0000eee000eee0000ee00000000000000000000000000000000011000e000000e07700000d70077877077877007000070
6dddddd60000000000007000ee00eeee0eeeeeeeeeeee0eeeee00eee0000000d0000000000000000000110000000000007700000070007770007770077700777
7dd5d5d60000000000007000eee8e8e0ee8eeee0eeeeeee0eeeeeee0000000d10000000000000000000110000000000000700000070000000000000000000000
6d5dddd60000000000007000e8eeeee0eeee8ee0e8e8eee08e8eee80000000d111111111111110000001d11100000000007000d007077700000000d000000777
d5dd5dd60000000000007000e88e88e0e8e88e808e8e8ee00ee8eee000000d1d11111111111d1000000111110000000000700000070007777777777777777700
dd55d55d000000000000600088e8e88eee8808ee880088ee088ee8ee00000111000000000001100000000000000000000070d00007000d00000d0d00000d0000
d555555d000000000000600008888000e8800000800008000008880000000d10000000000001100000000000000000000070000d0700ddd000000d00000d0000
0dddddd00000000000077700000000000000000000000000000000000000d100000000000001100000000000e000000e0000000007700d000d000d0000dd0070
000000000eeeeeeeeeeeeeeeeeeeeee00eeeeeeeeeeeeeeeeeeeeee0000000000000000000011000000110009000000900000000000000000000ddd0000d0070
00000000e2222222222222222222222ee2222222222222222222222e0000000000000000000110000001100000000000000077777770070000000d0000000770
00000000e22272272222222222222228e2277722722222222222222e000000000000000000011000000110000000000000777770007700770000000700770077
0000000082222722222222222222222e827272722222222222222228000110000001111100011000111d100000000000077d7000000770700777077007070070
00000000e2722727222222222222222ee27777727222222222222228000d10000001d11100011000111110000000000007d77000000070700070070007070070
0000000082277222222222222222222882227722222222222222222e000110000001100000011000000000000000000077d70000000070700070077007000070
0000000082222222222222222222222882222222222222222222222800011000000110000001100000000000000000007dd70000000070700070070000700070
0000000008888888888888888888888008888888888888888888888000011000000110000001100000000000900000097dd70000000070700070070000770070
0000070000000700000070000007000000070000000000000000000000011000000000000000000000000000000000007dd77000000070770770077000070070
0000007000000700000007000000700000070000000000000000000000011000000000000000000000000000000000007ddd7000000070077700000707700070
0000007700000070000007000000700000070000000000000000000000011000000000000000000000000000000000007ddd770077777000000dddd000000070
00000077000000700000070000007000000700000000000000000000000d10000001d1111111d100000000000000000007ddd7777dd770000ddd00dd00000070
000000770000007000000700000070000007000000000000000000000001100000011111111111000000000000000000077ddddddd7d77000d00000dd0000070
7000077707000770007007000007700000070000000000000000000000000000000000000000000000000000000000000077ddddd77dd7770000dd00ddd00070
0777777000000700007077000007700000070000000000000000000000000000000000000000000000000000000000000007777777000000000dddd000dd0000
00777700007777000007700000070000000700000000000000000000000000000000000000000000000000000000000000000770000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbb0bbbbbbbbbbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
331313313133331313333133b33331333333133b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
113333333333133333313331b31333131313333b00000000000000000000000b0000000000000000000000000000000000000000000000000000000000000000
313131311313311313133331b1311333133133130000000000000000000000300000000000000000000000000000000700000000000000000000000000000000
131933911331311919113131b33131331311133b000000b00000000003b000b00bb0000000006000006600000000000600000000077777777777000000000000
911113131939119111313913333111913113131300b0030b00003000b0030030000b00b000066d000666d0000000000600000777777777777777777766000000
919199399131919993193191b31391199111311b0b000003000b00000b030300000b0b03000060000666d0030000000d00077777777777777777777776660000
991999919999991919339999311119999191111303003003300303000003030003030300030060030666d0300000000607777776667777776667777777666000
31919191911911139999999931191999991911130000700000000006666666666000000000000000000000000000000007777668887777778886677767666660
31111919999111139999999931911999999119130000600000006666066667606660000000000000000000000000000077777882286777768228877777766666
3311911999191113999999993111119999119113000766000066767606d67d606776600000000000000000000000000077777822288777788222877777676666
3119191999919133999999993119919999199113006676007667d7660d66d60066d7d70007770000007700000000770077776872228777782722877777666666
3111119999111111999999993111191999911113006766d000d666d600d66d00d6666d6776667700076677000007667077778278828777782782877776766666
313119999991911999999999311911999919111306d76660000ddd6d00ddd000dd6dd60076666677076666770007666777778878888777788788877777666666
93111919999911919999999931119919991191130d6d66d000000dd6000d0000ddd000006ddddd6606dddd660006ddd677778eeee8777778eeee877777676666
1191999999999919999999993191199991991113ddd66ddd0000000d000d0000d0000000066666000066660000006660777778ee88777778eee8777776666666
0bbbbbbbbbbbbbbbbbbbbbb031919199999991930bbbbbb031191113000f40000000000000007000000000600100030077777888877777778887777777666666
b1333133311311311331313b3111999919919113b331333b31199113fffffff40000000000066000700007000030b30077777777777777777777777777766666
3515151515111551115115133111199999199113b313333331991913f44f4ff40000000000066000067076000b30010067777777777777777777777776666666
03333333333333333333333031191199999199133333133b31199113fffffff40000000076766d6600666000001b01b067777777776777777776777677666666
0030303003003030030303303111191199111113b313331b31191913f4f4f4f400000000066d66d0000d6d000030030067767777777777777777777777766666
00300030030000300300030031111119119111133119133331199113fffffff4000000000006d000006d0dd0b300103067776767776776767777767776666666
0000003000000030000003003311111191111133b3119113319191130004400000000000000dd00000d0000d1300103b06777777777777777777777676766666
00000000000000000000000003333333333333303119911b31191113000f4000000000000000d0000d0000000100301006666676677667767776777767666666
0bbbbbb09999999999999999999999990bbbbbb0319999130bbbbbbbbbbbbbbbbbbbbbb070000006007000000000000000667666667777667666676666666660
b313313b991991999199191191991919b333333b31199113b3333333313133313333313b07000760006600000000000000006666766666666676666667666660
35551513911919119991919119119199b313131b31911313b3313113131313111331331b06606d00006d07660000000000000066666666666666667666666600
03333330191111119999191111199919313133333111911331311393993391919319313300676600000676d00000000000000000766666666666666666660000
00030300111191199991111911119999b119313b31391113b1319913913999391931913b0006d600006dd6000000000000000000776600000000076660000000
00030000111111111919111111191919b11311133111111331111311191111111919111b006d0dd066d0dd000000000000000000776600000000077660000000
000300001111111199111111111199993311113b331111333311111111111111111111330dd000d000006d000000000000000007776600000000777660000000
000000003333333391911113311191990333333003333330033333333333333333333330d000000d00000d000000000000000007776600000000777660000000
000000b0000066850000006600000000000000000000667400668506161626920000000065350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
0000000000003677777777460000b00000b00000b000367777468500000000920000540065350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
76000000000000000000000000000000000000000000000000000000000000920616162665350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
44000000000000000000000000000000000000000000000000000064000000730000000065350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
4500007464b1a4749400840076000000000000000000640000000006161626000000000065350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
450000341424041404142414440000000000000000344400000000000000000000000000b2350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
45000036171717171717372545555555555555555535450000000000000700000000000000350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
45000000000000000065352515140424140414042405450000000000000000000000000000350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
46000000740000000065351717171717171717171717460000008281910000747600000000350000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
000006162600000000656600000000000000000000000000b0009247920000062600000000360000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
0000000000000000006566000000000000000000000000000000a181a20000000084000000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
0000000064000000a465660000000000000000000000000000000000000000000007000000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
000000000626000034774600008400000064000000009476a494b1a40000009400b1000000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000000006600000000560000005600000000340414241444000000341414440000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
5474b194840000006600000000665555556655555555352525252545000000352525450000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
77777777870000006600b06474352477771777777777171717171746000000361717450000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000000006600000616354500000000000000000000000000000000000000660000653500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
000000b200000000666484746435450000000000000000000000000000000000b000660000653500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000647600003677147777174500000000000000000000000000000000000000660000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
945400000616260000656600000066000000000000550084b1740055555555559454668500003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
161626000000000000656600b0006600000000006567777777141477777777777777468500003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000000000065665400006600000000000075000000354500000000000000000000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
0000007494b16400003446260000570000b000000000000000354500000000b00000000000003500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
0000061616162600006685000000000000000000000000000035450000000000005464b184543500000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000000000066850000000000000000000000000000354500000055555534141414140000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000064007466850064547400645400555555550000354500006567777717450000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000616161636777777777777777777777777870000354500000000000000660000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
00000000000000000000000000b60000000000000000000000354500845400000000660000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
54849476640000000000b00000b60000000084540064540064351524144485000000660000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000008181818181818181818181818181818100009200000000000000000000000000000000000000000000
14140414440000000000000000b60000656777777777777777171717174685000000660000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
25252525456484a47600745464b6005464740064006484b000b000b00000745484b1660000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
25252525152414240414240404041414041414042424242424242424242424141414450000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000009200000000000000000000000000009200009200000000000000000000000000000000000000000000
__gff__
0000000000000000000000100000000000001000000000000000000800000000000000000000000000000020000000000000000000000000000000000000000003030303030000000000000000000000020200020204040404000000000000000101010202030200000001420000000001020000030203030300000100000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
7271717171717171717171717171717171717171717171717171717171717171717171717171737171717171717171717171717171717173727171717171717171717171717171717171717171717171717171717171717300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000270000000000000000000000000027000000270000002700000027000000575756665857570000000000000000000000000053540000270046494847000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000290000000000000000000028181818181818181818181818181818181818181856665818181818181900000b00000000000053540000296061616161620000000000000b000b0000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000290000000000000000000029000029606162290000002960616229000000000056665800006061622900000000000000700053540000290000550000000000000000000000000048460000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
540000006529000000000000000000481a181818181818181818181818181818181818181818751818181818182a00000000001b00000053545800290000655800484647484a1b464746494660620000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5438181866181818183900000000006061616237000000376061623700000037606162000b00000060620000000000000000606161620053545800290000666161616161616161616161616162000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
540000006629000000000000001b000000005555555555555555555555555555553855181818181818185539555555555500000000000053540000290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000066290000434141414141414141414141414141414141414141414141414144000060616200004341414141414144000000000053540000290056660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000075290056537271717171717171717171717171717171717171717171717354001b00000055555352717171715254000000000053540000290056660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000290056535400000000000000270000002700002700002700002700005351414141414141415054000000005354000000000053540000290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400001b00290056535400000000000000290000002900002900002900002900006371717171717171717164000b00006364000000000053545800290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5461616162290056535400000000000055296062002900002900002900002900002700000000000000006658181818185666000000000053545800290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000290056535400000000000065580000002900002900002960616162002900000000000000006658281818195666000000000053540000290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
540000000b290000535438181818183966290000002970002900002900002900003700001b00000000006658290000295666000000000053540000290056660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5462000000290000535438181818183966290000002900002900002900002900767741777778000000006658290070295666000000000053540000290056660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400000000370000535438181818183966290b000037000037606237000037000056660000007400000075291a18182a2975000000000053540000290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5455555555550000535400000000000063783818271818182718181827181818395666000b0000740000001a181818182a00000000000053545800290000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
547777777778000053540000001b000000296061616161616161616161616161616175000000000076777777777777777777777777777771645800297000660000000000000000000000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
540000000000000053514040404040404437000037000000370000003700001b000000000000000000000000005757570000000000575757000000290000660000000000555555550000000000000000000000000000005300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400270000270000537271717171717171777777777777777777777777777777777777777744381818187018181818181818701818181818183900374341440000000000434242445555555555555555555555555555555300000000000000000000000000002900002900000000000000000000000000000000000000000000
5400290000290000535400575757575757575757000000000000000000000000000000005653404040404040404040404040404040404040404040415052541818181818531818514042404141424041414141414141415000000000000000000000000000002900002900000000000000000000000000000000000000000000
54002900006061615354580000000000000000000000000000000b0000480000000000005653000000000000000000000000000000000000000000000052540000000000530000000000000000000000000000000000002900000000000000000000000000002901002900000000000000000000000000000000000000000000
5400290000290000535458000000000000000000000000000000000000606162000000005653000000000000000000000000000000000000000000000052540000000000530000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
5400290000290000636400000000000000000000000000000000000000000000000000005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
5461616200290000000000000000000000000000000000000000000000000000007000005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
5400290000290000000000000000004a49454800001b49004600000000000000000046005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
540029000029001b000000000000007677777777777777777744000000000027006062005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
5400290060616162000000003818181818181818181818183966584500474629000000005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
5400370000370000000070000000000000000000000000000066586061616229000000005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
7177777777774458000000000000000000000000000000000066580000000029004600005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
0000000000006658000b00005555555555494a47464500000066580000000029606161625653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
0000000000006658000000437777777777777777777744000b66580048450029000000005653000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002900000000000000000000000000002900002900000000000000000000000000000000000000000000
__sfx__
010e00201f2211f2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f2252122121222212222122521222212251f2221e2221e2221e2221e2221e2251f2211f2251e2221e225
010e00001e2221e2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f2252122223222232222122224222242252122223222232222322223222232251e2221e2251722117225
490e00001722117222172221722517222172251522213222132221322213222132251522215225172221722518221182221822218225182221822517222152221522215222152221522517221172251522215225
490e000015222152221722217225172221722515222132221322213222132221322515222152251722217225182221a2221a222182221c2221c222182221a2221a2221a2221a2221a22518222182251322113225
470e000004245042451024504245042000424510245042450b2450b245172450b2450b2000b245172450b2450c2450c245182450c2450c2000c2451824500245092450924515245152450b2450b2451724517245
310e0020284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415284152f415374153c4153b415374152f4152b415
010e00002812228122281222b1212b1222a1222b1212b1222b1222b1222b1222b1222a1222a1222b1252b12226127261220010026122001002612528121281222812228122281222812200100001002312223122
010e00000207334715296350207334715020732963534715020733471529635020733471502073296350207302073347152963502073347153471529635347150207334715296350207334715347152963529635
010e00002812228122281222b1212b1222a1222d1212d1222d1222d1222d1222d1222f1222f1222d1222f1223012530122001003012200100301252f1212f1222f1222f1222f1222f12200100001002312223122
470e002010235132351723510235132351723510235132350b2350e235122350b2350e235122350b2350e2350c23510235132350c23510235132350c235102350e23512235152350e23512235152350e23512235
470e000010235132351723510235132351723510235132350b2350e235122350b2350e235122350b2350e2350c23510235132350c23510235132350c235102350f23512235152351723515235122350f2350b235
010e000028435284350000526435264352b4052b4352a4352343523435000052643526435000052a435264352443524435000052843528435000052b435284352643526435000052a4352a435000052d4352a435
010e00001e2221e2221f2221f2251f2221f2251e2221c2221c2221c2221c2221c2251e2221e2251f2221f22521221212222122221222232222322524222232222322223222232222322223222232251720017200
010e000015222152221722217225172221722515222132221322213222132221322515222152251722217225182211822218222182221a2221a2251c2221a2221a2221a2221a2221a2221a2221a2251320013200
150e00000432004320043200432004320043250432006320073200732007320073200732007320073250932000320003200032000320003200032000320003250232002320023200232502320023200232002325
150e00000432004320043200432004320043250432006320073200732007320073200732007320073250932000320003200032000320003200032000320003250232002320023200232503320033200332003325
310e00001c417234172b417234171c417234172b417234171a417234172b417234171a417234172b417234171c417244172b417244171c417244172b417244171e417264172b417264171e417264172b41726417
310e00001c417234172b417234171c417234172b417234171a417234172b417234171a417234172b417234171c417244172b417244171c417244172b417244171e417264172b417264171e417274172b41727417
030e00002322223222232252822128222282252b2222b2252a220282202622028221282222822228222282222422224222242252822128222282252b2222b2252f2212d2202b2202a2202d2212b2202a22026220
030e00002322223222232252822128222282252b2222b2252a220282202622028221282222822228222282222b22028220242202b2212b2222b22228222282252a22028220232202a2212a2222a2222722227225
150e00000532005320053200532005320053250532007320083200832008320083200832008320083250a32001320013200132001320013200132001320013250332003320033200332503320033200332003325
150e00000532005320053200532005320053250532007320083200832008320083200832008320083250a32001320013200132001320013200132001320013250332003320033200332504320043200432004325
310e00001d417244172c417244171d417244172c417244171b417244172c417244171b417244172c417244171d417254172c417254171d417254172c417254171f417274172e417274171f417274172e41727417
310e00001d417244172c417244171d417244172c417244171b417244172c417244171b417244172c417244171d417254172c417254171d417254172c417254171f417274172e417274171f4171c4172e4171c417
030e00002422224222242252922129222292252c2222c2252b220292202722029221292222922229222292222522225222252252922129222292252c2222c225302212e2202c2202b2202e2212c2202b22027220
030e00002422224222242252922129222292252c2222c2252b220292202722029221292222922229222292222c22029220252202c2212c2222c22229222292252b22027220242202b2212b2222b2222822228225
010e0000050733e01505675050733e015000731167505073050733e01505675050733e015000731167505073050733e01505675050733e015000731167505073056753e015050750567510015000730567505073
010e0000272002720027200272001f2001f2001820018200262002620026200262001f2001f20018200182002920029200272002620026200262002b2002b2002920029200272002620026200262002220022200
010e0000272222722227222272221f2221f2251820018200262222622226222262221f2221f225182001820027222262222422227221272222722224222242222622224222232222622126222262222322223222
010e000018332183320030018332183320030018332183321b3311b3351a3321a335173321733518332183351333214332113321333213332133321333213332113321133517332173351a3321a3351333213335
050e00001f4350040500405004051f4350040500405004051f4350040500405004051f4350040500405004051f4350040500405004051f4350040500405004051f4350040500405004051f4351f4052043220432
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
31102001107651e7001070010765237000e765107651e700107000070513765007051576513765127650e765107651e7001070010765237000e76510765007050070500705187650070515765177651376512765
01100000100431c6001c62510043000031c6251004300003000031020010200102001020010200170430000310043000031c62510043000031c62510043000030000310200102001020010200102001704300003
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200003b0503b0403b0303b0203b0103b0150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500002b1402f141341403414530100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
49010000263242a3212c3212e32130321323213432136325343003a3003f3002b3002e30031300323000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
4f0200001d37017370113600c36007350003500030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300
__music__
01 40424405
01 41430405
01 00420405
01 01430405
01 00020405
01 01030405
01 00020405
01 0c0d0405
01 05060704
01 05080704
01 05060704
01 05080704
01 09074b44
01 0a074b44
01 0e101244
01 0f111344
01 1416181a
01 1517191a
01 1416181a
01 1517191a
01 1b1d1e1a
02 1c1d1e1a
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
03 20214344
