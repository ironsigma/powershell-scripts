function Prompt {
    $GitBranch = $(git rev-parse --abbrev-ref HEAD)

    Write-Host "$(Get-Date -Format HH:mm.ss) " -NoNewline -ForegroundColor Gray
    Write-Host $(Get-Location | Split-Path -Leaf) -NoNewline -ForegroundColor Yellow
    if ($GitBranch) {
        Write-Host " ($GitBranch)" -NoNewline -ForegroundColor Green
    }

    return " "
}

Set-Alias -Name la -Value Get-ChildItemColor.ps1
