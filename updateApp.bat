@echo off

REM Set the installation directory and other paths
SET "INSTALL_DIR=C:\Program Files\Lynk247"
SET "EXE_NAME=Lynk247.exe"
SET "JAR_NAME=lynk247DeskApp.jar"
SET "INSTALL_DIR_SRC=C:\Program Files\Lynk247\src\main\resources\com\optimize\lynk247DeskApp\view\stylesUi"
SET "BREAK_STYLE_NAME=breakPage.css"
SET "IDLE_DLL_NAME=CppDeskApp.dll"

SET "BREAK_STYLE_URL=https://raw.githubusercontent.com/OptimizeInnnovations/Lynk247Updater/refs/heads/main/breakPage.css"
SET "IDLE_DLL_URL=https://github.com/OptimizeInnnovations/Lynk247Updater/raw/refs/heads/main/CppDeskApp.dll"


SET "EXE_URL=https://github.com/OptimizeInnnovations/Lynk247Updater/releases/download/LynkUpdate/Lynk247.exe"
SET "JAR_URL=https://github.com/OptimizeInnnovations/Lynk247Updater/releases/download/LynkUpdate/lynk247DeskApp.jar"


REM Step 1: Stop the running application
echo Stopping the application...
taskkill /f /im javaw.exe

REM Step 2: Wait for a few seconds to ensure the process is fully stopped
ping 127.0.0.1 -n 6 > nul

REM Step 3: Download the updated .exe and .jar files
echo Downloading the updated files...

REM Download the JAR file using PowerShell's Invoke-WebRequest
powershell -Command "Invoke-WebRequest '%IDLE_DLL_URL%' -OutFile '%INSTALL_DIR%\%IDLE_DLL_NAME%'"

REM Download the JAR file using PowerShell's Invoke-WebRequest
powershell -Command "Invoke-WebRequest '%BREAK_STYLE_URL%' -OutFile '%INSTALL_DIR_SRC%\%BREAK_STYLE_NAME%'"

REM Download the EXE file using PowerShell's Invoke-WebRequest
powershell -Command "Invoke-WebRequest '%EXE_URL%' -OutFile '%INSTALL_DIR%\%EXE_NAME%'"

REM Download the JAR file using PowerShell's Invoke-WebRequest
powershell -Command "Invoke-WebRequest '%JAR_URL%' -OutFile '%INSTALL_DIR%\%JAR_NAME%'"

REM Step 4: Restart the application
echo Restarting the application...
start "" "%INSTALL_DIR%\%EXE_NAME%"

REM Step 5: Exit the batch file
exit
