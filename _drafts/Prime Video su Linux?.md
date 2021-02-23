---
layout: post
title:  "Prime Video su Linux?<br>
Scrcpy e Android ci vengono in soccorso" 
categories: tutorial
tags: android gnu/linux scrcpy adb bash script PrimeVideo
sitemap: false
---
<div class="contenuto-centrato">
<img src="/assets/tutorial/tutorial3/top.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" /> </div>

Per chi come me adopera come sistema operativo principale una qualsiasi distribuzione GNU/Linux e possiede un abbonamento a Prime video, si sarà accorto che i contenuti sono bloccati nella qualità SD (standard Definition) e che non esiste una client per poter usufruire dei contenuti Offline.

Spulciando per il web non è possibile raggirare questo blocco in alcun modo, c’è chi sostiene che bisogna cambiare l’**user agent** al proprio Web Browser, altri dicono che l’unica soluzione sia di virtualizzare Windows o il suo Browser nativo, ma come sappiamo per virtualizzare un OS serve energia e potenza.

Diversamente ormai quasi tutti possediamo un dispositivo Android ed è proprio qui che ci viene in soccorso **scrcpy**. Questo strumento multi piattaforma da riga di comando ci consente di visualizzare e di controllare il nostro dispositivo Android tramite cavo USB o su TCP /IP. Non richiede permessi di root e occorre semplicemente abilitare la modalità debg usb.

Certo i più maliziosi diranno “ma non basta una Chromecast o una Smart TV? ” Certo ma non posseggo né l’una né l’altra, così il mio Dell inspiron 3482 con un piccolo intel pentium Silver e 4GB di ram con Ubuntu 20.04.2 LTS, e il caro tablet Toshiba Encore 2 WT10-A con il vetusto intel Atom Z3735F e 2GB di ram con a bordo Fedora 33, si ritrovano a svolgere questo arduo compito.

<h1> Introduzione e installazione di Scrcpy</h1>

Come già detto questo comodo tool scritto sotto licenza “Apache-2.0 License“ ci consente di proiettare e di controllare il nostro device Android. Tra i principali punti di forza non possiamo non citare le prestazioni (30 ~ 60 fps), la bassa latenza (35 ~ 70 ms), la leggerezza e cosa fondamentale non serve installare nessuna applicazione sul nostro dispositivo mobile.

**Nota bene.** L’audio verrà riprodotto nel dispositivo e non viene inoltrato da scrcpy.

Requisiti:

<li> Android 5 o superiori, per abilitare la Desktop mode Android 10 o superiore;</li>
<li> Modalità debug usb attiva sul dispositivo Android;</li>
<li> Per connettersi con il WI-FI necessita di <strong>android tools Adb</strong> installato sul pc. </li>

<br>Consiglio di scaricare la versione 1.17 in poi di scrcpy in quando gestisce anche il numero di display secondari o virtuali, di cui parleremo più avanti.

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

Il Debug USB è una funzione che è possibili attivare solo dopo aver abilitato la modalità sviluppatori. È possibile attivare tale modalità toccando 7 volte il numero build andare su **Impostazioni** --> **Informazioni sul telefono** --> **numero build**.

Adesso per il debug USB **Impostazioni** --> **Sistema** --> **Avanzate** --> **Opzioni sviluppo** --> **Abilitare Debug USB**

Questo è il percorso che va fatto sulla stragrande maggioranza degli smartphone Android, se non riuscite ad attivare la modalità sviluppatori controllare il proprio manuale.

<h1> Avviare Scrcpy </h1>

Come vi dicevo **Scrcpy** è un tool che funziona da riga di comando non vi resta altro che collegare il vostro smartphone tramite cavo usb aprire un terminale e lanciare `scrcpy` e il gioco è fatto.

Ovviamente è possibile configurare diverse opzioni come: la risoluzione, la bit rate, limitare i fotogrammi, registrare lo schermo, usare la tastiera per i comandi rapidi e molto altro. Per maggiori dettagli sui comandi e sulle funzionalità è possibile consultare direttamente la pagina [GitHub scrcpy] o lanciare da terminale `scrcpy --help`.

Se si volesse collegare lo smartphone tramite un collegamento Wi-Fi, dopo aver installato Android tools Adb ed essersi connessi tramite USB eseguire:
`adb tcpip 5555`

Verificare che il computer e lo smartphone siano connessi nella stessa rete, scollegare il cavo USB ed eseguire;
`adb connect DEVICE_IP:5555` (inserire l’indirizzo del proprio smartphone)

Di norma scrcpy ha come bit rate di default 8Mbps, lo sviluppatore ci suggerisce che per un uso in Wi-Fi conviene scenderla a 2Mbps, per eseguire scrcpy riducendo la bit rate eseguire:
`scrcpy –b 2M` per dispositivi di fascia bassa potrebbe essere utile ridurre anche la risoluzione ad esempio  `scrcpy –b 2M –m 800`

<h1> Lcfcpy.sh </h1>

Personalmente adopero scrcpy per usufruire del mio abbonamento a prime video, soprattutto per avere i contenuti a disposizione offline per via della mia connettività scarsa.

Sfortunatamente il mio moto G7 plus ha un nocht a goccia e pur avendo ricevuto Android 10 non è possibile in alcune applicazioni adoperare tutto il display, Amazon Prime Video è una di queste. Risultato, fruizione decentrata sia sul piccolo schermo che sul grande schermo.

<img src="/assets/tutorial/tutorial3/Schermata da 2021-02-22 17-38-00.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" />

Per aggirare tale problema utilizzo la modalità Desktop disponibile da Android 10 in su, pienamente compatibile con scrcpy. In questo modo è possibile adoperare il telefono come se si stesse usando in parte un Samsung Dex.

Ci sono due vie per abilitare la Desktop mode, la prima tramite il menù **Impostazioni** –> **Sistema** –> **Avanzate** –> **Opzioni sviluppo** –> **Abilita Desktop mode** e creare un display virtuale, consiglio anche di attivare le **finestre mobili** disponibile già nei dispositivi con Android 7, infine per rendere le modifiche effettive riavviare il dispositivo.

Il secondo procedimento è adoperando i comandi adb dal nostro terminale Linux cosi come segue:

```
#crea un display secondario;
adb shell settings put global overlay_display_devices 1920x1080/210 

#abilita le finestre mobili;
adb shell  settings put global enable_freeform_support 1 

#abilita la Desktop mode;
adb shell  settings put global force_desktop_mode_on_external_displays 1 

#riavvia il dispositivo;
adb reboot  
```

Il risultato sarà come da immagine da copertina.

Per ottimizzare i tempi non volendo ogni qualvolta digitare tutti i comandi necessari ho realizzato due script:<br>
- Il primo consente di fare quanto detto prima.<br>
- Il secondo consente di dividere la schermata del terminale in due parti o più quando si adopera scrcpy, in questo modo è possibile impartire contemporaneamente dei comandi adb preimpostati in precedenza, ad esempio cambiare la tastiera o abilitare la rete dati senza toccare il proprio telefono.

<img src="/assets/tutorial/tutorial3/Schermata da 2021-02-22 17-35-53.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" />

Potete scaricare i miei due script direttamente dal mio [github], per chi volesse solo le funzioni base scaricate quello denominato **lcfcy.sh** richiede solo **scrcpy** e **adb tools** installato.

Per chi vuole provare la versione più “complessa” scaricate la cartella **Lcfcpy_tmux**, all’interno troverete due script che devono stare necessariamente insieme perché il primo **“lcfcpy.sh”** serve a richiamare il secondo **“variables_script.sh”** che contiene i comandi **adb** e di **scrcpy** con annesse le relative variabili. Per funzionare correttamente è necessario installare oltre a **scrcpy** e **adb tools** anche **tmux** (terminal multiplexr disponibile nei maggiori repo [Tmux github]).

Una volta scaricato lo script è possibile modificare le variabile con qualsiasi editor di testo. 

Per eseguirlo basta andare all’interno della directory ed eseguire `./lcfcpy.sh` se da errore verificare che lo script possiede i permessi per essere eseguito altrimenti digitare  `chmod +xr lcfcpy.sh` o `chmod +xr lcfcpy.sh variables_script.sh`.

Per maggiori dettagli per quanto riguarda **lcfcpy.sh** vi invito a consultare direttamente il mio repository su [GitHub - andrealucifero/lcfcpy.sh].

#### Riferimenti:

- [Github scrcpy]

- [adb tools]

- [Tmux github]

- [GitHub - andrealucifero/lcfcpy.sh]

[GitHub scrcpy]: https://github.com/Genymobile/scrcpy
[github]: https://github.com/andrealucifero/lcfcpy.sh
[GitHub - andrealucifero/lcfcpy.sh]: https://github.com/andrealucifero/lcfcpy.sh
[adb tools]: https://developer.android.com/studio/command-line/adb
[Tmux github]: https://github.com/tmux/tmux/wiki