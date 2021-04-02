---
layout: post
title:  "Prime Video su Linux?<br>
        Scrcpy e Android ci vengono in soccorso" 
categories: tutorial
tags: android gnu/linux scrcpy adb bash script PrimeVideo
sitemap: false
---

<img src="/assets/tutorial/tutorial3/top.jpg" alt="Scrcpy tools" class="img-centrata" oncontextmenu="return false;" />

Per chi come me adopera come sistema operativo principale una qualsiasi distribuzione GNU/Linux e possiede un abbonamento a Prime video, si sarà accorto che i contenuti sono bloccati nella qualità SD (standard Definition) e che non esiste una client per poter usufruire dei contenuti Offline.

Spulciando per il web non è possibile raggirare questo blocco in alcun modo, c’è chi sostiene che bisogna cambiare l’**user agent** al proprio Web Browser, altri dicono che l’unica soluzione sia di virtualizzare Windows o il suo Browser nativo, ma come sappiamo per virtualizzare un OS serve energia e potenza.

Diversamente ormai quasi tutti possediamo un dispositivo Android ed è proprio qui che ci viene in soccorso **scrcpy**. Questo strumento multi piattaforma da riga di comando ci consente di visualizzare e di controllare il nostro dispositivo Android tramite cavo USB o su TCP /IP. Non richiede permessi di root e occorre semplicemente abilitare la modalità debg usb.

Certo i più maliziosi diranno “ma non basta una Chromecast o una Smart TV? ” Certo ma non posseggo né l’una né l’altra, così il mio Dell inspiron 3482 con un piccolo intel pentium Silver e 4GB di ram con Ubuntu 20.04.2 LTS, e il caro tablet Toshiba Encore 2 WT10-A con il vetusto intel Atom Z3735F e 2GB di ram con a bordo Fedora 33, si ritrovano a svolgere questo arduo compito.

<h1> Introduzione e installazione di Scrcpy</h1>

Come già detto questo comodo tool scritto sotto licenza “Apache-2.0 License“ ci consente di proiettare e di controllare il nostro device Android. <br>
Tra i principali punti di forza non possiamo non citare le prestazioni (30 ~ 60 fps), la bassa latenza (35 ~ 70 ms), la leggerezza e cosa fondamentale non serve installare nessuna applicazione sul nostro dispositivo mobile.

**Nota bene.** L’audio verrà riprodotto nel dispositivo e non viene inoltrato da scrcpy.

Requisiti:

<li> Android 5 o superiori, per abilitare la Desktop mode Android 10 o superiore;</li>
<li> Modalità debug usb attiva sul dispositivo Android;</li>
<li> Per connettersi con il WI-FI necessita di <strong>android tools Adb</strong> installato sul pc. </li>

<br>Consiglio di scaricare dalla versione 1.17 in poi dacché scrcpy gestisce anche il numero di display secondari o virtuali, di cui parleremo più avanti.

Per scaricare scrcpy su **Ubuntu** o su una sua derivata consiglio il pacchetto snap;
- `snap install scrcpy`

Per android adb tools;
- ` apt install adb `

Per scaricare scrcpy su **Fedora** bisogna attivare un pacchetto CORP;
- `dnf copr enable zeno/scrcpy`

Per android adb tools su **Fedora**;
- `dnf install android-tools`  

<h1> Abilitare la modalità sviluppatori e il Debug USB </h1>

Dopo aver installato scrcpy andiamo ad abilitare il debug USB sul nostro device Android.

Il Debug USB è una funzione che è possibile attivare solo dopo aver abilitato la modalità sviluppatori. <br>
Per attivare tale modalità bisogna toccando 7 volte il numero build, andare su **Impostazioni** --> **Informazioni sul telefono** --> **numero build**.

Adesso passiamo al debug USB: **Impostazioni** --> **Sistema** --> **Avanzate** --> **Opzioni sviluppo** --> **Abilitare Debug USB**

Questo è il percorso che va fatto sulla stragrande maggioranza degli smartphone Android, se non riuscite ad attivare la modalità sviluppatori controllare il proprio manuale.

<h1> Avviare Scrcpy </h1>
<img src="/assets/tutorial/tutorial3/Schermata da 2021-03-27 15-11-40.png" alt="Scrcpy" class="img-centrata" oncontextmenu="return false;" />


Come vi dicevo **Scrcpy** è un tool che funziona da riga di comando non vi resta altro che collegare il vostro smartphone tramite cavo usb aprire un terminale e lanciare `scrcpy` e il gioco è fatto.

Ovviamente è possibile configurare diverse opzioni come: la risoluzione, la bit rate, limitare i fotogrammi, registrare lo schermo, usare la tastiera per i comandi rapidi e molto altro. Per maggiori dettagli sui comandi e sulle funzionalità è possibile consultare direttamente la pagina [GitHub scrcpy] o lanciare da terminale `scrcpy --help`.

Se si volesse collegare lo smartphone tramite un collegamento Wi-Fi, dopo aver installato Android tools Adb ed essersi connessi tramite USB eseguire:
`adb tcpip 5555`

Verificare che il computer e lo smartphone siano connessi nella stessa rete, scollegare il cavo USB ed eseguire;
`adb connect DEVICE_IP:5555` (inserire l’indirizzo del proprio smartphone)

Di norma scrcpy ha come bit rate di default 8Mbps, lo sviluppatore ci suggerisce che per un uso in Wi-Fi conviene scalarla a 2Mbps, per eseguire scrcpy riducendo la bit rate eseguire:
`scrcpy –b 2M` per dispositivi di fascia bassa potrebbe essere utile ridurre anche la risoluzione ad esempio  `scrcpy –b 2M –m 800`

Nel prossimo tutorial, vi mostrerò come abilitare la modalità desktop sugli smartphone Android 10 o superiore, e vi parlerò di un comodo script realizzato da me per eseguire scrcpy e comandi adb preimpostati.

#### Riferimenti:

- [Github scrcpy]

- [adb tools]

[GitHub scrcpy]: https://github.com/Genymobile/scrcpy
[adb tools]: https://developer.android.com/studio/command-line/adb
