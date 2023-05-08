@echo off
:start
cls
echo/
ECHO 1. Remove Browser (Highly Recommended!!!)
ECHO 2. Remove Email
ECHO 3. Remove Hotspot
ECHO 4. Remove FM Radio
ECHO 5. Remove Video
ECHO 6. Remove Text Messages
ECHO 7. Disable App Installation
ECHO D. All Done, I don't want to remove any more apps.
echo.
%SystemRoot%\System32\choice.exe /C 1234567D /N /M "Type the number of what you want to remove, and press enter. If you don't want to remove any more apps, type [D]: "
if errorlevel 8 goto end
if errorlevel 7 goto installer
if errorlevel 6 goto messages
if errorlevel 5 goto video
if errorlevel 4 goto radio
if errorlevel 3 goto hotspot
if errorlevel 2 goto email
if errorlevel 1 goto browser
if not errorlevel 1 goto error-start

:error-start
ECHO Invalid Option, Try again!
PAUSE
goto start

:browser
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove the browser? [Y/N]: "
if errorlevel 2 goto browser-n
if errorlevel 1 goto browser-y
if not errorlevel 1 goto browser

:browser-y 
adb shell pm uninstall -k --user 0 com.android.browser
ECHO. 
ECHO Browser has been removed.
PAUSE
cls
goto start

:browser-n
ECHO.
ECHO Okay, the Browser will remain on your phone (not recommended).
PAUSE
cls
goto start

:email
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove Email from your phone? [Y/N]: "
if errorlevel 2 goto email-n
if errorlevel 1 goto email-y

:email-y
adb shell pm uninstall -k --user 0 com.lge.email
ECHO.
ECHO Email has been removed.
PAUSE
cls
goto start

:email-n
ECHO.
ECHO Not a problem, email will remain on your phone.
PAUSE
cls
goto start

:hotspot
ECHO. 
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove the hotspot from your phone? [Y/N]: "
if errorlevel 2 goto hotspot-n
if errorlevel 1 goto hotspot-y

:hotspot-y
adb shell pm uninstall -k --user 0 com.lge.hotspotlauncher
ECHO.
ECHO Hotspot has been removed.
PAUSE
cls
goto start

:hotspot-n
ECHO.
ECHO That's fine, enjoy your hotspot!
PAUSE
cls
goto start

:radio
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove FM Radio from your phone? [Y/N]: "
if errorlevel 2 goto radio-n
if errorlevel 1 goto radio-y

:radio-y
adb shell pm uninstall -k --user 0 com.lge.fmradio
ECHO. 
ECHO FM Radio has been removed.
PAUSE
cls
goto start

:radio-n
ECHO.
ECHO Too late, we already removed it without telli- Just Kidding, we will leave FM Radio on your phone.
PAUSE
cls
goto start

:video 
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove the video player from your phone? [Y/N]: "
if errorlevel 2 goto video-n
if errorlevel 1 goto video-y

:video-y
adb shell pm uninstall -k --user 0 com.lge.videoplayer
ECHO.
ECHO Video has been removed.
PAUSE
cls
goto start

:video-n
ECHO.
ECHO Sure, video is here to stay!
PAUSE
cls
goto start

:messages
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to remove the messaging app from your phone? [Y/N]: "
if errorlevel 2 goto messages-n
if errorlevel 1 goto messages-y

:messages-y
adb shell pm uninstall -k --user 0 com.android.mms >nul
adb shell pm uninstall -k --user 0 com.verizon.messaging.vzmsgs >nul
ECHO.
ECHO Text Messaging has been removed.
PAUSE
cls
goto start

:messages-n
ECHO.
ECHO Sure, your texts will be left untouched.
PAUSE
cls
goto start

:installer
ECHO.
%SystemRoot%\System32\choice.exe /C YN /N /M "Are you sure you want to disable app installation on your phone? [Y/N]: "
if errorlevel 2 goto installer-n
if errorlevel 1 goto installer-y

:installer-y
adb shell pm disable-user --user 0 com.android.defcontainer
ECHO.
ECHO App installation has been disabled.
PAUSE
cls
goto start

:installer-n
ECHO.
ECHO No problem! You can still install apps on your phone.
PAUSE
cls
goto start

:end
ECHO.
ECHO Okay, enjoy your phone!
%SystemRoot%\System32\choice.exe /C YN /N /M "Would you like to install any (kosher) apps on your phone? [Y/N]: "
if errorlevel 2 goto apps-n
if errorlevel 1 goto apps-y

:apps-n
ECHO.
ECHO Okay, enjoy your phone.
ECHO Bye.
PAUSE 
exit /B

:apps-y
ECHO.
ECHO Sure, we'll take you there right now. 
ECHO.
PAUSE 
cmd /c installAppsadvanced.bat
exit /b
:releases-y
start https://github.com/biden2020prez/lgflip-kosher/releases
PAUSE
goto apps-n

:releases -n
goto apps-n
