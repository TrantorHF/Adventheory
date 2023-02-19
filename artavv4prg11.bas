1 rem artavv4prg11-fine
2 rem dimostrativo: prendere, lasciare,
3 rem inventario, trappole, dialoghi(
4 rem domande, asserzioni)
15 rem scrive in minuscolo
16 poke 53272,23
20 rem colore schermo e cornice
30 gosub 10000
40 rem titoli
50 gosub 10100
60 rem istruzioni
70 gosub 10300
80 rem iniz. variabili (descrizioni
81 rem azioni - oggetti -)
90 gosub 20000
91 rem inizial. oggetti
95 gosub 22000
100 rem scena iniziale
110 p=1
200 rem scrive la descrizione
210 printd1$(p);d2$(p)
240 rem scrive l'azione
260 printa1$(p);a2$(p);a3$(p);a4$(p);a5$(p);a6$(p)
270 rem gestione trappole e fine
271 if p=4 and og%(2)<>-1 then p=6:for t=1to3000:next:goto200
272 if p=6 then 22500
275 if p=7 and og%(1)<>-1 then p=9:for t=1to3000:next:goto200
276 if p=9 then 22500
277 if p=8 then 22500
300 rem chiede istr. al giocatore
310 printchr$(13):i$=""
315 print"";:inputi$
320 rem aggancia parser domande
321 if right$(i$,1)="?"or right$(i$,1)="!" then 3000
330 rem aggancia routine inventario
335 if i$="i" then 2700
355 if p=1 and p3$="arriva" and p5$="grotte" then 5300
400 rem elimina istruzioni di una parola
410 fori=1tolen(i$)
420 if mid$(i$,i,1)=" " then 450
430 next
440 print"usa istruzioni di due parole":goto310
450 rem separa verbi e nomi
460 for sp=1 to len(i$)
470 if mid$(i$,sp,1)=" " then 490
480 next
490 ve$=left$(i$,sp-1)
500 no$=right$(i$,(len(i$)-sp))
599 rem vocabolario verbi
600 if ve$="prendo" then 1010
610 if ve$="lascio" then 1100
620 if ve$="cerco" then 1200
630 if ve$="vado" then 1230
640 if ve$="raggiungo" then 1230
650 if ve$="taglio" then 1290
660 if ve$="abbatto" then 1290
670 if ve$="entro" then 1330
680 if ve$="lancio" then 1360
990 print" non capisco cosa vuoi fare":goto 310
1000 rem routine verbi
1010 rem routine "prendo"
1020 for i=1 to 2
1030 if og$(i) = no$ then 1060
1040 next
1050 print"non puoi!":goto310
1060 if og%(i)=-1then print"Gia' fatto !":goto310
1065 if og%(i)<>pthen print"Non e' qui!":goto310
1070 print"Va bene":og%(i)=-1
1080 goto310
1100 rem routine "lascio"
1110 for i=1 to 2
1120 if og$(i)=no$ then 1140
1130 next
1135 print"Non puoi!":goto310
1140 if og%(i)<>-1 then print"Non hai questo oggetto con te":goto310
1150 print"va bene":og%(i)=p
1160 goto310
1200 rem routine "cerco"
1210 if p=1 and no$="cascata" then p=2:goto200
1215 if p=2 and no$="roccia" then p=3:goto200
1220 print"meglio...":goto310
1230 rem routine "vado" -"raggiungo"-
1240 if p=1 and no$="cascata" then p=2:goto200
1250 if p=2 and no$="roccia" then p=3:goto200
1260 if p=3 and no$="radura" then p=4:goto200
1270 if p=5 and no$="corridoio" then p=7:goto200
1280 print"meglio...":goto310
1290 rem routine "taglio" "abbatto"
1300 if p=4 and no$="alberi" then p=5:goto200
1310 print"meglio...":goto310
1330 if p=3 and no$="radura" then p=4:goto200
1340 if p=5 and no$="corridoio" then p=7:goto200
1350 print"meglio...".goto310
1360 rem routine "lancio"
1370 if p=7 and no$="corda" then p=8:goto200
1380 print"meglio...":goto310
2700 rem routine inventario
2710 print"L'inventario degli oggetti che ha con{space*3}te e':": in=0
2720 fori=1to2
2730 if og%(i)=-1 then print og$(i):in=in+1
2740 next
2750 if in=0 then print "nulla"
2760 goto310
3000 rem parser dialoghi
3005 i$=left$(i$,len(i$)-1)
3010 p1$="":p2$="":p3$="":p4$="":p5$=""
3020 for sp=1 to len(i$)
3030 if mid$(i$,sp,1)=" " then 3050
3040 next
3050 p1$=left$(i$,sp-1)
3055 if i$=p1$ then 3220
3060 i1$=right$(i$,(len(i$)-sp))
3070 for sp=1 to len(i1$)
3080 if mid$(i1$,sp,1)=" " then 3100
3090 next
3100 p2$=left$(i1$,sp-1)
3105 ifi1$=p2$ then 3220
3110 i2$=right$(i1$,(len(i1$)-sp))
3120 for sp=1 to len(i2$)
3130 if mid$(i2$,sp,1)=" "then3150
3140 next
3150 p3$=left$(i2$,sp-1)
3155 if i2$=p3$ then 3220
3160 i3$=right$(i2$,(len(i2$)-sp))
3170 for sp=1 to len(i3$)
3180 if mid$(i3$,sp,1)=" " then 3200
3190 next
3200 p4$=left$(i3$,sp-1)
3205 ifi3$=p4$ then 3220
3210 p5$=right$(i3$,(len(i3$)-sp))
3220 rem parser dialoghi
3500 rem analisi domande 5 parole
3505 if p<>1 then print"Qui non e' previsto nessun dialogo.":goto310
3510 if p=1 and p1$="Salve" or p2$="giorno" then 5000
3520 if p=1 and p3$="arriva" and p5$="rifugio" then 5100
3530 if p=1 and p2$="andare" and p4$="rifugio" then 5100
3535 if p=1 and p2$="strada" and p5$="rifugio" then 5100
3540 if p=1 and p3$="rifugio" then 5100
3550 if p=1 and p3$="arriva" and p5$="grotte" then 5300
3560 if p=1 and p3$="grotte" then 5300
3570 if p=1 and p2$="andare" and p4$="grotte" then 5300
3575 if p=1 and p2$="strada" and p5$="grotte" then 5300
3580 if p=1 and p4$="grotte" then 5300
3590 if p=1 and p1$="Arrivederci" then 5500
3600 print"Come?":goto310
5000 print"Salve, stranieri! Posso aiutarvi? Dite{space*2}";
5010 print"pure!...":goto310
5100 print"Ah! il rifugio. Andate alla cascata. Li'";
5110 print"troverete una pista. Seguitela e in{space*2}po-";
5120 print"che ore ci arriverete!":goto310
5300 print"Le grotte? Ah! Si! Si parte dal rifugio.";
5310 print"Cercate la grande roccia. Vicino inizia ";
5315 print"la pista. Seguitela e raggiungerete una ";
5320 print"grande radura. Dormite li'. Dalla radura";
5330 print" si vedono le grotte.":goto310
5500 print"Addio,stranieri!":goto310
10000 rem routine schermo e cornice
10010 rem col.cornice:cc col.schermo:cs
10020 cc=53280:cs=53281
10030 pokecc,9:pokecs,9
10040 return
10100 rem routine titoli
10110 print"{clear}{down*5}{space*14}Dimostrativo{space*14}"
10120 print"Questo programma e' stato scritto per{space*3}"
10130 print"illustrare il funzionamento in pratica{space*2}"
10140 print"delle routines di movimentazione degli{space*2}"
10150 print"oggetti e di dialogo. Non si tratta di{space*2}"
10160 print"un'avventura vera e propria, ma puo' es-"
10170 print"sere giocata come tale."
10180 for a=1 to 5000:next:return
10300 rem routine istruzioni
10305 print:print
10310 print"{clear}":printtab(10)" Istruzioni"
10320 print"Scopo di questo gioco e' raggiungere una"
10330 print"colonia Bigfoot, lo yeti americano,     "
10340 print"sulle montagne della California. Il ruo-"
10350 print"lo del giocatore e' quello di Martin{space*4}"
10360 print"Mystere, noto antropologo. Per procedere"
10370 print"nella sua avventura il giocatore ha bi- "
10380 print"sogno di informazioni e di pezzi. Per{space*3}"
10390 print"parlare - ove cio' e' possibile - usera'"
10400 print"frasi composte con cinque parole al mas-"
10410 print"simo. Fara' seguire le frasi di dialogo "
10420 print"da un punto di domanda o esclamativo.{space*3}"
10421 fore=1to20000:next:print"{clear}"
10430 print"Per gli inputs di spostamento personale "
10440 print"o di movimentazione degli oggetti usera'"
10445 print"frasi con le usuali due parole: Verbo + "
10446 print"Nome."
10450 foru=1 to10000:next:return
20000 rem iniz. variabili (descrizioni
20001 rem - azioni - oggetti )
20010 dimd1$(9),d2$(9),a1$(9),a2$(9),a3$(9),a4$(9),a5$(9),a6$(9)
20020 dimog%(2),og$(2)
20030 for p=1 to 9
20040 readd1$(p),d2$(p),a1$(p),a2$(p),a3$(p),a4$(p),a5$(p),a6$(p)
20050 next
20099 rem descrizioni azioni oggetti
20100 data"{clear}Willow Creek - California -{space*13}"
20110 data"Un cadente drugstore di periferia.{space*6}"
20120 data"Dopo lo scontro con Wallace,vi siete di-"
20130 data"retti verso le montagne. Olmen, in una{space*2}"
20140 data"lettera,parlava di un rifugio e di alcu-"
20150 data"ne grotte.Avete bisogno di informazioni."
20160 data"Un vecchio, seduto su grossi rotoli di{space*2}"
20170 data"corda, vi osserva incuriosito.{space*10}"
20200 data"{clear}Hoopa Valley{space*2}- California -{space*12}"
20210 data"Un piccolo rifugio di montagna.{space*9}"
20220 data"Dalla cascata,seguendo una pista debol- "
20230 data"mente tracciata,siete giunti al rifugio "
20240 data"dove avete dormito. Il ritrovamento del-"
20250 data"l'ascia di Olmen e di un suo libro ti{space*3}"
20260 data"hanno rassicurato. Dalla porta del rifu-"
20270 data"gio ora guardi la foresta. Sei indeciso."
20300 data"{clear}Hoopa Valley - California -{space*13}"
20310 data"Uno stretto sentiero tra le alte sequoie.{space*2}"
20320 data"Da ore,seguito da Sara e Shapiro, stai{space*2}"
20330 data"camminando nella foresta. Piu' volte{space*4}"
20340 data"l'intrico del sottobosco ti ha obbliga- "
20350 data"to a lunghe deviazioni. Da un crinale{space*3}"
20360 data"intravedi in basso una larga radura.{space*4}"
20370 data ""
20400 data"{clear}Hoopa Valley{space*2}- California -{space*12}"
20410 data"Una ampia radura nella foresta.{space*9}"
20420 data"Una cena frugale. Poche stanche parole. "
20430 data"Ora,avvolto nel tuo sacco a pelo,attendi"
20440 data"il sonno. Nel silenzio ascolti i mille{space*2}"
20450 data"piccoli rumori della foresta... Ti alzi."
20460 data"Sull'accampamento una nuvola di fumo.{space*3}"
20470 data"Alte fiamme circondano la radura.{space*7}"
20500 data"{clear}Hoopa Valley - California -{space*13}"
20510 data"Una vasta rete di grotte.{space*15}"
20520 data"Molte ore sono trascorse da quando sei{space*2}"
20530 data"entrato nelle grotte. Le numerose torce "
20540 data"che hai recato con te si sono consumate."
20550 data"Dal locale in cui ti trovi parte uno{space*4}"
20560 data"stretto corridoio. In fondo un forte{space*4}"
20570 data"chiarore.{space*31}"
20600 data"{clear}Eureka - S.Patrick Hospital -{space*11}"
20610 data"Reparto Gravi Ustioni - Una camera.{space*5}"
20620 data"Non ricordi cosa esattamente sia accadu-"
20630 data"to. Sara e Shapiro ti hanno raccontato{space*2}"
20640 data"dell'arrivo del Servizio Costiero e del "
20650 data"Vostro salvataggio. Ora loro son tornati"
20660 data"a N.Y. in attesa della tua guarigione.{space*2}"
20670 data" Mesi di riflessione ti attendono...{space*4}"
20700 data"{clear}Hoopa Valley - California -{space*13}"
20710 data"Uno stretto e buio corridoio.{space*11}"
20720 data"Procedi con cautela. Un lieve rumore. Ti"
20730 data"fermi.Nulla! Avanzi. Uno scricchiolio..."
20740 data"e...cadi nel vuoto. Un tonfo e una fitta"
20750 data"alla spalla. Ti rialzi. Le pareti del{space*3}"
20760 data"pozzo sono liscie. In alto, molto in al-"
20770 data"to delle radici. Come arrivarci?{space*8}"
20800 data"{clear}Hoopa Valley - California -{space*13}"
20810 data"Una grande caverna illuminata dall'alto."
20820 data"Con l'aiuto della corda sei uscito dal{space*2}"
20830 data"pozzo. Hai proseguito sino ad una vasta "
20840 data"caverna. A partire da terra e sino al{space*3}"
20850 data"soffitto si alzano ampi gradini. Su{space*5}"
20860 data"ognuno di essi si affollano i Bigfoot.{space*2}"
20870 data"{space*3}(Fine. Almeno per questa volta ){space*5}"
20900 data"{clear}Eureka - California -{space*19}"
20910 data"S.Patrick H. Reparto Terapie Intensive{space*2}"
20920 data"Ridotto pelle e ossa dal lungo digiuno,"
20930 data"sei stato salvato dopo molti giorni di{space*2}"
20940 data"ricerche da un gruppo di scouts. Cosi'{space*2}"
20950 data"almeno ti hanno detto Sara e Shapiro.Lo-"
20960 data"ro sono rientrati a N.Y. in attesa della"
20970 data"tua guarigione. Aspetteranno a lungo!{space*3}"
21000 return
22000 for i=1to2
22110 read og%(i),og$(i)
22120 next
22300 data 1,corda,2,ascia
22400 return
22500 for t=1 to 3000:next
22510 end
