---
layout: post
title:  "Lcfcpy.sh<br>
        un lanciatore per scrcpy e di comandi adb" 
categories: tutorial
tags: android gnu/linux scrcpy adb bash script PrimeVideo lcfcpy.sh
sitemap: false
---
<div class="contenuto-centrato">
<img src="/assets/tutorial/tutorial4/top.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" /> </div>

Nel tutorial precedente vi ho parlato di scrcpy tool open source e multipiattaforma che permette di visualizzare e controllare i dispositivi Android, collegati tramite USB o via wireless.
Personalmente adopero scrcpy per usufruire del mio abbonamento a prime video, soprattutto per avere i contenuti a disposizione offline.

Sfortunatamente il mio moto G7 plus ha un nocht a goccia e pur avendo ricevuto Android 10 non è possibile in alcune applicazioni adoperare tutto il display, Amazon Prime Video è una di queste. <br>
Risultato, fruizione decentrata sia sul piccolo schermo che sul grande schermo.

<img src="/assets/tutorial/tutorial4/Schermata da 2021-02-22 17-38-00.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" />

Per aggirare tale problema utilizzo la modalità Desktop disponibile da Android 10 in su, pienamente compatibile con scrcpy. In questo modo è possibile adoperare il telefono come se si stesse usando in parte un Samsung Dex.

Ci sono due vie per abilitare la Desktop mode, la prima tramite il menù **Impostazioni** –> **Sistema** –> **Avanzate** –> **Opzioni sviluppo** –> **Abilita Desktop mode** e creare un display virtuale, consiglio anche di attivare le **finestre mobili** disponibile già nei dispositivi con Android 7, infine per rendere le modifiche effettive riavviare il dispositivo.

Il secondo procedimento è adoperando i comandi adb dal nostro terminale cosi come segue:

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

<h1> Lcfcpy.sh </h1>
Per ottimizzare i tempi non volendo ogni qualvolta digitare tutti i comandi necessari ho realizzato due script:<br>
- Il primo consente di fare quanto detto prima.<br>
- Il secondo consente di dividere la schermata del terminale in due parti o più quando si adopera scrcpy, in questo modo è possibile impartire contemporaneamente dei comandi adb preimpostati in precedenza, ad esempio cambiare la tastiera o abilitare la rete dati senza toccare il proprio telefono.

<img src="/assets/tutorial/tutorial4/Schermata da 2021-02-22 17-35-53.png" alt="Scrcpy and Lcfcpy.sh" class="img-centrata" oncontextmenu="return false;" />

Potete scaricare i miei due script direttamente dal mio [github] o per chi preferisce adoperare il terminale `git clone https://github.com/andrealucifero/lcfcpy.sh.git`, per funzioni base e per chi non ha molta esperienza scaricate quello denominato **lcfcy.sh** richiede solo **scrcpy** e **adb tools** installato.

Per chi volesse provare la versione più “complessa” scaricate la cartella **Lcfcpy_tmux**, all’interno troverete due script che devono stare necessariamente insieme perché il primo **“lcfcpy.sh”** serve a richiamare il secondo **“variables_script.sh”** che contiene i comandi **adb** e di **scrcpy** con annesse le relative variabili. <br>
Per funzionare correttamente è necessario installare oltre a **scrcpy** e **adb tools** anche **tmux** (terminal multiplexr disponibile nei maggiori repo [Tmux github]).

Leggere il file README.md contenuto all'interno.

Prima di eseguire lo script ricordarsi di modificare le variabili come: dimensioni del display e ip dispositivo per un uso wirless. (cambiare il valore dopo il segno = senza lasciare spazi). Le variabili si trovano nei corrispettivi file “lcfcpy.sh” o in “variables_script.sh” a secondo della versione scaricata, è possibile adoperare qualsiasi editor di testo.

Per eseguirlo basta andare all’interno della directory ed eseguire `./lcfcpy.sh` se da errore verificare che lo script possieda i permessi per essere eseguito altrimenti digitare  `chmod +xr lcfcpy.sh` o `chmod +xr lcfcpy.sh variables_script.sh`.

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