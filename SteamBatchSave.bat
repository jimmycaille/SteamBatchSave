@ECHO OFF
cls
setlocal enabledelayedexpansion 
SET machine=%computername%
REM #####################################
REM ########## START OF CONFIG ##########
REM #####################################

REM all folders must exist !
SET bkpfolder=D:\steambkp
SET app[1].name=Cities Skyline
SET app[1].path=D:\steambkp\games\city
SET app[2].name=GTA IV
SET app[2].path=D:\steambkp\games\gta
SET app[3].name=Portal 2
SET app[3].path=D:\steambkp\games\portal
SET app[4].name=Game 4
SET app[4].path=D:\steambkp\games\game 4
SET /a appNbr=4

REM adapt if date is not DD.MM.YYYY
SET datedelim=.
for /F "tokens=1-3 delims=%datedelim%" %%a in ("%date%") do (
   SET day=%%a
   SET month=%%b
   SET year=%%c
)
REM adapt if time is not HH:mm:ss.ms
SET timedelim=:.
for /F "tokens=1-3 delims=%timedelim%" %%a in ("%time%") do (
   SET hour=%%a
   SET min=%%b
   SET sec=%%c
)
REM adapt naming nomenclature as you wish..
SET todayfolder=%year%-%month%-%day%_%hour%-%min%-%sec%

REM #####################################
REM ########### END OF CONFIG ###########
REM #####################################

REM asdf
echo ษอออออออออออออออออออออออออออออออออป
echo บ WELCOME TO STREAM BACKUP SCRIPT บ
echo ศอออออออออออออออออออออออออออออออออผ

REM test if bkp folder exists
if not exist %bkpfolder% (
  echo %bkpfolder% DIRECTORY DOESN'T EXIST !
  GOTO EOF
)
cd /d "%bkpfolder%"

REM create sub folder with machine name
if not exist %machine% (
	mkdir "%machine%"
	echo %bkpfolder%\%machine% directory created...
	echo.
)
cd "%machine%"
mkdir "%todayfolder%"
echo %bkpfolder%\%machine%\%todayfolder% directory created...
echo.

REM copy files of each game folder
for /l %%n in (1,1,%appNbr%) do ( 
   if exist !app[%%n].path! (
	   cd "%bkpfolder%\%machine%\%todayfolder%"
	   echo ### Backuping !app[%%n].name!...
	   mkdir "!app[%%n].name!"
	   cd "!app[%%n].name!"
	   xcopy !app[%%n].path! /Q
   ) else (
      echo ### Nothing to backup for !app[%%n].name!...
   )
)
echo.


echo            ษอออออป
echo            บ END บ
echo            ศอออออผ
echo     Press any key to exit...

:EOF
pause >nul
