# Work with That... https://social.technet.microsoft.com/wiki/contents/articles/30562.powershell-accessing-sqlite-databases.aspx

Add-Type -Path "C:\Users\patrick\Documents\WindowsPowerShell\Scripts\powershell-toolbelt\Modules\timemaster\data-provider\System.Data.SQLite.dll"
$con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
$con.ConnectionString = "Data Source=C:\Users\patrick\Documents\WindowsPowerShell\Scripts\powershell-toolbelt\Modules\timemaster\tracking-data.db"
$con.Open()

$sql = $con.CreateCommand()
$sql.CommandText = "Select * from testtab"
$adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
$data = New-Object System.Data.DataSet
[void]$adapter.Fill($data)
$data.Tables.rows
$sql.Dispose()
$con.Close()

$con = New-Object -TypeName System.Data.SQLite.SQLiteConnection
$con.ConnectionString = "Data Source=C:\Users\patrick\Documents\WindowsPowerShell\Scripts\powershell-toolbelt\Modules\timemaster\tracking-data.db"
$con.Open()
$sql = $con.CreateCommand()
$sql.CommandText = "Insert into testtab values ('Das hier ist über den Data Provider');"
$sql.ExecuteNonQuery()
$sql.Dispose()
$con.Close()