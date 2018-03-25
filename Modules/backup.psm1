#TODO: Das sollte eleganter gestaltet werden.
function backup-complete {
    
    $source_books = 'C:\Users\patrick\Documents\books'
    $target_books = 'H:\books'
    if(Test-Path $target_books) {
        Robocopy.exe $source_books $target_books /E
    }
    $source_powershell = 'C:\Users\patrick\Documents\WindowsPowerShell'
    $target_powershell = 'H:\WindowsPowershell'
    if(Test-Path $target_powershell) {
        Robocopy.exe $source_powershell $target_powershell /E
    }
    $source_pictures = 'C:\Users\patrick\Pictures\pictures_backup'
    $target_pictures = 'H:\pictures_backup'
    if(Test-Path $target_pictures) {
        Robocopy.exe $source_pictures $target_pictures /E
    }

    $source_website = 'F:\data\website'
    $target_website = 'H:\website'

    if(Test-Path $target_website) {
        Robocopy.exe $source_website $target_website /E
    }
}
