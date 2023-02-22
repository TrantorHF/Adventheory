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
210 printd1$(p);d2$(p);d3$(p)
240 rem scrive l'azione
260 printa1$(p);a2$(p);a3$(p);a4$(p);a5$(p);a6$(p)
265 print"P:";p
270 rem gestione trappole e fine
271 if p=4+17 and og%(2)<>-1 then p=6+17:for t=1to3000:next:goto200
272 if p=6+17 then 22500
275 if p=7+17 and og%(1)<>-1 then p=9+17:for t=1to3000:next:goto200
276 if p=9+17 then 22500
277 if p=8+17 then 22500
300 rem chiede istr. al giocatore
310 printchr$(13):i$=""
315 print"";:inputi$
320 rem aggancia parser domande
321 if right$(i$,1)="?"or right$(i$,1)="!" then 3000
330 rem aggancia routine inventario
335 if i$="i" then 2700
355 if p=1+17 and p3$="arriva" and p5$="grotte" then 5300
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
!- -----------------------------------------------
600 if ve$="prendo" then 1010
610 if ve$="lascio" then 1100
620 if ve$="cerco" then 1200
630 if ve$="vado" then 1230
640 if ve$="raggiungo" then 1230
650 if ve$="taglio" then 1290
660 if ve$="abbatto" then 1290
670 if ve$="entro" then 1330
680 if ve$="lancio" then 1360
690 if ve$="invito" then 1400
700 if ve$="accetto" then 1500
710 if ve$="rifiuto" then 1600
720 if ve$="inseguo" then 1700
730 if ve$="soccorro" then 1800
740 if ve$="batto" then 1900
750 if ve$="torno" then 2000
!- -----------------------------------------------
990 print" non capisco cosa vuoi fare":goto 310
1000 rem routine verbi
!- -----------------------------------------------
1010 rem routine "prendo"
1020 for i=1 to 2
1030 if og$(i) = no$ then 1060
1040 next
1050 print"non puoi!":goto310
1060 if og%(i)=-1then print"Gia' fatto !":goto310
1065 if og%(i)<>pthen print"Non e' qui!":goto310
1070 print"Va bene":og%(i)=-1
1080 goto310
!- -----------------------------------------------
1100 rem routine "lascio"
1110 for i=1 to 2
1120 if og$(i)=no$ then 1140
1130 next
1135 print"Non puoi!":goto310
1140 if og%(i)<>-1 then print"Non hai questo oggetto con te":goto310
1150 print"va bene":og%(i)=p
1160 goto310
!- -----------------------------------------------
1200 rem routine "cerco"
1210 if p=(1+17) and no$="cascata" then p=2+17:goto200
1215 if p=(2+17) and no$="roccia" then p=3+17:goto200
1220 print"meglio...":goto310
!- -----------------------------------------------
1230 rem routine "vado" -"raggiungo"-
1232 if p=(1+17) and no$="cascata" then p=2+17:goto200
1234 if p=(2+17) and no$="roccia" then p=3+17:goto200
1236 if p=(3+17) and no$="radura" then p=4+17:goto200
1238 if p=(5+17) and no$="corridoio" then p=7+17:goto200
1240 if no$="ristorante" and p<>1 and p<>14 then print"non da qui":goto310
1242 if no$="ristorante" and p=1  then p=9:goto200
1244 if no$="ristorante" and p=14 then p=16:goto200
1246 if no$="Blue-Inn" and p<>10 then print "non da qui":goto310
1248 if no$="Blue-Inn" and p=10 then p=11:goto200
1250 if no$="casa" and p<>4andp<>15 and p<>13 and p<>14 and p<>16 then goto1270
1252 if no$="casa"andp=4 or p=15 then p=5:goto200
1254 if no$="casa"andp=13 or p=14 or p=16 then p=5:goto200
1256 if no$="studio" and p<>5 then print"non da questo luogo":goto310
1258 if no$="studio" and p=5 then p=6:goto200
1260 if no$="Shapiro" and p<>7 and p<>17 then print "non da qui":goto310
1262 if no$="Shapiro" and p=7 or p=17 then p=8:goto200
1264 if no$="Ross" and p<>7 then print"non da qui":goto310
1266 if no$="Ross" and p=7 then p=17:goto200
!- Piccolo link tra le avventure. Da notare che viene saltata tout-court una
!- fetta consistente dell'avventura originale del fumetto
1267 if no$="Hoopa-Valley" and p=8 then p=18:goto200
1270 print"meglio...":goto310
!- -----------------------------------------------
1290 rem routine "taglio" "abbatto"
1300 if p=(4+17) and no$="alberi" then p=5+17:goto200
1310 print"meglio...":goto310
1330 if p=(3+17) and no$="radura" then p=4+17:goto200
1340 if p=(5+17) and no$="corridoio" then p=7+17:goto200
1350 print"meglio...":goto310
!- -----------------------------------------------
1360 rem routine "lancio"
1370 if p=(7+17) and no$="corda" then p=8+17:goto200
1380 print"meglio...":goto310
!- -----------------------------------------------
1400 rem routine "invito"
1410 if p=1 and no$="Olmen" then p=2:goto200
1420 print"?":goto310
!- -----------------------------------------------
1500 rem routine "accetto"
1510 if p=9 and no$="telefonata" then p=10:goto200
1520 print"?":goto310
!- -----------------------------------------------
1600 rem routine "rifiuto"
1610 if p=9 and no$="telefonata" then 22500
1620 print"?":goto310
!- -----------------------------------------------
1700 rem routine "inseguo"
1710 if p=2 and no$="killer" then p=3:goto 200
1720 if p=11 and no$="killer" then p=12:goto200
1730 print"?":goto310
!- -----------------------------------------------
1800 rem routine "soccorro"
1810 if p=2 and no$="Olmen" then p=15:goto200
1820 if p=11 and no$="Olmen" then p=14:goto200
1830 print"?":goto310
!- -----------------------------------------------
1900 rem routine "batto"
1910 if p=6 and no$="Hoopa-Valley" then p=7:goto200
1920 print"?":goto310
!- -----------------------------------------------
2000 rem routine "torno"
2010 ifp<>3andp<>13andp<>14andno$="ristorante"thenprint"non da qui":goto310
2020 ifp=3  and no$="ristorante" then p=4:goto200
2030 if p=13 or p=14 and no$="ristorante" then p=16:goto200
2050 if p<>12 and no$="Blue-Inn"then print "non da qui":goto310
2060 if p=12 and no$="Blue-Inn" then p=13:goto200
2090 print"?":goto310
!- -----------------------------------------------
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
3505 if p<>(1+17) then print"Qui non e' previsto nessun dialogo.":goto310
3510 if p=(1+17) and p1$="Salve" or p2$="giorno" then 5000
3520 if p=(1+17) and p3$="arriva" and p5$="rifugio" then 5100
3530 if p=(1+17) and p2$="andare" and p4$="rifugio" then 5100
3535 if p=(1+17) and p2$="strada" and p5$="rifugio" then 5100
3540 if p=(1+17) and p3$="rifugio" then 5100
3550 if p=(1+17) and p3$="arriva" and p5$="grotte" then 5300
3560 if p=(1+17) and p3$="grotte" then 5300
3570 if p=(1+17) and p2$="andare" and p4$="grotte" then 5300
3575 if p=(1+17) and p2$="strada" and p5$="grotte" then 5300
3580 if p=(1+17) and p4$="grotte" then 5300
3590 if p=(1+17) and p1$="Arrivederci" then 5500
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
10110 print"{clear}{down*4}"
10112 print"          - L'uomo dei boschi -         "
10114 print"                          M.M.32 11/1984"
10116 print"S. Certi & F. Toldi"
10118 print"{down}"
10120 print"Questo programma e' stato scritto per{space*3}"
10130 print"illustrare il funzionamento in pratica{space*2}"
10140 print"delle routines di movimentazione degli{space*2}"
10150 print"oggetti e di dialogo. Non si tratta di{space*2}"
10160 print"un'avventura vera e propria, ma puo' es-"
10170 print"sere giocata come tale."
10180 for a=1 to 7000:next:return
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
20010 dimd1$(26),d2$(26),d3$(26),a1$(26),a2$(26),a3$(26),a4$(26),a5$(26),a6$(26)
20020 dimog%(2),og$(2)
20030 for p=1 to 26
20040 readd1$(p),d2$(p),d3$(p),a1$(p),a2$(p),a3$(p),a4$(p),a5$(p),a6$(p)
20050 next
20099 rem descrizioni azioni oggetti
!- 01------------------------------------------------------
20100 data"{clear}American Museum - New York              "
20105 data"Una vasta sala ricoperta da soffice     "
20110 data"moquette.Lunghe file di comode poltrone."
20115 data"Conclusa la  tua conferenza esci tra gli"
20120 data" applausi con Diana e Java.  Un ristoran"
20125 data"te vi attende. Un giovane: mi chiamo Ol "
20130 data"men. Ho vissuto con i Bigfoot, voglio pa"
20135 data"rlarle. Diana:o vieni al ristorante con "
20140 data"me subito o inviti Olmen!"
!- 02------------------------------------------------------
20145 data"{clear}Peter's Tavern - New York               "
20150 data" Uno dei ristoranti piu' antichi di N.Y."
20155 data"Piccoli tavoli in mogano, luci discrete."
20160 data"Vi sedete. Olmen racconta. Mi trovavo in"
20165 data"California. Vicino a Willow-Creek. Una n"
20170 data"otte due creature mi hanno rapito. Erano"
20175 data" alte e pelose. Mangiavano radici e bacc"
20180 data"he. Con loro ho visto un'altra creatura."
20185 data"...Due spari. Olmen si accascia a terra."
!- 03------------------------------------------------------
20190 data"{clear}Peter's Tavern - Esterno                "
20195 data"La strada e' deserta. Poche auto parcheg"
20200 data"giate.                                  "
20205 data"Un uomo corre velocemente verso una gros"
20210 data"sa auto nera. Una portiera si apre. L'uo"
20215 data"mo sale.Con un ruggito l'auto si allonta"
20220 data"na a gran velocita'.Inutile rincorrerla "
20225 data""
20230 data""
!- 04------------------------------------------------------
20235 data"{clear}Peter's Tavern - Atrio                  "
20240 data"Un ampio locale.Antichi mobili in radica"
20245 data", tappeti persiani, giganteschi ficus.  "
20250 data"Olmen giace a terra.Le sue ultime parole"
20255 data" -te le riferisce Diana- sono state <Hoo"
20260 data"pa...Hoopa..Va...>. Sentendole visualizz"
20265 data"i un'immagine: una serie di curve isomet"
20270 data"riche colorate in marrone su una carta. "
20275 data"L'immagine ti sfugge. Vuoi controllare. "
!- 05------------------------------------------------------
20280 data"{clear}Casa di Martine Mystere - soggiorno -   "
20285 data"Poltrone in pelle, tappeti indios. Si in"
20290 data"travede lo studio:molte librerie,un P.C."
20295 data"Diana e Java parlano tra loro dell'acca "
20300 data"duto. Tu non riesci a partecipare alla  "
20305 data"conversazione: le ultime parole di Olme "
20310 data"n ti risuonano nelle orecchie."
20315 data""
20320 data""
!- 06------------------------------------------------------
20325 data"{clear}Casa di Martine Mystere - studio -      "
20330 data"Un grande locale spartanamente arredato "
20335 data". Molte librerie,una scrivanie, un P.C. "
20340 data"Ti siedi alla scrivania. Accendi il P.C "
20345 data". Carichi l'Hellagh North American Prg. "
20350 data"Devi battere il nome del luogo da te rico"
20355 data"struito."
20360 data""
20365 data""
!- 07------------------------------------------------------
20370 data"{clear}Casa di Martine Mystere - studio -      "
20375 data""
20380 data""
20385 data"Il P.C. mostra la carta della Hoopa-Vall"
20390 data"ey,California. Tracci il percorso da N.Y"
20395 data". Entra Diana. Ti consiglia di chiedere "
20400 data"aiuto al tuo amico Shapiro,alla Columbia"
20405 data" University. Parlera' lui con Ross, il t"
20410 data"uo capo, alla Rank Foundation."
!- 08------------------------------------------------------
20415 data"{clear}Columbia University - Studio -R.Shapiro-"
20420 data"Un piccolo studio dalle pareti ricoperte"
20425 data" di libri. Una preziosa scrivania."
20430 data"Gli occhi del tuo amico Shapiro guizzano"
20435 data" al tuo racconto. Non ha un attimo di in"
20440 data"decisione: chiama Sara Hunt, la sua assi"
20445 data"stente. Te la presenta. Sara e' molto in"
20450 data"teressata a Yeti e Bigfoot.Sei sorpreso."
20455 data" ...Puoi proseguire per Hoopa-Valley...."
!- 09------------------------------------------------------
20460 data"{clear}Peter's Tavern - New York -             "
20465 data"Uno dei ristoranti piu' antichi di N.Y. "
20470 data"Piccoli tavoli in mogano, luci discrete."
20475 data"Prendete un tavolo d'angolo. Ordinate vi"
20480 data"ni ed antipasti. Sara porta piu' volte l"
20485 data"a conversazione su Olmen. Qualcosa l'ha "
20490 data"colpita.  Un cameriere si avvicina. Ti i"
20495 data"nforma che il signor Olmen, Ray Olmen ti"
20500 data" desidera al telefono."
!- 10------------------------------------------------------
20505 data"{clear}Peter's Tavern - Cabina telefonica -    "
20510 data"Una grande cabina telefonica rivestita i"
20515 data"n legni pregiati. Un antico specchio."
20520 data"Sono preoccupato - di dice Olmen -, sono"
20525 data"stato seguito dal Museo all'albergo da u"
20530 data"macchina nera. Ho bisogno di vederla sub"
20535 data"ito. Sto al Blue-Inn. All'incrocio tra  "
20540 data" la 34ma e la 80ma. Terzo piano, stanza "
20545 data"123."
!- 11------------------------------------------------------
20550 data"{clear}Blue-inn - stanza 123 -                 "
20555 data"Una piccola stanza, sciattamente arredat"
20560 data"a. Una finestra da'su un interno."
20565 data"Ti siedi. Olmen racconta. Mi trovavo in "
20570 data"California. Vicino a Willow-Creek. Una n"
20575 data"otte due creature mi hanno rapito. Erano"
20580 data" alte e pelose. Mangiavano radici e bacc"
20585 data"he. Con loro ho visto un'altra creatura."
20590 data"..Due spari. Olmen si accascia a terra. "
!- 12------------------------------------------------------
20595 data"{clear}Blue-inn - esterno -                    "
20600 data"Un incrocio spazioso. La strada e' deser"
20605 data"ta. il vento solleva polvere e cartacce."
20610 data"Un uomo si allontana di corsa dall'alber"
20615 data"go. La portiera di una grossa berlina ne"
20620 data"ra si apre. L'uomo sale. Con un rombo la"
20625 data"macchina si allontana velocemente. Non r"
20630 data"iesci a prendere il numero di targa. E'i"
20635 data"nutile l'inseguimento."
!- 13------------------------------------------------------
20640 data"{clear}Blue-Inn - Stanza 123 -                 "
20645 data""
20650 data""
20655 data"Olmen giace a terra morto. Un anziano ca"
20660 data"meriere ti riferisce le sue ultime parol"
20665 data"e:..Hoopa... Hoopa..Va..Va..            "
20670 data"Visualizzi un'immagine: delle curve isom"
20675 data"etriche colorate di marrone. Poi l'immag"
20680 data"ine ti sfugge. Devi controllare."
!- 14------------------------------------------------------
20685 data"{clear}Blue-Inn - Stanza 123 -                 "
20690 data""
20695 data""
20700 data"Olmen tenta di parlare. Lo senti pronunc"
20705 data"iare:...Hoopa...Hoopa..Va..Va. Un lungo "
20710 data"tremito. E' morto. Le parole di Olmen ti"
20715 data" ricordano qualcosa. Un'immagine: delle "
20720 data"curve isometriche colorate di marrone. L"
20725 data"'immagine ti sfugge. Sei stanco."
!- 15------------------------------------------------------
20730 data"{clear}Peter's Tavern - New York -             "
20735 data""
20740 data""
20745 data"Olmen tenta di parlare. Lo senti pronunc"
20750 data"iare:...Hoopa...Hoopa..Va..Va. Un lungo "
20755 data"tremito. E' morto. Le parole di Olmen ti"
20760 data" ricordano qualcosa. Un'immagine: delle "
20765 data"curve isometriche colorate di marrone. L"
20770 data"'immagine ti sfugge. Sei stanco."
!- 16------------------------------------------------------
20775 data"{clear}Peter's Tavern - New York -             "
20780 data""
20785 data""
20790 data"Il ristorante e' affollato nonostante l'or"
20795 data"a tarda. Cerchi il tuo tavolo: e' vuoto."
20800 data"Un cameriere ti informa che i tuoi amici"
20805 data"ti attendono a casa."
20810 data""
20815 data""
!- 17------------------------------------------------------
20820 data"{clear}Rank Foundation - Studio Dr.Ross. -     "
20825 data"Uno studio luminoso, modernamente arreda"
20830 data"to. Molti tappeti, una grande scrivania."
20835 data"Entri. Ross ti assale. Qualsiasi pazza c"
20840 data"osa tu abbia per la testa, scordatela! D"
20845 data"a due mesi il tuo libro e' fermo a pagin"
20850 data"a trenta. Torna al tuo W.P. e restaci! S"
20855 data"i alza. Ti sorride e, presi dei fogli da"
20860 data"lla scrivania, esce dalla stanza."
!- 18------------------------------------------------------
20865 data"{clear}Willow Creek - California -{space*13}"
20870 data"Un cadente drugstore di periferia.{space*6}"
20875 data""
20880 data"Dopo lo scontro con Wallace,vi siete di-"
20885 data"retti verso le montagne. Olmen, in una{space*2}"
20890 data"lettera,parlava di un rifugio e di alcu-"
20895 data"ne grotte.Avete bisogno di informazioni."
20900 data"Un vecchio, seduto su grossi rotoli di{space*2}"
20905 data"corda, vi osserva incuriosito.{space*10}"
!- 19------------------------------------------------------
20910 data"{clear}Hoopa Valley{space*2}- California -{space*12}"
20915 data"Un piccolo rifugio di montagna.{space*9}"
20920 data""
20925 data"Dalla cascata,seguendo una pista debol- "
20930 data"mente tracciata,siete giunti al rifugio "
20935 data"dove avete dormito. Il ritrovamento del-"
20940 data"l'ascia di Olmen e di un suo libro ti{space*3}"
20945 data"hanno rassicurato. Dalla porta del rifu-"
20950 data"gio ora guardi la foresta. Sei indeciso."
!- 20------------------------------------------------------
20955 data"{clear}Hoopa Valley - California -{space*13}"
20960 data"Uno stretto sentiero tra le alte sequoie.{space*2}"
20965 data""
20970 data"Da ore,seguito da Sara e Shapiro, stai{space*2}"
20975 data"camminando nella foresta. Piu' volte{space*4}"
20980 data"l'intrico del sottobosco ti ha obbliga- "
20985 data"to a lunghe deviazioni. Da un crinale{space*3}"
20990 data"intravedi in basso una larga radura.{space*4}"
20995 data ""
!- 21------------------------------------------------------
21000 data"{clear}Hoopa Valley{space*2}- California -{space*12}"
21005 data"Una ampia radura nella foresta.{space*9}"
21010 data""
21015 data"Una cena frugale. Poche stanche parole. "
21020 data"Ora,avvolto nel tuo sacco a pelo,attendi"
21025 data"il sonno. Nel silenzio ascolti i mille{space*2}"
21030 data"piccoli rumori della foresta... Ti alzi."
21035 data"Sull'accampamento una nuvola di fumo.{space*3}"
21040 data"Alte fiamme circondano la radura.{space*7}"
!- 22------------------------------------------------------
21045 data"{clear}Hoopa Valley - California -{space*13}"
21050 data"Una vasta rete di grotte.{space*15}"
21055 data""
21060 data"Molte ore sono trascorse da quando sei{space*2}"
21065 data"entrato nelle grotte. Le numerose torce "
21070 data"che hai recato con te si sono consumate."
21075 data"Dal locale in cui ti trovi parte uno{space*4}"
21080 data"stretto corridoio. In fondo un forte{space*4}"
21085 data"chiarore.{space*31}"
!- 23------------------------------------------------------
21090 data"{clear}Eureka - S.Patrick Hospital -{space*11}"
21095 data"Reparto Gravi Ustioni - Una camera.{space*5}"
21100 data""
21105 data"Non ricordi cosa esattamente sia accadu-"
21110 data"to. Sara e Shapiro ti hanno raccontato{space*2}"
21115 data"dell'arrivo del Servizio Costiero e del "
21120 data"Vostro salvataggio. Ora loro son tornati"
21125 data"a N.Y. in attesa della tua guarigione.{space*2}"
21130 data" Mesi di riflessione ti attendono...{space*4}"
!- 24------------------------------------------------------
21135 data"{clear}Hoopa Valley - California -{space*13}"
21140 data"Uno stretto e buio corridoio.{space*11}"
21145 data""
21150 data"Procedi con cautela. Un lieve rumore. Ti"
21155 data"fermi.Nulla! Avanzi. Uno scricchiolio..."
21160 data"e...cadi nel vuoto. Un tonfo e una fitta"
21165 data"alla spalla. Ti rialzi. Le pareti del{space*3}"
21170 data"pozzo sono liscie. In alto, molto in al-"
21175 data"to delle radici. Come arrivarci?{space*8}"
!- 25------------------------------------------------------
21180 data"{clear}Hoopa Valley - California -{space*13}"
21185 data"Una grande caverna illuminata dall'alto."
21190 data""
21195 data"Con l'aiuto della corda sei uscito dal{space*2}"
21200 data"pozzo. Hai proseguito sino ad una vasta "
21205 data"caverna. A partire da terra e sino al{space*3}"
21210 data"soffitto si alzano ampi gradini. Su{space*5}"
21215 data"ognuno di essi si affollano i Bigfoot.{space*2}"
21220 data"{space*3}(Fine. Almeno per questa volta ){space*5}"
!- 26------------------------------------------------------
21225 data"{clear}Eureka - California -{space*19}"
21230 data"S.Patrick H. Reparto Terapie Intensive{space*2}"
21235 data""
21240 data"Ridotto pelle e ossa dal lungo digiuno,"
21245 data"sei stato salvato dopo molti giorni di{space*2}"
21250 data"ricerche da un gruppo di scouts. Cosi'{space*2}"
21255 data"almeno ti hanno detto Sara e Shapiro.Lo-"
21260 data"ro sono rientrati a N.Y. in attesa della"
21265 data"tua guarigione. Aspetteranno a lungo!{space*3}"
21300 return
22000 for i=1to2
22110 read og%(i),og$(i)
22120 next
22300 data 18,corda,19,ascia
22400 return
22500 print"Fine.":for t=1 to 3000:next
22510 end