---
layout: post
title:  "Usare e personalizzare Windows Terminal"
date:   2020-12-10 10:30:00 +0200
categories: tutorial
tags: windows gnu/linux wsl windows10 Terminal WindowsTerminal
---
<div class="contenuto-centrato">
<img src="/assets/tutorial/tutorial2/top.png" alt="Microsoft e GNU/Linux" class="img-centrata" oncontextmenu="return false;" /> </div>

Benvenuti in questo secondo episodio.

Ci siamo lasciati a distanza di mesi con la procedura su [come usare GNU/Linux in Windows], oggi come promesso vi parlerò di un applicazione sviluppata da Microsoft Corporation e resa disponibile sotto licenza "MIT License", di cui potete trovare il sorgente al seguente repository [github Terminal].

<h1>Cos'è Windows Terminal?</h1>

Windows Terminal è un applicazione pratica, potente e multifunzionale che permette di usare strumenti utili da riga di comando, è possibile scaricarla gratuitamente dal Microsoft Store [Windows Terminal].

Terminal supporta in maniera nativa il classico prompt dei comandi o cmd, il fresco PowerShell, il caro WSL, Azure Cloud shell e tutti quei programmi che sono forniti di un'interfaccia a riga di comando.
<br>Tra le principali funzionalità possiamo trovare la gestione di più schede e più riquadri in simultanea, un supporto completo per i caratteri Unicode, un accelerazione GPU per il motore di rendering del testo e la piena personalizzazione di temi, del colore e delle scelte rapide. 

<img src="/assets/tutorial/tutorial2/terminal_schermata1.png" alt="schermata Windows Terminal" class="img-post"/>

<h1>Come personalizzare Windows Terminal</h1>

Al primo avvio dopo averlo installato come profilo predefinito troverete Windows PowerShell, inoltre se all'interno del PC vi sono installate distribuzioni WSL verranno creati automaticamente i profili associati.

Per personalizzare Windows Terminal occorre selezionare dal menù a discesa "impostazioni", ebbene si una volta aver cliccato su impostazioni non si aprirà un bel programmino ad interfaccia grafica, ma verrà aperto il file `setting.json` molto probabilmente usando come programma predefinito blocco note:
<img src="/assets/tutorial/tutorial2/setting_blocco_note.png" alt="setting.json con blocco note" class="img-post"/>

Non spaventatevi a prima vista vi potrà sembrare molto complicato capirci qualcosa, ma è molto più semplice di quel che state pensando.

Anche se è possibile modificare il file `.json` con qualsiasi editor di testo come per l'appunto blocco note, consiglio l'utilizzo di un editor più avanzato come [Notepad++] o [Visual Studio Code], se adoperate il WSL vi troverete bene con quest'ultimo editor.
<br>Per modificare l'editor di testo predefinito basta andare nelle [impostazioni di Windows], o in alternativa creare un file con estensione `.json` e dirgli di aprire sempre con l'editor di testo desiderato.

<h1>Struttura di setting.json</h1>

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

come è possibile notare il resto dei tag sono abbastanza intuitivi, `"tabTitle":` e `"icon":` servono per cambiare il nome e l'immagine nella barra del titolo.
<img src="/assets/tutorial/tutorial2/tab_title.png" alt="setting.json tab_title" class="img-post"/>
I tag `"useAcrylic":` e `"acrylicOpacity"` per attivare e regolare l'effetto acrilico di Windows. 

Diversamente il tag `"colorScheme": "Material",` serve a richiamare la combinazione colore personalizzata che si trova in `"schemes": [`.
<br>Questo è il tema personalizzato che ho creato per Debian WSL chiamato "Material".
<img src="/assets/tutorial/tutorial2/colore_profilo.png" alt="setting.json colore profilo" class="img-post"/>


Di seguito vi lascio la mia configurazione del file `setting.json` in cui è possibile notare che oltre a PowerShell, cmd, e le due distribuzioni Wsl, ho disabilitato `Azure Cloud Shell` e creato un profilo che mi permette di collegarmi tramite protocollo ssh al mio dispositivo Android.

{% highlight json-doc %}
 {
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "defaultProfile": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
    // You can add more global application settings here.
    // To learn more about global settings, visit https://aka.ms/terminal-global-settings
    // If enabled, selections are automatically copied to your clipboard.
    "copyOnSelect": false,
    // If enabled, formatted data is also copied to your clipboard
    "copyFormatting": false,
    // A profile specifies a command to execute paired with information about how it should look and feel.
    // Each one of them will appear in the 'New Tab' dropdown,
    //   and can be invoked from the commandline with `wt.exe -p xxx`
    // To learn more about profiles, visit https://aka.ms/terminal-profile-settings
    "profiles": {
        "defaults": {
            // Put settings here that you want to apply to all profiles.
            "cursorShape": "vintage"
        },
        "list": [
        
            {
                // Make changes here to the powershell.exe profile.
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "useAcrylic": true,
                "acrylicOpacity": 0.8,
                "colorScheme": "Campbell Powershell",
                "name": "Windows PowerShell",
                "commandline": "powershell.exe",
                "hidden": false
            },
            {
                "guid": "{58ad8b0c-3ef8-5f4d-bc6f-13e4c00f2530}",
                "icon": "C:/Users/andre/Pictures/img_terminal/debian_jekyll.png",
                "colorScheme": "Dracula",
                "suppressApplicationTitle": true,
                "name": "Jekyll-Debian",
                "tabTitle": "Jekyll-Debian 🧛‍♂️",
                "backgroundImage": "C:/Users/andre/Pictures/img_terminal/debian_jekyll.png",
                "backgroundImageOpacity" : 0.5,
                "backgroundImageStretchMode": "none",
                "backgroundImageAlignment": "bottomRight", 
                "hidden": false,
                "source": "Windows.Terminal.Wsl"
            },
            {
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "suppressApplicationTitle": true,
                "icon": "C:/Users/andre/Pictures/img_terminal/ubuntu.png ",
                "name": "Ubuntu-20.04",
                "tabTitle": "Ubuntu-20.04",
                "colorScheme": "Ubuntu",
                "backgroundImage": "C:/Users/andre/Pictures/img_terminal/ubuntu.png",
                "backgroundImageOpacity" : 0.5,
                "backgroundImageStretchMode": "none",
                "backgroundImageAlignment": "bottomRight",
                "hidden": false,                
                "source": "Windows.Terminal.Wsl"
            },     
            {
                // Make changes here to the cmd.exe profile.
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                // "useAcrylic" : true,
               // "acrylicOpacity" : 0.9,
                "colorScheme" : "Vintage",
                "cursorColor" : "#FFFFFD",
                "fontFace" : "Cascadia Code PL",     
                "commandline": "cmd.exe",
                "hidden": false
            },
            {
                // Connects to a remote machine using SSH
                "name": "SSH Termux 🏍",
                "suppressApplicationTitle": true,
                "tabTitle": "SSH Termux 📱",
                "commandline": "ssh nome@indirizzoip -p numeroporta",
                "icon": "C:/Users/andre/Pictures/img_terminal/termux.png",
                "colorScheme": "termuxColor",
                "backgroundImage": "C:/Users/andre/Pictures/img_terminal/termux.png",
                "backgroundImageOpacity" : 0.5,
                "backgroundImageStretchMode": "none",
                "backgroundImageAlignment": "bottomRight",
                "fontFace": "Cascadia Code"
                
            },
            {
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": true,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure"
            }
         
           
        ]
    },
    // Add custom color schemes to this array.
    // To learn more about color schemes, visit https://aka.ms/terminal-color-schemes
    "schemes": [
        { 
            "name": "Dracula",
            "cursorColor": "#F8F8F2",
            "selectionBackground": "#44475A",
            "background": "#282A36",
            "foreground": "#F8F8F2",
            "black": "#21222C",
            "blue": "#BD93F9",
            "cyan": "#8BE9FD",
            "green": "#50FA7B",
            "purple": "#FF79C6",
            "red": "#FF5555",
            "white": "#F8F8F2",
            "yellow": "#F1FA8C",
            "brightBlack": "#6272A4",
            "brightBlue": "#D6ACFF",
            "brightCyan": "#A4FFFF",
            "brightGreen": "#69FF94",
            "brightPurple": "#FF92DF",
            "brightRed": "#FF6E6E",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#FFFFA5"
        },
        
        {
            "name": "Ubuntu",
            "black": "#2e3436",
            "red": "#cc0000",
            "green": "#4e9a06",
            "yellow": "#c4a000",
            "blue": "#3465a4",
            "purple": "#75507b",
            "cyan": "#06989a",
            "white": "#d3d7cf",
            "brightBlack": "#555753",
            "brightRed": "#ef2929",
            "brightGreen": "#8ae234",
            "brightYellow": "#fce94f",
            "brightBlue": "#729fcf",
            "brightPurple": "#ad7fa8",
            "brightCyan": "#34e2e2",
            "brightWhite": "#eeeeec",
            "background": "#300a24",
            "foreground": "#eeeeec"
        },
        {
            // Color Scheme: colorTermux
            "name": "termuxColor",
            "black": "#000000",
            "red": "#9f0000",
            "green": "#008b00",
            "yellow": "#ffd000",
            "blue": "#0081ff",
            "purple": "#bc00ca",
            "cyan": "#008b8b",
            "white": "#bbbbbb",
            "brightBlack": "#555555",
            "brightRed": "#ff0000",
            "brightGreen": "#00ee00",
            "brightYellow": "#ffff00",
            "brightBlue": "#0000ff",
            "brightPurple": "#ff00ff",
            "brightCyan": "#00cdcd",
            "brightWhite": "#ffffff",
            "background": "#000000",
            "foreground": "#00a595"
        }
    ],
    // Add custom keybindings to this array.
    // To unbind a key combination from your defaults.json, set the command to "unbound".
    // To learn more about keybindings, visit https://aka.ms/terminal-keybindings
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
{% endhighlight %}

L'ultima sezione ossia quella delle azioni, come potete vedere dal mio `setting.json` serve per personalizzare le scorciatoie da tastiera.

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

[come usare GNU/Linux in Windows]: /tutorial/2020/07/31/WSL2.html