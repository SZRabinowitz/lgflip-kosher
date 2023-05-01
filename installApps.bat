@ECHO off
cls
:start
%SystemRoot%\System32\choice.exe /C YN /N /M "Do you want to install apps onto your phone?[Y/N]: "
if errorlevel 2 goto noApps1
if errorlevel 1 goto yesApps1
if not errorlevel 1 goto startError

:startError
ECHO Not an option, try again.
ECHO.
goto start

:noApps1
ECHO Okay, no problem.
PAUSE 
ECHO Enjoy
pause
exit /b

:yesApps1
ECHO Okay, let's get started.
PAUSE
ECHO. 
%SystemRoot%\System32\choice.exe /C YN /N /M " To access your apps, it is advisable to get Apps4Flip launcher. Would you like to install it?[Y/N]: "
if errorlevel 2 goto noLauncher
if errorlevel 1 goto yesLauncher
if not errorlevel 1 goto apps1Error

:apps1Error
ECHO Not an option, try again. 
ECHO. 
goto yesApps1

:noLauncher
ECHO. 
ECHO No problem.
PAUSE 
cls
goto allApps

:yesLauncher
ECHO.
ECHO 1. For LG Classic Flip, Wine 2 (L125dl)
ECHO 2. For LG Exalt (VN220, UN220)
ECHO 3. Never Mind, I don't want Apps4Flip Launcher
ECHO.
%SystemRoot%\System32\choice.exe /C 123 /N /M " Choose which launcher you'd like based off your phone's model. [1-3]: "
if errorlevel 3 goto noLauncher1
if errorlevel 2 goto exaltLauncher
if errorlevel 1 goto classicLauncher
if not errorlevel 1 goto yesLauncherError

:yesLauncherError
ECHO Not an option, try again.
ECHO.
goto yesLauncher

:noLauncher1 
ECHO.
ECHO Not a problem
PAUSE 
ECHO Okay, now let's choose apps
PAUSE
cls
goto allApps

:exaltLauncher 
ECHO.
adb install -g -r -d exaltLauncher.apk
ECHO.
ECHO Done.
PAUSE
ECHO Okay, now let's choose apps
PAUSE
cls
goto allApps 

:classicLauncher 
ECHO.
adb install -g -r -d classicLauncher.apk
ECHO.
ECHO Done.
PAUSE
ECHO Okay, Now let's choose apps
PAUSE
cls
goto allApps 

:allApps 
ECHO. 
ECHO 2048 (game) (Use letter "A" for this app)
ECHO Accessibility Handler
ECHO Activity Launcher
ECHO Airbattery (AirPods Battery Checker)
ECHO AnyDesk
ECHO Apps4Flip Mouse
ECHO Button Mapper
ECHO Call Recorder 
ECHO CRC Kosher
ECHO DansDeals Viewer
ECHO ES File Explorer
ECHO Google Maps!
ECHO Hebrew Keyboard
ECHO Hebrew (on-screen copy/paste) keyboard
ECHO Jewish Music.FM
ECHO KCO Mouse (best mouse available) (LG Classic Flip only)
ECHO QR Code Scanner
ECHO QuickOffice (PDF and Doc Viewer)
ECHO Screen Recorder
ECHO Settings (LG Rebel 4 Mod) (LG Classic flip only)
ECHO Settings Launcher (for LG Rebel 4 Mod) (LG Classic Flip only)
ECHO Shira Li (Jewish Music App)
ECHO Siddur for Ashkenazim (AndDaven)
ECHO Siddur for sefardim
ECHO Smartlist
ECHO Smart Zmanim
ECHO Tefillas Haderech
ECHO Tehillim
ECHO Unit Converter
ECHO Uninstaller (uninstalls apps)
ECHO VLC (media player)
ECHO Voice Access
ECHO Waze
ECHO Waze Launcher (not required for Waze)
ECHO Weather
ECHO Xplore File Manager
ECHO Yiddish T9 (On-Screen Keyboard)
ECHO.
ECHO.
%SystemRoot%\System32\choice.exe /C ABCDEHKGQSTUVWNXYJ /N /M "Based off the above list, type the first letter of the app you want. If you don't want to install any more apps, type 'N' [A-Z]: "
if errorlevel 18 goto apps-j
if errorlevel 17 goto apps-y
if errorlevel 16 goto apps-x
if errorlevel 15 goto allAppsDone
if errorlevel 14 goto apps-w
if errorlevel 13 goto apps-v 
if errorlevel 12 goto apps-u 
if errorlevel 11 goto apps-t 
if errorlevel 10 goto apps-s
if errorlevel 9 goto apps-q
if errorlevel 8 goto apps-g
if errorlevel 7 goto apps-k
if errorlevel 6 goto apps-h
if errorlevel 5 goto apps-e
if errorlevel 4 goto apps-d
if errorlevel 3 goto apps-c
if errorlevel 2 goto apps-b
if errorlevel 1 goto apps-a
if not errorlevel 1 goto allAppsError

:allAppsError
ECHO Not an option, try again.
ECHO.
PAUSE
cls
goto all Apps

:allAppsDone
cls
ECHO We just need to run one command to make sure everything is properly setup.
PAUSE
adb shell settings put secure enabled_accessibility_services com.android.cts.flar2.homebutton/a.i:com.android.cts.apps.accessibility.voiceaccess/com.google.android.apps.accessibility.voiceaccess.JustSpeakService:com.android.cts.appsflipcursor/com.android.cts.appsflipcursor.services.MouseEventService:com.android.cts.virresh.kcomouse/com.android.cts.virresh.kcomouse.services.MouseEventService:com.android.cts.io.github.virresh.matvt/com.android.cts.io.github.virresh.matvt.services.MouseEventService
ECHO.
ECHO Okay, evrything is setup (hopefully)
Pause 
ECHO Bye
pause
exit /b



:apps-y
cls
ECHO.
ECHO 1. Yiddish T9 (On Screen) Keyboard
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto yiddisht9
if not errorlevel 1 got apps-yError

:apps-yError 
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-y

:yiddisht9
ECHO.
ECHO.
adb install -g -r -d yiddisht9.apk
ECHO.
ECHO Done
pause 
cls
goto allApps

:apps-x
cls
ECHO.
ECHO 1. Xplore File Manager
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto xplorefileManager
if not errorlevel 1 goto apps-xError

:apps-xError
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-x

:xplorefileManager
ECHO.
ECHO.
adb install -g -r -d xplorefileManager.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:apps-w 
cls
ECHO.
ECHO 1. Waze
ECHO 2. Waze Launcher
ECHO 3. Weather
ECHO.
%SystemRoot%\System32\choice.exe /C 123b  /N /M "Type the number next to the app you want to install [1-3] - to go back type 'B': "
if errorlevel 4 goto goBack
if errorlevel 3 goto weather
if errorlevel 2 goto wazeLauncher
if errorlevel 1 goto waze
if not errorlevel 1 goto apps-wError

:apps-wError 
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-w

:weather 
ECHO.
ECHO.
adb install -g -r -d weather.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:wazeLauncher
ECHO.
ECHO.
adb install -g -r -d wazeLauncher.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:waze 
ECHO.
ECHO.
adb install -g -r -d waze.apk
ECHO.
ECHO Done
PAUSE 
cls 
goto allApps

:apps-v
cls
ECHO.
ECHO 1. VLC (Media Player)
ECHO 2. Voice Access
ECHO.
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 3 goto goBack
if errorlevel 2 goto voiceAccess
if errorlevel 1 goto vlc
if not errorlevel 1 goto apps-vError

:apps-vError
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-v

:voiceAccess
ECHO.
ECHO.
adb install -g -r -d voiceAccess.apk
adb shell pm uninstall -k --user 0 com.lge.voicecommand
adb shell settings put secure accessibility_enabled 1
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:vlc
ECHO.
ECHO.
adb install -g -r -d vlc.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:apps-u 
cls
ECHO.
ECHO 1. Unit Converter
ECHO 2. Uninstaller
ECHO.
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1-2] - to go back type 'B': "
if errorlevel 3 goto goBack
if errorlevel 2 goto unitConverter 
if errorlevel 1 goto uninstaller
if not errorlevel 1 goto apps-uError

:Apps-uError
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-u

:unitConverter 
ECHO.
ECHO.
adb install -g -r -d unitConverter.apk
ECHO.
ECHO Done
PAUSE 
cls 
goto allApps 

:uninstaller 
ECHO.
ECHO.
adb install -g -r -d uninstaller.apk 
ECHO.
ECHO Done
PAUSE 
cls 
goto allApps

:apps-t
cls
ECHO.
ECHO 1. Tefillas Haderech 
ECHO 2. Tehillim
ECHO.
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1-2] - to go back type 'B': "
if errorlevel 3 goto goBack
if errorlevel 2 goto tehillim
if errorlevel 1 goto tefillasHaderech
if not errorlevel 1 goto apps-tError

:apps-tError 
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-t

:tehillim
ECHO.
ECHO.
adb install -g -r -d tehillim.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:tefillasHaderech
ECHO.
ECHO.
adb install -g -r -d tefillasHaderech.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:apps-s
cls
ECHO. 
ECHO 1. Screen Recorder 
ECHO 2. Settings (LG Rebel 4 Mod)
ECHO 3. Settings Launcher (for LG Rebel 4 Mod)
ECHO 4. Shira Li (Jewish Music App)
ECHO 5. Siddur for Ashkenazim (AndDaven)
ECHO 6. Siddur for sefardim
ECHO 7. Smartlist
ECHO 8. Smart Zmanim
ECHO.
%SystemRoot%\System32\choice.exe /C 12345678b  /N /M "Type the number next to the app you want to install [1-8] - to go back type 'B': "
if errorlevel 9 goto goBack
if errorlevel 8 goto smartZmanim
if errorlevel 7 goto smartlist
if errorlevel 6 goto siddur4Sefardim
if errorlevel 5 goto siddur4Ashkenazim
if errorlevel 4 goto shiraLi
if errorlevel 3 goto settingsLauncher
if errorlevel 2 goto lgSettings
if errorlevel 1 goto screenRecorder
if not errorlevel 1 goto apps-sError

:apps-sError 
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-s

:smartZmanim
ECHO.
ECHO.
adb install -g -r -d smartZmanim.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:smartlist
ECHO.
ECHO.
adb install -g -r -d smarlist.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:siddur4Sefardim
ECHO.
ECHO.
adb install -g -r -d siddur4Sefardim.apk
ECHO.
ECHO Done
pause 
cls
goto allApps

:siddur4Ashkenazim
ECHO.
ECHO.
adb install -g -r -d siddur4Ashkenazim.apk
ECHO.
ECHO Done
pause 
cls
goto allApps

:shiraLi
ECHO.
ECHO.
adb install -g -r -d shiraLi.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:settingsLauncher
ECHO.
ECHO.
adb install -g -r -d settingsLauncher.apk
ECHO.
ECHO Done
PAUSE
cls
goto allApps

:lgSettings
ECHO.
ECHO.
adb install -g -r -d lgSettings.apk
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:screenRecorder
ECHO.
ECHO.
adb install -g -r -d screenrecorder.apk
ECHO.
ECHO Done
PAUSE
cls
goto allApps

:apps-q
cls
ECHO. 
ECHO 1. QR Code Scanner
ECHO 2. QuickOffice (PDF and DOC viewer)
ECHO.
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1-2] - to go back type 'B': " 
if errorlevel 3 goto goBack
if errorlevel 2 goto quickOffice
if errorlevel 1 goto qrScanner
if not errorlevel 1 goto apps-qError

:apps-qError
ECHO Not an option, try again.
ECHO.
PAUSE
goto apps-q

:qrScanner
ECHO.
ECHO.
adb install -g -r -d qrScanner.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:quickOffice
ECHO.
ECHO.
adb install -g -r -d quickOffice.apk
ECHO.
ECHO Done
PAUSE 
cls 
goto allApps

:apps-k 
cls
ECHO.
ECHO 1. KCO Mouse (best mouse available) (LG Classic Flip only)
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto kcoMouse
if not errorlevel 1 goto apps-kError

:apps-kError
ECHO Not an option, try again.
ECHO.
pause
goto apps-k 

:kcoMouse
ECHO.
ECHO.
adb install -g -r -d kcoMouse.apk
ECHO.
adb shell pm uninstall -k --user 0 com.lge.voicecommand
adb shell appops set com.android.cts.virresh.kcomouse SYSTEM_ALERT_WINDOW allow
adb shell settings put secure accessibility_enabled 1
ECHO.
ECHO Done
PAUSE 
cls
goto allApps

:apps-j
cls
ECHO.
ECHO 1. Jewish Music.FM
ECHO. 
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto jewishMusic
if not errorlevel 1 goto apps-jError

:apps-jError
ECHO Not an option, try again.
ECHO.
pause
goto apps-j

:jewishMusic
ECHO.
ECHO.
adb install -g -r -d jewishMusic.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:apps-h
cls
ECHO.
ECHO 1. Hebrew Keyboard
ECHO 2. Hebrew (on-screen copy/paste) keyboard
ECHO. 
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1-2] - to go back type 'B': "
if errorlevel 3 goto goBack
if errorlevel 2 goto hebCopyKeyboard
if errorlevel 1 goto hebKeyboard
if not errorlevel 1 goto apps-hError

:apps-hError
ECHO Not an option, try again.
ECHO.
pause
goto apps-h

:hebCopyKeyboard
ECHO.
ECHO.
adb install -g -r -d hebCopyKeyboard.apk
ECHO.
ECHO Done.
pause
cls
goto allApps

:hebKeyboard
ECHO.
ECHO.
adb install -g -r -d hebKeyboard.apk
adb shell pm grant com.android.cts.a4fhebrew android.permission.WRITE_SECURE_SETTINGS
ECHO.
ECHO Done.
pause
cls
goto allApps

:apps-g
cls
ECHO.
ECHO 1. Google Maps!
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto googleMaps
if not errorlevel 1 goto apps-gError

:apps-gError
ECHO Not an option, try again.
ECHO.
pause
goto apps-g

:googleMaps
ECHO.
ECHO.
adb install -g -r -d googleMaps.apk
ECHO.
ECHO Done.
pause 
cls
goto allApps

:apps-e
cls
ECHO.
ECHO 1. ES File Explorer
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto esfileExplorer
if not errorlevel 1 goto apps-eError

:apps-eError
ECHO Not an option, try again.
ECHO.
pause
goto apps-e

:esfileExplorer
ECHO.
ECHO.
adb install -g -r -d esfileExplorer.apk
ECHO.
ECHO Done.
pause
cls
goto allApps

:apps-d
cls
ECHO.
ECHO 1. DansDeals Viewer
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 2 goto goBack
if errorlevel 1 goto dansdealsViewer
if not errorlevel 1 goto apps-dError

:apps-dError
ECHO Not an option, try again.
ECHO.
pause
goto apps-d

:dansdealsViewer
ECHO.
ECHO.
adb install -g -r -d dansdealsViewer.apk
ECHO.
ECHO Done.
pause
cls
goto allApps

:apps-c
cls
ECHO.
ECHO 1. Call Recorder
ECHO 2. CRC Kosher
ECHO.
%SystemRoot%\System32\choice.exe /C 12b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 3 goto goBack
if errorlevel 2 goto crcKosher
if errorlevel 1 goto callRecorder
if not errorlevel 1 goto apps-cError

:apps-cError
ECHO Not an option, try again.
ECHO.
pause
goto apps-c 

:callRecorder
ECHO. 
ECHO.
adb install -g -r -d callRecorder.apk
ECHO.
ECHO Done.
pause
cls
goto allApps

:crcKosher
ECHO.
ECHO.
adb install -g -r -d crcKosher.apk
ECHO.
ECHO Done.
pause
cls
goto allApps

:apps-b
cls
ECHO.
ECHO 1. Button Mapper
ECHO.
%SystemRoot%\System32\choice.exe /C 1b  /N /M "Type the number next to the app you want to install [1] - to go back type 'B': "
if errorlevel 1 goto buttonMapper
if not errorlevel 1 goto apps-bError

:apps-bError
ECHO Not an option, try again.
ECHO.
pause
goto apps-b

:buttonMapper
ECHO.
ECHO.
adb install -g -r -d buttonMapper.apk
ECHO.
adb shell settings put secure accessibility_enabled 1
ECHO.
ECHO Done.
pause
cls
goto allApps

:apps-a
cls
ECHO.
ECHO 1. 2048 (game)
ECHO 2. Accessibility Handler
ECHO 3. Activity Launcher
ECHO 4. Airbattery (AirPods Battery Checker)
ECHO 5. AnyDesk
ECHO 6. Apps4Flip Mouse
ECHO. 
%SystemRoot%\System32\choice.exe /C 123456b  /N /M "Type the number next to the app you want to install [1-4] - to go back type 'B': "
if errorlevel 7 goto goBack
if errorlevel 6 goto a4fMouse
if errorlevel 5 goto anydesk
if errorlevel 4 goto airBattery
if errorlevel 3 goto activityLauncher
if errorlevel 2 goto accessibility
if errorlevel 1 goto 2048
if not errorlevel 1 goto apps-aError

:apps-aError
ECHO Not an option, try again.
ECHO.
pause
goto apps-a 

:2048
ECHO.
ECHO.
adb install -g -r -d 2048.apk
ECHO.
ECHO Done
pause 
cls 
goto allApps

:accessibility
ECHO.
ECHO.
adb install -g -r -d accessibility.apk
ECHO.
adb shell pm grant com.android.cts.accessibility android.permission.WRITE_SECURE_SETTINGS
ECHO Done
pause 
cls
goto allApps

:airBattery
ECHO.
ECHO.
adb install -g -r -d airBattery.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:activityLauncher
ECHO.
ECHO.
adb install -g -r -d activityLauncher.apk
ECHO.
ECHO Done
pause
cls
goto allApps



:anydesk
ECHO.
ECHO.
adb install -g -r -d anydesk.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:apkEditor
ECHO.
ECHO.
adb install -g -r -d apkEditor.apk
ECHO.
ECHO Done
pause
cls
goto allApps

:a4fMouse
ECHO.
ECHO.
adb install -g -r -d a4fMouse.apk
ECHO.
adb shell pm uninstall -k --user 0 com.lge.voicecommand
adb shell appops set com.android.cts.appsflipcursor SYSTEM_ALERT_WINDOW allow
adb shell settings put secure accessibility_enabled 1
ECHO.
ECHO Done
pause
cls
goto allApps

:goBack
ECHO.
ECHO Redirecting
pause
cls
goto allApps
