@echo off 
set version=UBC Moptions 
set version2=UBC 1.6 
echo --%version%-- 
echo Enter 1 to Defragment the Disk. 
echo Enter 2 to Scan for Malware. 
echo Enter 3 to Install SetUp File Silently (BETA, Not Recomended to Use). 
echo Enter 4 to Go to the menu. 
choice /c 123456789 /n /m "Enter an option number: " /t 10 /d 0
if errorlevel 6 goto option6
if errorlevel 5 goto option5
if errorlevel 4 goto menu2
if errorlevel 3 goto option7
if errorlevel 2 goto option9
if errorlevel 1 goto option10 :option10
cls
echo Defragmenting system drive...
defrag.exe C: /U /V
echo System drive defragmentation completed.
pause
cls
goto menu 
:option9
cls
echo Scanning for malware...
powershell.exe -Command "Start-MpScan -ScanType QuickScan"
echo Malware scan completed.
pause
goto menu
:option7
REM Get user input for setup file and arguments
set /p setup=Enter path to setup file:
set /p arguments=Enter setup arguments (optional):

REM Validate user input and install setup file
if not exist "%setup%" (
echo Invalid setup file. Please try again.
goto :install_setup
) else (
echo Installing setup file...
start /wait "" "%setup%" %arguments%
echo Setup file installed successfully.
) 
:menu2 
cd.. start %version2%.bat 
exit
