---
layout: post
title:  "Prime Video in HD su Linux?<br>
Scrcpy e Android ci vengono in soccorso" 
categories: tutorial
tags: android gnu/linux scrcpy adb bash script PrimeVideo
---
<div class="contenuto-centrato">
<img src="/assets/tutorial/tutorial2/top.png" alt="Microsoft e GNU/Linux" class="img-centrata" oncontextmenu="return false;" /> </div>

Per chi come me usa come sistema operativo principale una qualsiasi distribuzione GNU/Linux e possiede un abbonamento a Prime video, si sarà accorto che i contenuti sono bloccati nella qualità SD (standard Definition) e che non si trova una applicazione per poter usufruire dei contenuti in offline.

Spulciando per il web apparentemente non è possibile arginare questo blocco in alcun modo, c’è chi sostiene che cambiando l’user agent al proprio Web Browser si riesca a usufruire dei contenuti in HD, ma questa procedura non funziona. Altri dicono che l’unica soluzione sia di virtualizzare Windows o il suo Browser nativo, ma come sappiamo per virtualizzare un OS serve energia e potenza.

Diversamente ormai quasi tutti posseggono un dispositivo Android ed è proprio qui che ci viene in soccorso scrcpy. Questo strumento multipiattaforma da riga di comando ci consente di visualizzare e di controllare il nostro dispositivo Android tramite cavo USB o su TCP /IP. Non richiede permessi di root e occorre semplicemente abilitare la modalità debg usb.

Certo i più maliziosi diranno “ma non basta una Chromecast o una Smart TV? ” Certo ma non posseggo né l’una né l’altra, così il mio Dell inspiron 3482 con un piccolo intel pentium Silver e 4GB di ram con Ubuntu 20.04.1 LTS, e il caro tablet Toshiba Encore 2 WT10-A con a bordo il vetusto intel Atom Z3735F e 2GB di ram con a bordo Fedora 33, si ritrovano a svolgere questo arduo compito.

<h1> Introduzione e installazione di Scrcpy</h1>

Come già detto questo comodo tool scritto sotto licenza “Apache-2.0 License“ ci consente di proiettare e di controllare il nostro device Android. Tra i principali punti di forza non possiamo non citare le prestazioni (30 ~ 60 fps), la bassa latenza (35 ~ 70 ms), la leggerezza e cosa fondamentale non serve installare nessuna applicazione sul nostro dispositivo mobile.

<strong>Nota bene.</strong> L’audio verrà riprodotto nel dispositivo e non viene inoltrato da scrcpy.

Requisiti:

<li>Android 5 o superiori, per abilitare la Desktop mode Android 10 o superiore;</li>
<li> Abilitare la modalità debug usb sul dispositivo Android;</li>    
<li> Per connettersi con il WI-FI necessita di android tools Adb.</li>

Consiglio di scaricare la versione 1.17 in poi di scrcpy in quando gestisce anche il numero di display secondari o virtuali, di cui parleremo più avanti.

Per scaricare scrcpy su Ubuntu o su una sua derivata consiglio il pacchetto snap;

`snap install scrcpy`