10 gosub 1000: rem iniz.var$ descr.luoghi
20 p=1:rem fissa il luogo iniziale
30 rem dato il n.del luogo stampa la descrizione
40 if p=1 then print a1$:n=0:e=0:s=2:o=0
50 if p=2 then print a2$:n=1:e=3:s=0:o=0
60 if p=3 then print a3$:n=4:e=0:s=0:o=2
70 if p=4 then print a4$:n=0:e=0:s=3:o=0
100 rem elenco movimenti possibili
110 print"puoi andare a :";
120 if n>0 then print "-nord-";
130 if e>0 then print "-est-";
140 if s>0 then print "-sud-";
150 if o>0 then print "-ovest-";
200 printchr$(13):rem istruzioni del giocatore
210 input "cosa fai";i$:if i$="" then goto 210
220 rem routine di movimento
250 if i$="n" and n>0 then p=n:goto 30
260 if i$="e" and e>0 then p=e:goto 30
270 if i$="s" and s>0 then p=s:goto 30
280 if i$="o" and o>0 then p=o:goto 30
300 rem quando il mov.non e' possibile
310 print"non puoi andare in questa direzione":goto 100
1000 a1$="sei sul sentiero"
1010 a2$="sei sul ponte"
1020 a3$="sei in uno spiazzo"
1030 a4$="sei nel bosco"
1050 return
1100 printchr$(13):i$="":print"{clear}"
1110 print"cosa fai";:input i$
1150 fori=1 to len(i$)