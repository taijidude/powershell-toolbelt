$moduleFolder = "";
$dataFile = "";

function get-modulePath {
    param(
        [switch]$folder,
        [switch]$dataFile, 
        [switch]$configFile
    )
    
    $config = ( [xml] (gc config.xml));   
    if($folder.IsPresent) {
        return $config.config.folder;
    } 
    if($dataFile.IsPresent) {
        return $config.config.files.data;
    }
}
get-modulePath -folder
get-modulePath -dataFile


function create-xml-file {
    param([string]$fileName)
    if(!$PSBoundParameters.ContainsKey("fileName")) {
        $fileName = "data.xml"
    }
    New-Item -ItemType file -Name $fileName
    $content = [xml] "<?xml version='1.0'?><data></data>"
    $content.Save($fileName)
}

function getNextId {
    $content = [xml](get-content .\data.xml)
    $tasks = $content.SelectNodes("//data[1]/task")
    $highestId = -1 
    foreach($task in $tasks) {
        $currentId = $task.getAttribute("id")
        if($currentId > $highestId) {
            $highestId = $currentId
        }
    }
    return $highestId+1
}

getNextId

#Löscht die bestehende Data Datei und legt sie neu an.
function clear-all {
    #$data = "C:\Users\patrick\Documents\WindowsPowerShell\Modules\timemaster\data.xml"
    cd C:\Users\ace\Documents\WindowsPowerShell\Modules\timemaster 
    del data.xml
    create-xml-file
}

function track {
    param(
        [String]$text,
        [String]$id
    )
    #$data = "C:\Users\patrick\Documents\WindowsPowerShell\Modules\timemaster\data.xml"

    $data = "C:\Users\ace\Documents\WindowsPowerShell\Modules\timemaster\data.xml"
    if(Test-Path $data) {
        $content = [xml] (Get-Content $data)
        $nodes = $content.SelectNodes("//data[1]")
        foreach($node in $nodes) {
            $task = $content.CreateElement("task")
            # Kann ich das ab hier pipen
            $task.SetAttribute("date", (Get-Date).ToString("dd-MM-yyyy"))
            $task.SetAttribute("id", $id)
            $task.SetAttribute("start-time", (Get-Date).ToString("HH:mm"))
            $task.SetAttribute("stop-time", "")
            $task.AppendChild($content.CreateTextNode($text))
            $node.AppendChild($task)
        }
        $content.Save($data)
    } else {
        New-Item -ItemType file -Name data.xml
        $content = [xml] "<?xml version='1.0'?><data></data>"
        $content.Save($data)
        # Hier muss dann noch die entsprechende Task erstellt und angeh�ngt werden

    }
}

function list {
   

}

function stop {

}

function report {
   
}
#track -id 667 -text "tests123"
getNextId
#clear-all