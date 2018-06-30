﻿
Param (
[string]$folderPath
)

#Check that the folder path exists
$subFolders=Get-ChildItem -Path $folderPath -ErrorAction Stop | Where {$_.PSIsContainer} 
ForEach ($subfolder in $subfolders)
{
$output += $subFolder.FullName + "`r`n"
}

$api = New-Object -ComObject 'MOM.ScriptAPI'

$bag=$api.createpropertybag()
$bag.AddValue('Folders',$output)
$bag

