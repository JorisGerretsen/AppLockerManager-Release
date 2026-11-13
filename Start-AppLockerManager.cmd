@echo off
title AppLocker Management Platform v2.0
echo ========================================================
echo  Starting AppLocker Management Platform (Enterprise Console)
echo ========================================================
echo.

if exist "%~dp0dist\AppLockerManager\AppLockerManager.UI.exe" (
    start "" "%~dp0dist\AppLockerManager\AppLockerManager.UI.exe"
    exit /b 0
)

if exist "%USERPROFILE%\.dotnet\dotnet.exe" (
    set "PATH=%USERPROFILE%\.dotnet;%PATH%"
)

dotnet run --project "%~dp0src\AppLockerManager.UI\AppLockerManager.UI.csproj" -c Release
