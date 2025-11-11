# WSL Installation Script
# Führe dieses Skript als Administrator aus (Rechtsklick -> "Als Administrator ausführen")

Write-Host "=== WSL Installation ===" -ForegroundColor Green

# Prüfe, ob bereits als Administrator ausgeführt
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "FEHLER: Dieses Skript muss als Administrator ausgeführt werden!" -ForegroundColor Red
    Write-Host "Rechtsklick auf die Datei -> 'Als Administrator ausführen'" -ForegroundColor Yellow
    exit 1
}

Write-Host "[1/3] Aktiviere Windows Subsystem for Linux..." -ForegroundColor Cyan
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Write-Host "[2/3] Aktiviere Virtual Machine Platform..." -ForegroundColor Cyan
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Host "[3/3] Installiere WSL..." -ForegroundColor Cyan
wsl --install

Write-Host ""
Write-Host "=== Installation abgeschlossen ===" -ForegroundColor Green
Write-Host ""
Write-Host "WICHTIG: Ein Neustart ist erforderlich!" -ForegroundColor Yellow
Write-Host "Nach dem Neustart wird Ubuntu automatisch installiert." -ForegroundColor Yellow
Write-Host ""
Write-Host "Nach dem Neustart:" -ForegroundColor Cyan
Write-Host "  1. Ubuntu wird automatisch gestartet" -ForegroundColor White
Write-Host "  2. Benutzername und Passwort eingeben" -ForegroundColor White
Write-Host "  3. Dann können wir mit dem Build-Setup fortfahren" -ForegroundColor White


