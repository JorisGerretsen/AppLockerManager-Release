# Single-command launcher for AppLocker Management Platform
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$exePath = Join-Path $scriptDir "dist\AppLockerManager\AppLockerManager.UI.exe"

if (Test-Path $exePath) {
    Write-Host "Starting AppLocker Management Platform standalone binary..." -ForegroundColor Green
    Start-Process -FilePath $exePath
} else {
    $env:PATH = "$env:USERPROFILE\.dotnet;$env:PATH"
    Write-Host "Running AppLocker Management Platform via dotnet run..." -ForegroundColor Cyan
    dotnet run --project (Join-Path $scriptDir "src\AppLockerManager.UI\AppLockerManager.UI.csproj") -c Release
}
