<#
.SYNOPSIS
test

#>
function get-id {
    $csvData = Import-Csv -Path F:\data\ps-data\timetracker\data.csv 
    ($csvData.id | Measure-Object -Maximum).Maximum+1
}


function start-tracking {
    param([Parameter(Mandatory=$True)][string]$description)
    $id = get-id
    $day = Get-Date -Format 'dd.MM.yyyy'
    $time = Get-Date -Format 'HH:mm'
    $row = New-Object System.Object 
    $row | Add-Member -type NoteProperty -Name 'id' -Value $id
    $row | Add-Member -type NoteProperty -Name 'day' -Value $day
    $row | Add-Member -type NoteProperty -Name 'time' -Value $time
    $row | Add-Member -type NoteProperty -Name 'description' -Value $description
    Export-Csv -Path F:\data\ps-data\timetracker\data.csv -InputObject $row -NoTypeInformation -Append
}

function print-complete {
    $importedCsv = Import-Csv -Path F:\data\ps-data\timetracker\data.csv | ft -Property id, day, time, description -GroupBy day
    $importedCsv
}

function print-today {
    $today = Get-Date -Format 'dd.MM.yyyy'
    $importedCsv = Import-Csv -Path F:\data\ps-data\timetracker\data.csv 
    $importedCsv.Where({$PSItem.day -eq $today})
}
print-today