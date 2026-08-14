@echo off
taskkill /F /IM msedge.exe /T >nul 2>&1
timeout /t 2 >nul

set "EDGE=msedge.exe"
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" set "EDGE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if exist "C:\Program Files\Microsoft\Edge\Application\msedge.exe" set "EDGE=C:\Program Files\Microsoft\Edge\Application\msedge.exe"

start "" "%EDGE%" --kiosk --force-device-scale-factor=1.75 "%~dp0index.html"