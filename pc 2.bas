100 rem     dimostrativo mav.
200 rem     luoghi noti
300 rem     museo
400 rem     peters-tavern
500 rem     ristorante
600 rem     verbi noti:
700 rem     vado
800 rem     torno
1100 printchr$(13):i$="":print"{clear}"
1110 print"cosa fai";:input i$
1150 fori=1 to len(i$)
1160 if mid$(i$,i,1)=" " then 1200
1170 next
1180 print"Usa istruzioni di due parole":goto1110
1200 for sp=1 to len(i$)
1210 if mid$(i$,sp,1)=" " then 1230
1220 next
1230 ve$=left$(i$,sp-1)
1240 no$=right$(i$, (len(i$)-sp))
5000 rem verbi mov
5010 if ve$="vado" or ve$="torno" then 7000
5020 print "non conosco per ora altri verbi":goto 1110
7000 if no$="Peters-tavern" or no$="ristorante" then 10200
7100 if no$="museo" then 10100
7110 print"non conosco per ora altri luoghi":goto1110
10100 print"New York American Museum  of Natural History  "
10110 print"Una vasta sala ricoperta da soffice moquette":goto 1110
10200 print"Peters-Tavern"
10210 print"Uno dei ristoranti piu' antichi di N.Y."
10220 print"Piccoli tavoli, luci discrete, grandi vetrate sulla strada":goto1110
10230 print"non conosco per ora altri luoghi":goto 1110

