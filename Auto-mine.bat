@echo off
REM This script kills the ETCMC_GETH.exe process, deletes the myapp.lock file, and starts the ETCMC_GETH with auto-mine option



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
