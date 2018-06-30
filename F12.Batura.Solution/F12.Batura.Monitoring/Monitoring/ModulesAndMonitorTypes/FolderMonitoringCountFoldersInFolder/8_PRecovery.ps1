param(
[string]$folderPath
)

$subFolders=Get-ChildItem -Path $folderPath -ErrorAction Stop | Where {$_.PSIsContainer} | foreach ($_) {remove-item $_.fullname}
