<# Work with That... https://social.technet.microsoft.com/wiki/contents/articles/30562.powershell-accessing-sqlite-databases.aspx
Diese Datei enthält ein paar Funktionen, die den Zugriff auf die SQlite Datenbank kapseln, folgende Funktionen gibt es: 
1. 
2. 
3. 
4. 
TODO's
- Die Ausgabe des in der Function execute-query muss formatiert werden
- Die Methode init-con und cleanup dürfen nur von Functionen in diesem Framework benutzt werden. 
- Das Script muss ein Modul werden
- Wir brauchen eine Print Methode um die Ausgabe der Tabellen zu formatieren
- Wir müssen die Pfad setzen 
- Es muss eine Methode geben, die prüft ob die Datenbank vorhanden ist.


#>

$providerPath = "c:\Users\ace\Documents\WindowsPowerShell\powershell-toolbelt\Modules\timemaster\data-provider\System.Data.SQLite.dll"
$databasePath = "datasource=c:\Users\ace\Documents\WindowsPowerShell\powershell-toolbelt\Modules\timemaster\tracking-data.db"

Add-Type -Path $providerPath

function init-con {
    $con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
    $con.ConnectionString = $databasePath
    $con.Open()
    return $con
}

function cleanup {
    $sql.Dispose()
    $con.Close()
}


function execute-query {
    param([string]$query)
    $con = init-con
    $sql = $con.CreateCommand()
    $sql.CommandText = $query
    $adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
    $data = New-Object System.Data.DataSet
    [void]$adapter.Fill($data)    
    cleanup $sql $con
    #$data.Tables.rows
    return $data
}

function execute-command {
    $con = init-con
    $sql = $con.CreateCommand()
    $sql.CommandText = $query
    $sql.ExecuteNonQuery()
    cleanup $sql $con
}

$data = execute-query "Select * from testtab;"
$data.Tables.rows


