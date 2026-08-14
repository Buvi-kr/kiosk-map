@echo off
chcp 65001 >nul
title 포천아트밸리 키오스크 경로안내 실행기

echo ========================================================
echo   포천아트밸리 무인 키오스크 경로안내 시스템 시작 중...
echo ========================================================

:: 1. 기존 실행 중인 브라우저 프로세스 안전 종료
taskkill /F /IM msedge.exe /T >nul 2>&1
taskkill /F /IM chrome.exe /T >nul 2>&1
timeout /t 1 /nobreak >nul

:: 2. 현재 폴더 내 index.html 절대 경로 자동 인식
set "TARGET_URL=%~dp0index.html"

:: 3. 키오스크 최적화 실행 옵션 설정
:: --kiosk: 전체화면 키오스크 모드
:: --disable-pinch: 터치 핀치 줌 차단
:: --overscroll-history-navigation=0: 터치 스와이프 뒤로가기 차단
:: --no-first-run / --no-default-browser-check: 브라우저 초기 안내 팝업 차단
:: --disable-session-crashed-bubble: 예기치 못한 종료 복구창 차단
set "KIOSK_FLAGS=--kiosk --edge-kiosk-type=fullscreen --no-first-run --no-default-browser-check --disable-pinch --overscroll-history-navigation=0 --disable-session-crashed-bubble --disable-features=TranslateUI --force-device-scale-factor=1.75"

:: 4. 브라우저 실행 파일 경로 자동 탐색 및 실행
if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" %KIOSK_FLAGS% "%TARGET_URL%"
    goto :SUCCESS
)

if exist "C:\Program Files\Microsoft\Edge\Application\msedge.exe" (
    start "" "C:\Program Files\Microsoft\Edge\Application\msedge.exe" %KIOSK_FLAGS% "%TARGET_URL%"
    goto :SUCCESS
)

if exist "%LocalAppData%\Microsoft\Edge\Application\msedge.exe" (
    start "" "%LocalAppData%\Microsoft\Edge\Application\msedge.exe" %KIOSK_FLAGS% "%TARGET_URL%"
    goto :SUCCESS
)

if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" %KIOSK_FLAGS% "%TARGET_URL%"
    goto :SUCCESS
)

if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %KIOSK_FLAGS% "%TARGET_URL%"
    goto :SUCCESS
)

:: 기본 명령 실행 fallback
start msedge %KIOSK_FLAGS% "%TARGET_URL%"

:SUCCESS
echo 안내 시스템이 성공적으로 실행되었습니다.
exit