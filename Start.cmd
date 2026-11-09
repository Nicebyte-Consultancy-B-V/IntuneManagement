@echo off
rem Starts in PowerShell 7 when it is installed: sign-in with WAM (passkeys, FIDO2 security
rem keys, Windows Hello) only works there. Falls back to Windows PowerShell 5.1 otherwise.
where pwsh.exe >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    pwsh.exe -ex bypass -File "%~dp0Start-IntuneManagement.ps1" %*
) else (
    echo PowerShell 7 is not installed, so passkeys and FIDO2 security keys will not work.
    echo Install it with: winget install --id Microsoft.PowerShell --source winget
    powershell.exe -version 5 -ex bypass -File "%~dp0Start-IntuneManagement.ps1" %*
)
