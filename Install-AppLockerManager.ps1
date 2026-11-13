<#
.SYNOPSIS
    Installatiescript voor het AppLocker Management Platform (Enterprise Console v2.0).
.DESCRIPTION
    Installeert de gecompileerde standalone binary op het doelsysteem (bijv. beheerservers, RDS hosts, support werkplekken),
    creeert snelkoppelingen op het bureaublad en in het Startmenu, registreert de AppLocker service en configureert werkmappen.
#>

[CmdletBinding()]
param(
    [string]$InstallPath = "$env:ProgramFiles\AppLockerManager",
    [switch]$CreateDesktopShortcut = $true,
    [switch]$EnableAppIdService = $true
)

$ErrorActionPreference = "Stop"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " AppLocker Management Platform v2.0 - Installer" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Check Administrator Privileges
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Warning "Dit installatiescript vereist Administrator-rechten om snelkoppelingen en services te configureren."
    Write-Warning "Herstart PowerShell als Administrator."
}

# 2. Source and Target folders
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceDir = Join-Path $scriptDir "dist\AppLockerManager"
if (-not (Test-Path $sourceDir)) {
    $sourceDir = $scriptDir
}

Write-Host "[1/5] Doelmap controleren: $InstallPath" -ForegroundColor Yellow
if (-not (Test-Path $InstallPath)) {
    New-Item -ItemType Directory -Path $InstallPath -Force | Out-Null
}

$backupsPath = Join-Path $InstallPath "Backups"
if (-not (Test-Path $backupsPath)) {
    New-Item -ItemType Directory -Path $backupsPath -Force | Out-Null
}

$policiesPath = Join-Path $InstallPath "Policies"
if (-not (Test-Path $policiesPath)) {
    New-Item -ItemType Directory -Path $policiesPath -Force | Out-Null
}

# 3. Copy binaries
Write-Host "[2/5] Bestanden installeren naar $InstallPath..." -ForegroundColor Yellow
if (Test-Path $sourceDir) {
    Copy-Item -Path "$sourceDir\*" -Destination $InstallPath -Recurse -Force
}

$exePath = Join-Path $InstallPath "AppLockerManager.UI.exe"

# 4. Create Shortcuts
Write-Host "[3/5] Snelkoppelingen aanmaken..." -ForegroundColor Yellow
$wshShell = New-Object -ComObject WScript.Shell

# Start Menu Shortcut
$startMenuPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs"
$startShortcut = $wshShell.CreateShortcut((Join-Path $startMenuPath "AppLocker Management Platform.lnk"))
$startShortcut.TargetPath = $exePath
$startShortcut.IconLocation = "$exePath,0"
$startShortcut.WorkingDirectory = $InstallPath
$startShortcut.Description = "Centraal AppLocker Management Platform v2.0"
$startShortcut.Save()

# Desktop Shortcut
if ($CreateDesktopShortcut) {
    $desktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
    $desktopShortcut = $wshShell.CreateShortcut((Join-Path $desktopPath "AppLocker Management Platform.lnk"))
    $desktopShortcut.TargetPath = $exePath
    $desktopShortcut.IconLocation = "$exePath,0"
    $desktopShortcut.WorkingDirectory = $InstallPath
    $desktopShortcut.Description = "Centraal AppLocker Management Platform v2.0"
    $desktopShortcut.Save()
}

# 5. Service Configuration
if ($EnableAppIdService) {
    Write-Host "[4/5] Controleren van Windows AppIDSvc (Application Identity Service)..." -ForegroundColor Yellow
    try {
        Set-Service -Name "AppIDSvc" -StartupType Automatic -ErrorAction SilentlyContinue
        Start-Service -Name "AppIDSvc" -ErrorAction SilentlyContinue
        Write-Host "      AppIDSvc service geconfigureerd op Automatisch." -ForegroundColor Green
    }
    catch {
        Write-Warning "      Kon AppIDSvc service niet automatisch starten: $($_.Exception.Message)"
    }
}

Write-Host "[5/5] Installatie succesvol afgerond!" -ForegroundColor Green
Write-Host ""
Write-Host "U kunt het platform direct starten via:" -ForegroundColor Cyan
Write-Host "  - Snelkoppeling op Bureaublad / Startmenu" -ForegroundColor White
Write-Host "  - $exePath" -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
