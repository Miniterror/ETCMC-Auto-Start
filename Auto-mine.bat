@echo off
REM This script checks if there is a new version of the Auto-mine.bat file on GitHub and overwrites the local file if needed, will kill ETCMC_GETH.exe when already running and deletes the myapp.lock file if found, after these steps ti will start the ETCMC_GETH client and start mining

REM Download the remote file and save it as temp.bat 1234
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = \"tls12, tls11, tls\"; Invoke-WebRequest https://github.com/Miniterror/ETCMC-Auto-Start/blob/main/Auto-mine.bat -OutFile temp.bat"

REM Compare the content of the local and remote files
fc /b Auto-mine.bat temp.bat > nul

REM If the files are different, overwrite the local file with the remote file and start it again
if errorlevel 1 (
  echo New version available
  del Auto-mine.bat
  ren temp.bat Auto-mine.bat
  call Auto-mine.bat
) else (
  echo No new version available
  del temp.bat
)

REM Kill the ETCMC_GETH.exe process if it is running
taskkill /f /im ETCMC_GETH.exe > nul 2>&1

REM Change the current directory to the ETCMC_GUI\ETCMC_GETH folder
cd /D C:\"Program Files (x86)"\"ETCMC ETC NODE LAUNCHER*"\ETCMC_GUI\ETCMC_GETH

REM Delete the myapp.lock file if it exists
del myapp.lock

REM Wait for one second
timeout /t 1 /nobreak > nul

REM Start the ETCMC_GETH with auto-mine option
start ETCMC_GETH --auto-mine

REM Exit the script
exit
