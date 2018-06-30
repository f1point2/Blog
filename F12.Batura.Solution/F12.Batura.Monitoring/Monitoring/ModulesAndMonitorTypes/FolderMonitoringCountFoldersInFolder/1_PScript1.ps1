Param (
[string]$folderPath,
[int]$threshold
)


Try {
$API = New-Object -comObject "MOM.ScriptAPI"
$Bag = $API.CreatePropertyBag()  

#Check that the folder path exists
$subFolders=Get-ChildItem -Path $folderPath -ErrorAction Stop | Where {$_.PSIsContainer}
$numFolders=$subFolders.Count
$api.LogScriptEvent('Number of Folders = ',40,0,$numFolders)


	$Bag.AddValue("OutputDescription", "Folders found")
	$Bag.AddValue("FolderPath", $folderPath)
	$Bag.AddValue("NumberOfFolders", $numFolders)
	$Bag.AddValue("Threshold",$threshold)
}

Catch {
	$Bag.AddValue("OutputDescription", $_.Exception.Message)
	$Bag.AddValue("FolderPath", $folderPath)
	$Bag.AddValue("NumberOfFolders", 0)
	$Bag.AddValue("Threshold",$threshold)

}

Finally {
$Bag
}
