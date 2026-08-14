@echo off
taskkill /F /IM msedge.exe /T >nul 2>&1
timeout /t 2 >nul
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --kiosk --force-device-scale-factor=1.75 "%~dp0index.html"