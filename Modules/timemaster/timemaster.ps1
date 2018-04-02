<#
Todo: 
* Das DB Framework einbinden
* Es müssen Datumswerte gespeichert und passend wieder ausgelesen werden.
* Es muss die Differenz zwischen diesen Datumswerten berechnet werden. 

* Plausi Prüfungen einbauen. 
- Es muss für jeden Tag ein Feierabend angegeben werden. Wenn es der Tag danach ist und noch keine Feierabend angegeben wurde wird nach der Zeit gefragt.
* In der Tabelle muss es ein Boolean flag für die aktive Aufgabe geben. 
* Wenn tim mit einer Aufgabe gestartet und dann wird tim mit einer 
anderen Aufgabe gestartet, dann wird die erste Aufgabe beendet. 
(Es kann nur eine aktive Aufgabe geben).  



#>


function track {
    param(
        [parameter(Mandatory=$True)][String]$text
    )
    
    $start = Get-Date -Format "dd-MM-yyyy HH:mm"
    $start

    $command = "insert into tracking-data values"



    "test"+$text
}

track "1234"
track