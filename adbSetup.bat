ECHO OFF
cls
:start
ECHO Welcome, before we remove un-kosher apps from your phone, we just need to make sure ADB is set up on your phone properly.
PAUSE 
ECHO Here, we'll setup ADB. If you are already comfortable with ADB, you can skip this step
ECHO.
ECHO 1. Skip to Device Filtering
ECHO 2. Skip to installing apps
ECHO C. Continue ADB Setup
ECHO.
%SystemRoot%\System32\choice.exe /C 12C /N /M "Choose one of the above options. [1/2/C]: "
if errorlevel 3 goto adbSetup
if errorlevel 2 goto installApps
if errorlevel 1 goto filter

:filter
ECHO.
ECHO Okay, we'll now remove apps
PAUSE
cmd /c removeApps-v.1.0.3.bat
exit /b

:installApps
ECHO.
ECHO Redirecting you to apps page...
pause
cmd /c installAppsadvanced.bat
exit /b 


:adbSetup
PAUSE
%SystemRoot%\System32\choice.exe /C YN /N /M "Is USB Debbuging enabled? [Y/N] (If you are not sure, type [N]): "
if errorlevel 2 goto dev-set
if errorlevel 1 goto usb-config

:dev-set
ECHO.
ECHO Let's make sure USB Debugging is enabled.
ECHO. 
ECHO On LG Classic Flip/ Wine 2, dial ##228378 and press call
ECHO On LG Exalt, dial ##7764726220, and enter code: 000000
PAUSE
ECHO Now, go to developer options, and scroll down to USB Debugging, and tap enabled
PAUSE
:usb-config
ECHO. 
ECHO Now, go to nofifications, select USB Configuration, and select charging (make sure phone is plugged into computer with a file-transfer-compatible cable).
ECHO.
PAUSE.
ECHO We will now connect your phone via ADB.
PAUSE.
adb devices
ECHO.

ECHO If your phone is listed as "XXXXXXX      device", you are connected
ECHO If your phone is listed as "XXXXXXX      Unauthorized", go to your phone, press allow, and allow always
PAUSE
ECHO You are connected!
PAUSE
ECHO Now we will go through the uninstall process. You will choose what to remove from your device.
PAUSE
cmd /c removeApps-v.1.0.3.bat
exit /b
