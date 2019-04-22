Param (
    [string]$Path = $(Get-Location)
)

Write-Host ""
Write-Host " Directory of $Path"
Write-Host ""

$Items = Invoke-Expression "Get-ChildItem -Path `"$Path`" $Args"

ForEach ($Item in $Items) {
    If ($Item.GetType().Name -eq "DirectoryInfo") {
        Write-Host $([string]::Format("{0:MMM} {0:dd} {0:yyyy}  {0:HH}:{0:mm}:{0:ss}  {1,-15} {2}",
            $Item.LastWriteTime, "<DIR>", $Item)) -ForegroundColor "Blue"
    } else {
        Write-Host $([string]::Format("{0:MMM} {0:dd} {0:yyyy}  {0:HH}:{0:mm}:{0:ss}  {1,15:N0} {2}",
            $Item.LastWriteTime, $Item.Length, $Item)) -ForegroundColor "Blue"
    }
}

Write-Host ""
