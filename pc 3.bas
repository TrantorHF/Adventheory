10 rem avventura list.2
15 rem scrive in minuscolo
16 poke53272,23
20 rem colore schermo e cornici
30 gosub 10000
40 rem titoli
50 gosub 10100
60 rem istruzioni
70 gosub 10300
80 rem inizial.variabili
90 gosub 20000
100 rem pone la scena iniziale
110 p=1
200 rem scrive la descrizione
210 print d1$(p);d2$(p);d3$(p)
250 rem scrive - se il caso - l'azione
260 if fl%(p)<>2 then print a1$(p);a2$(p);a3$(p);a4$(p);a5$(p);a6$(p)
300 rem chiede istruzioni al giocatore
310 printchr$(13):i$=""
320 print"Cosa fai";:inputi$
400 rem elimina istruzioni di una parola
410 for i=1 to len(i$)
420 if mid$(i$,i,1)=" " then 450
430 next
440 print"usa istruzioni di due parole":goto310
450 rem separa verbi e nomi
460 for sp=1 to len(i$)
470 if mid$(i$,sp,1)=" " then 490
480 next
490 ve$=left$(i$,sp-1)
500 no$=right$(i$,(len(i$)-sp))
600 rem vocabolario verbi
610 if ve$="vado" then 1010
620 if ve$="invito" then 2010
630 if ve$="accetto" then 2110
640 if ve$="rifiuto" then 2210
650 if ve$="inseguo" then 2310
660 if ve$="soccorro" then 2410
670 if ve$="batto" then 2510
680 if ve$="torno" then 2610
990 print"non capisco cosa vuoi fare":goto310
1000 rem routine verbi
1010 rem routine <vado>
1020 if no$="ristorante" and p<>1 and p<>14 then print"non da qui":goto310
1030 if no$="ristorante" and p=1  then p=9:goto200
1040 if no$="ristorante" and p=14 then p=16:goto200
1050 if no$="Blue-Inn" and p<>10 then print "non da qui":goto310
1060 if no$="Blue-Inn" and p=10 then p=11:goto200
1070 if no$="casa" and p<>4andp<>15 and p<>13 and p<>14 and p<>16 then goto1190
1080 if no$="casa"andp=4 or p=15 then p=5:goto200
1100 if no$="casa"andp=13 or p=14 or p=16 then p=5:goto200
1110 if no$="studio" and p<>5 then print"non da questo luogo":goto310
1120 if no$="studio" and p=5 then p=6:goto200
1130 if no$="Shapiro" and p<>7 and p<>17 then print "non da qui":goto310
1140 if no$="Shapiro" and p=7 or p=17 then p=8:goto200
1150 if no$="Ross" and p<>7 then print"non da qui":goto310
1160 if no$="Ross" and p=7 then p=17:goto200
1190 print"non puoi andarci":goto310
2000 rem verbi <invito>
2010 if p=1 and no$="Olmen" then p=2:goto200
2020 print"?":goto310
2100 rem verbi <accetto>
2110 if p=9 and no$="telefonata" then p=10:goto200
2120 print"?":goto310
2200 rem verbi <rifiuto>
2210 if p=9 and no$="telefonata" then 60000
2220 print"?":goto310
2300 rem verbi <inseguo>
2310 if p=2 and no$="killer" then p=3:goto 200
2320 if p=11 and no$="killer" then p=12:goto200
2330 print"?":goto310
2400 rem verbi <soccorro>
2410 if p=2 and no$="Olmen" then p=15:goto200
2420 if p=11 and no$="Olmen" then p=14:goto200
2430 print"?":goto310
2500 rem verbi <batto>
2510 if p=6 and no$="Hoopa-Valley" then p=7:goto200
2520 print"?":goto310
2600 rem verbi <torno>
2610 ifp<>3andp<>13andp<>14andno$="ristorante"thenprint"non da qui":goto310
2620 ifp=3  and no$="ristorante" then p=4:goto200
2630 if p=13 or p=14 and no$="ristorante" then p=16:goto200
2650 if p<>12 and no$="Blue-Inn"then print "non da qui":goto310
2660 if p=12 and no$="Blue-Inn" then p=13:goto200
2690 print"?":goto310
10000 rem routine schermo - cornice
10010 print"{clear}colore schermo e cornice":for a=1 to 500:next:return
10100 rem routine titoli
10110 print"{clear}titoli":for b=1 to 500:next:return
10300 rem routine istruzioni
10310 print"{clear}istruzioni":forc=1 to 500:next:return
20000 rem routine iniz. variabili ( descrizioni - azioni flag )
20005 dim d1$(17),d2$(17),d3$(17),fl%(17),a1$(17),a2$(17),a3$(17)
20006 dim a4$(17),a5$(17),a6$(17)
20010 for p=1 to 17
20020 read d1$(p),d2$(p),d3$(p),fl%(p),a1$(p),a2$(p),a3$(p),a4$(p),a5$(p),a6$(p)
20030 next
20099 rem descrizioni -flag- azioni
20100 data"{clear}American Museum - New York              "
20110 data"Una vasta sala ricoperta da soffice     "
20120 data"moquette.Lunghe file di comode poltrone."
20130 data1
20140 data"Conclusa la  tua conferenza esci tra gli"
20150 data" applausi con Diana e Java.  Un ristoran"
20160 data"te vi attende. Un giovane: mi chiamo Ol "
20170 data"men. Ho vissuto con i Bigfoot, voglio pa"
20180 data"rlarle. Diana:o vieni al ristorante con "
20190 data"me subito o inviti Olmen!"
20300 data"{clear}Peter's Tavern - New York               "
20310 data" Uno dei ristoranti piu' antichi di N.Y."
20320 data"Piccoli tavoli in mogano, luci discrete."
20330 data 1
20340 data"Vi sedete. Olmen racconta. Mi trovavo in"
20350 data"California. Vicino a Willow-Creek. Una n"
20360 data"otte due creature mi hanno rapito. Erano"
20370 data" alte e pelose. Mangiavano radici e bacc"
20380 data"he. Con loro ho visto un'altra creatura."
20390 data"...Due spari. Olmen si accascia a terra."
20400 data"{clear}Peter's Tavern - Esterno                "
20410 data"La strada e' deserta. Poche auto parcheg"
20420 data"giate.                                  "
20430 data1
20440 data"Un uomo corre velocemente verso una gros"
20450 data"sa auto nera. Una portiera si apre. L'uo"
20460 data"mo sale.Con un ruggito l'auto si allonta"
20470 data"na a gran velocita'.Inutile rincorrerla "
20480 data""
20490 data""
20500 data"{clear}Peter's Tavern - Atrio                  "
20510 data"Un ampio locale.Antichi mobili in radica"
20520 data", tappeti persiani, giganteschi ficus.  "
20530 data1
20540 data"Olmen giace a terra.Le sue ultime parole"
20550 data" -te le riferisce Diana- sono state <Hoo"
20560 data"pa...Hoopa..Va...>. Sentendole visualizz"
20570 data"i un'immagine: una serie di curve isomet"
20580 data"riche colorate in marrone su una carta. "
20590 data"L'immagine ti sfugge. Vuoi controllare. "
20600 data"{clear}Casa di Martine Mystere - soggiorno -   "
20610 data"Poltrone in pelle, tappeti indios. Si in"
20620 data"travede lo studio:molte librerie,un P.C."
20630 data1
20640 data"Diana e Java parlano tra loro dell'acca "
20650 data"duto. Tu non riesci a partecipare alla  "
20660 data"conversazione: le ultime parole di Olme "
20670 data"n ti risuonano nelle orecchie."
20680 data""
20690 data""
20700 data"{clear}Casa di Martine Mystere - studio -      "
20710 data"Un grande locale spartanamente arredato "
20720 data". Molte librerie,una scrivanie, un P.C. "
20730 data1
20740 data"Ti siedi alla scrivania. Accendi il P.C "
20750 data". Carichi l'Hellagh North American Prg. "
20760 data"Devi battere il nome del luogo da te rico"
20770 data"struito."
20780 data""
20790 data""
20800 data"{clear}Casa di Martine Mystere - studio -      "
20810 data""
20820 data""
20830 data1
20840 data"Il P.C. mostra la carta della Hoopa-Vall"
20850 data"ey,California. Tracci il percorso da N.Y"
20860 data". Entra Diana. Ti consiglia di chiedere "
20870 data"aiuto al tuo amico Shapiro,alla Columbia"
20880 data" University. Parlera' lui con Ross, il t"
20890 data"uo capo, alla Rank Foundation."
20900 data"{clear}Columbia University - Studio -R.Shapiro-"
20910 data"Un piccolo studio dalle pareti ricoperte"
20920 data" di libri. Una preziosa scrivania."
20930 data1
20940 data"Gli occhi del tuo amico Shapiro guizzano"
20950 data" al tuo racconto. Non ha un attimo di in"
20960 data"decisione: chiama Sara Hunt, la sua assi"
20970 data"stente. Te la presenta. Sara e' molto in"
20980 data"teressata a Yeti e Bigfoot.Sei sorpreso."
20990 data" .....Fine (per questa puntata)........."
30000 data"{clear}Peter's Tavern - New York -             "
30010 data"Uno dei ristoranti piu' antichi di N.Y. "
30020 data"Piccoli tavoli in mogano, luci discrete."
30030 data1
30040 data"Prendete un tavolo d'angolo. Ordinate vi"
30050 data"ni ed antipasti. Sara porta piu' volte l"
30060 data"a conversazione su Olmen. Qualcosa l'ha "
30070 data"colpita.  Un cameriere si avvicina. Ti i"
30080 data"nforma che il signor Olmen, Ray Olmen ti"
30090 data" desidera al telefono."
30100 data"{clear}Peter's Tavern - Cabina telefonica -    "
30110 data"Una grande cabina telefonica rivestita i"
30120 data"n legni pregiati. Un antico specchio."
30130 data1
30140 data"Sono preoccupato - di dice Olmen -, sono"
30150 data"stato seguito dal Museo all'albergo da u"
30160 data"macchina nera. Ho bisogno di vederla sub"
30170 data"ito. Sto al Blue-Inn. All'incrocio tra  "
30180 data" la 34ma e la 80ma. Terzo piano, stanza "
30190 data"123."
30200 data"{clear}Blue-inn - stanza 123 -                 "
30210 data"Una piccola stanza, sciattamente arredat"
30220 data"a. Una finestra da'su un interno."
30230 data1
30240 data"Ti siedi. Olmen racconta. Mi trovavo in "
30250 data"California. Vicino a Willow-Creek. Una n"
30260 data"otte due creature mi hanno rapito. Erano"
30270 data" alte e pelose. Mangiavano radici e bacc"
30280 data"he. Con loro ho visto un'altra creatura."
30290 data"..Due spari. Olmen si accascia a terra. "
30300 data"{clear}Blue-inn - esterno -                    "
30310 data"Un incrocio spazioso. La strada e' deser"
30320 data"ta. il vento solleva polvere e cartacce."
30330 data1
30340 data"Un uomo si allontana di corsa dall'alber"
30350 data"go. La portiera di una grossa berlina ne"
30360 data"ra si apre. L'uomo sale. Con un rombo la"
30370 data"macchina si allontana velocemente. Non r"
30380 data"iesci a prendere il numero di targa. E'i"
30390 data"nutile l'inseguimento."
30400 data"{clear}Blue-Inn - Stanza 123 -                 "
30410 data""
30420 data""
30430 data1
30440 data"Olmen giace a terra morto. Un anziano ca"
30450 data"meriere ti riferisce le sue ultime parol"
30460 data"e:..Hoopa... Hoopa..Va..Va..            "
30470 data"Visualizzi un'immagine: delle curve isom"
30480 data"etriche colorate di marrone. Poi l'immag"
30490 data"ine ti sfugge. Devi controllare."
30500 data"{clear}Blue-Inn - Stanza 123 -                 "
30510 data""
30520 data""
30530 data1
30540 data"Olmen tenta di parlare. Lo senti pronunc"
30550 data"iare:...Hoopa...Hoopa..Va..Va. Un lungo "
30560 data"tremito. E' morto. Le parole di Olmen ti"
30570 data" ricordano qualcosa. Un'immagine: delle "
30580 data"curve isometriche colorate di marrone. L"
30590 data"'immagine ti sfugge. Sei stanco."
30600 data"{clear}Peter's Tavern - New York -             "
30610 data""
30620 data""
30630 data1
30640 data"Olmen tenta di parlare. Lo senti pronunc"
30650 data"iare:...Hoopa...Hoopa..Va..Va. Un lungo "
30660 data"tremito. E' morto. Le parole di Olmen ti"
30670 data" ricordano qualcosa. Un'immagine: delle "
30680 data"curve isometriche colorate di marrone. L"
30690 data"'immagine ti sfugge. Sei stanco."
30700 data"{clear}Peter's Tavern - New York -             "
30710 data""
30720 data""
30730 data1
30740 data"Il ristorante e' affollato nonostante l'or"
30750 data"a tarda. Cerchi il tuo tavolo: e' vuoto."
30760 data"Un cameriere ti informa che i tuoi amici"
30770 data"ti attendono a casa."
30780 data""
30790 data""
30800 data"{clear}Rank Foundation - Studio Dr.Ross. -     "
30810 data"Uno studio luminoso, modernamente arreda"
30820 data"to. Molti tappeti, una grande scrivania."
30830 data1
30840 data"Entri. Ross ti assale. Qualsiasi pazza c"
30850 data"osa tu abbia per la testa, scordatela! D"
30860 data"a due mesi il tuo libro e' fermo a pagin"
30870 data"a trenta. Torna al tuo W.P. e restaci! S"
30880 data"i alza. Ti sorride e, presi dei fogli da"
30890 data"lla scrivania, esce dalla stanza."
40000 return
60000 rem routine di fine
60010 print"Fine":end