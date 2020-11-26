---
layout: post
title:  "Usare e personalizzare Windows Terminal"
date:   2020-11-28 10:30:00 +0200
categories: tutorial
---
<div class="contenuto-centrato">
<img src="/assets/tutorial/tutorial2/top.png" alt="Microsoft e GNU/Linux" class="img-centrata" oncontextmenu="return false;" /> </div>

Benvenuti in questo secondo episodio.

Ci siamo lasciati a distanza di mesi con la procedura su [come usare GNU/Linux in Windows], oggi come promesso vi parlerò di un applicazione sviluppata da Microsoft Corporation e resa disponibile sotto licenza "MIT License" al seguente repository di GitHub: [github Terminal].
<br>È possibile scaricarlo gratuitamente dal Microsoft Store: [Windows Terminal].

<h1>Cos'è Windows Terminal?</h1>

Windows Terminal è un app pratica, potente e multifunzionale che permette di usare strumenti utili da riga di comando.

Terminal supporta in maniera nativa il classico prompt dei comandi o cmd, il fresco PowerShell, il caro WSL, Azure Cloud shell e tutti quei programmi che sono forniti di un'interfaccia a riga di comando.
<br>Tra le principali funzionalità possiamo trovare la gestione di più schede e più riquadri in simultanea, un supporto completo per i caratteri Unicode, un accelerazione GPU per il motore di rendering del testo e la piena personalizzazione di temi, del colore e delle scelte rapide. 

<img src="/assets/tutorial/tutorial2/terminal_schermata.png" alt="schermata Windows Terminal" class="img-post"/>

<h1>Come personalizzare Windows Terminal</h1>

Dopo averlo installato dal Microsoft Store al primo avvio come profilo predefinito apparirà Windows PowerShell, inoltre se all'interno del PC vi sono installate distribuzioni WSL verranno creati automaticamente i profili associati.

Per personalizzare Windows Terminal occorre selezionare dal menù a discesa "impostazioni", ebbene si una volta aver cliccato su impostazioni non si aprirà un bel programmino ad interfaccia grafica, ma verrà aperto il file `setting.json` molto probabilmente usando come programma predefinito blocco note:
<img src="/assets/tutorial/tutorial2/setting_blocco_note.png" alt="setting.json con blocco note" class="img-post"/>

Non spaventatevi a prima vista vi potrà sembrare molto complicato capirci qualcosa, ma è molto più semplice di quel che state pensando.

Anche se è possibile modificare il file `.json` con qualsiasi editor di testo come per l'appunto blocco note, consiglio l'utilizzo di un editor più avanzato che supporti il liguagio come [Notepad++] o [Visual Studio Code], se adoperate il WSL vi troverete bene con quest'ultimo editor.
<br>Per modificare l'editor di testo predefinito basta andare nelle [impostazioni di Windows], o in alternativa basta creare un file con estensione `.json` e dirgli di aprire sempre con l'editor di testo desiderato.

In questa guida non vi parlerò di tutti i tag su cui è possibile intervenire, anche perché è disponibile una guida realizzata direttamente da Microsoft e tradotta in italiano, ma cercheremo piuttosto di capire e di comprendere la struttura base del file `setting.json`.

Il file `setting.json` è strutturato in quattro parti; 
<ul>Impostazioni Globali,</ul>
<ul>impostazioni del profilo,</ul>
<ul>combinazioni di colori,</ul>
<ul>Azioni.</ul>

Nelle impostazioni globali possiamo definire ad esempio con quale profilo avviare Windows Terminal `"defaultProfile": {id profilo},`
<img src="/assets/tutorial/tutorial2/profilo_default.png" alt="setting.json profile default" class="img-post"/>
<br>l'id corrispettivo lo potete trovare all'interno del tag `"guid": {id profilo},`
<img src="/assets/tutorial/tutorial2/profilo_id.png" alt="setting.json profile Id" class="img-post"/>

come è possibile notare il resto dei tag sono abbastanza intuitivi, `"tabTitle":` e `"icon":` servono per cambiare il corrispettivo nome nella barra del titolo e la corrispettiva immagine.
<img src="/assets/tutorial/tutorial2/tab_title.png" alt="setting.json tab_title" class="img-post"/>
I tag `"useAcrylic":` e `"acrylicOpacity"` per attivare e regolare l'effetto acrilico di Windows. 

Diversamente il tag `"colorScheme": "Material",` serve a richiamare la combinazione colore che si trova in `"schemes": [`.
<br>Questo è il tema personalizzato che ho usato per Debian WSL chiamato "Material".
<img src="/assets/tutorial/tutorial2/colore_profilo.png" alt="setting.json colore profilo" class="img-post"/>


Di seguito vi lascio la mia configurazione del file `setting.json` in cui è possibile notare che oltre a PowerShell, cmd, e le due distribuzioni Wsl, ho disabilitato `Azure Cloud Shell` e creato un profilo che mi permette di collegarmi tramite protocollo ssh al mio dispositivo Android.

{% highlight json-doc %}
 {
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "defaultProfile": "{58ad8b0c-3ef8-5f4d-bc6f-13e4c00f2530}",
    // per vedere altri settaggi per le impostazioni globali, visit https://aka.ms/terminal-global-settings
    // If enabled, selections are automatically copied to your clipboard.
    "copyOnSelect": false,
    // If enabled, formatted data is also copied to your clipboard
    "copyFormatting": false,
    // Per altre opzioni sui profiles, visit https://aka.ms/terminal-profile-settings
    "profiles": {
        "defaults": {
            // cursore predefinito in tutti i profili
            "cursorShape": "vintage"
        },
        "list": [
            {
                // Preferenze di wsl Debian.
                "guid": "{58ad8b0c-3ef8-5f4d-bc6f-13e4c00f2530}",
                "suppressApplicationTitle": true,
                "tabTitle": "Debian",
                "useAcrylic": true,
                "acrylicOpacity": 0.7,
                "colorScheme": "Material",
                "icon": "C:/Users/andre/Pictures/debian.png",
                "name": "Debian",
                "source": "Windows.Terminal.Wsl",
                "hidden": false
            },
            {
                // Preferenze di powershell.exe.
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "useAcrylic": true,
                "acrylicOpacity": 0.8,
                "colorScheme": "Material Palenight",
                "name": "Windows PowerShell",
                "commandline": "powershell.exe",
                "hidden": false
            },
            {
                // Make changes here to the cmd.exe profile.
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "useAcrylic" : true,
                "acrylicOpacity" : 0.9,
                "colorScheme" : "Campbell",
                "cursorColor" : "#FFFFFD",
                "fontFace" : "Cascadia Code PL",     
                "commandline": "cmd.exe",
                "hidden": false
            },
            {
                // Connessione remota con SSH
                "name": "SSH Termux 🏍",
                "suppressApplicationTitle": true,
                "tabTitle": "SSH Termux 📱",
                "commandline": "ssh nome@indirizzoip -p numeroporta",
                "icon": "C:/Users/andre/Pictures/termux.png",
                "colorScheme": "TermuxColor",
                "fontFace": "Cascadia Code",
                "acrylicOpacity": 0.8,
                "useAcrylic": true
            },
            {
                //Preferenze di Azure Cloud Shell
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": true,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure"
            },
            {
                //Preferenze di Ubuntu-20.04
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "suppressApplicationTitle": true,
                "name": "Ubuntu-20.04",
                "tabTitle": "Ubuntu-20.04",
                "hidden": false,                
                "source": "Windows.Terminal.Wsl"
            }
        ]
    },
    
    //Campo dedicato ai temi di colore personalizzati, visit https://aka.ms/terminal-color-schemes
    
    "schemes": [
        {
            "name": "Material",
            "background": "#10181d",
            "foreground": "#daffff",
            "black": "#000000",
            "blue": "#82aaff",
            "brightBlack": "#546e7a",
            "brightBlue": "#82aaff",
            "brightCyan": "#89ddff",
            "brightGreen": "#c3e88d",
            "brightPurple": "#c792ea",
            "brightRed": "#ff5370",
            "brightWhite": "#ffffff",
            "brightYellow": "#ffcb6b",
            "cyan": "#89ddff",
            "green": "#c3e88d",
            "purple": "#c792ea",
            "red": "#ff5370",
            "white": "#ffffff",
            "yellow": "#ffcb6b"
        },
       {
            "name": "Material Palenight",
            "background": "#292d3e",
            "foreground": "#cdfff6",
            "black": "#000000",
            "blue": "#82aaff",
            "brightBlack": "#676e95",
            "brightBlue": "#81a9ff",
            "brightCyan": "#89ddff",
            "brightGreen": "#c3e88d",
            "brightPurple": "#c792ea",
            "brightRed": "#ff5370",
            "brightWhite": "#ffffff",
            "brightYellow": "#ffcb6b",
            "cyan": "#89ddff",
            "green": "#c3e88d",
            "purple": "#c792ea",
            "red": "#ff5370",
            "white": "#ffffff",
            "yellow": "#ffcb6b"
        },
        {
            // Color Scheme: TermuxColor
            "name":"TermuxColor",
            "background": "#470e36",
            "black": "#4E9A06",
            "blue": "#3465A4",
            "brightBlack": "#555753",
            "brightBlue": "#729FCF",
            "brightCyan": "#34E2E2",
            "brightGreen": "#8AE234",
            "brightPurple": "#eec3e9",
            "brightRed": "#EF2929",
            "brightWhite": "#EEEEEE",
            "brightYellow": "#FCE94F",
            "cyan": "#06989A",
            "foreground": "#EEEEEE",
            "green": "#c8f3c5",
            "purple": "#dcd4dd",
            "red": "#CC0000",
            "white": "#ffffff",
            "yellow": "#C4A000"
        }
    ],
    
    // campo dedicato alle Azioni, visit https://aka.ms/terminal-keybindings
   
   "keybindings": [
        // Copy and paste are bound to Ctrl+Shift+C and Ctrl+Shift+V in your defaults.json.
        // These two lines additionally bind them to Ctrl+C and Ctrl+V.
        // To learn more about selection, visit https://aka.ms/terminal-selection
        {
            "command": {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command": "paste",
            "keys": "ctrl+v"
        },
        // Press Ctrl+Shift+F to open the search box
        {
            "command": "find",
            "keys": "ctrl+shift+f"
        },
        // Press Alt+Shift+D to open a new pane.
        // - "split": "auto" makes this pane open in the direction that provides the most surface area.
        // - "splitMode": "duplicate" makes the new pane use the focused pane's profile.
        // To learn more about panes, visit https://aka.ms/terminal-panes
        {
            "command": {
                "action": "splitPane",
                "split": "auto",
                "splitMode": "duplicate"
            },
            "keys": "alt+shift+d"
        },
        //apre una nuova scheda all'interno della medesima
        {
            "command": {
                "action": "splitPane",
                "split": "auto"
            },
            "keys": "alt+shift+s"
        }
    ]
}
{% endhighlight %}

Spero che questa breve guida vi sia stata d'aiuto per iniziare a personalizzare il vostro Windows Terminal.
<br>Per maggiori dettagli su come personalizzare al meglio Terminal vi rimando alla guida ufficiale di Windows.

<p style="text-align: center">
E tu quale configurazione preferisci?
<br>Non vi resta altro che provare!
</p>

Riferimenti:

[Windows terminal Doc]

[github Terminal] 

Download: 

[Windows Terminal]

[Notepad++]

[Visual Studio Code]



[impostazioni di Windows]: ms-settings:defaultapps

[Visual Studio Code]: https://code.visualstudio.com/Download

[Notepad++]: https://notepad-plus-plus.org/downloads/

[Windows terminal Doc]: https://docs.microsoft.com/it-it/windows/terminal/ 

[Windows Terminal]: https://www.microsoft.com/store/productId/9N0DX20HK701

[github Terminal]: https://github.com/microsoft/terminal

[come usare GNU/Linux in Windows]: /tutorial/2020/07/28/WSL2.html