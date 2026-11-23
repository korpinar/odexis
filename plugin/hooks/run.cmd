: << 'CMD'
@echo off
rem odexis, launcher of the three steps for Antigravity, which starts a step through cmd on
rem Windows and through sh elsewhere. This file is read by both. On Windows it finds Git Bash
rem itself (an ordinary terminal has git on its path, not bash; a bash found on the path may be
rem another system's) and is silent when it cannot: without Git Bash the steps do not run.
setlocal
set "B="
for /f "delims=" %%G in ('where git 2^>nul') do if not defined B if exist "%%~dpG..\bin\bash.exe" set "B=%%~dpG..\bin\bash.exe"
for /f "delims=" %%G in ('where git 2^>nul') do if not defined B if exist "%%~dpG..\..\bin\bash.exe" set "B=%%~dpG..\..\bin\bash.exe"
if not defined B if exist "%ProgramFiles%\Git\bin\bash.exe" set "B=%ProgramFiles%\Git\bin\bash.exe"
if not defined B if exist "%ProgramFiles(x86)%\Git\bin\bash.exe" set "B=%ProgramFiles(x86)%\Git\bin\bash.exe"
if not defined B if exist "%LocalAppData%\Programs\Git\bin\bash.exe" set "B=%LocalAppData%\Programs\Git\bin\bash.exe"
if not defined B if exist "%UserProfile%\scoop\apps\git\current\bin\bash.exe" set "B=%UserProfile%\scoop\apps\git\current\bin\bash.exe"
if not defined B exit /b 0
if not exist "%~dp0%~1.sh" exit /b 0
"%B%" "%~dp0%~1.sh"
exit /b 0
CMD
[ -f "$(dirname "$0")/$1.sh" ] || exit 0
command -v bash >/dev/null 2>&1 || exit 0
exec bash "$(dirname "$0")/$1.sh"
