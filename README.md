# SteamBatchSave : Batch Windows to save steam apps settings

## Screenshots
![Screenshot 1](https://raw.githubusercontent.com/jimmycaille/SteamBatchSave/master/Screenshots/readme.png "Screenshot 1")

## Configuration
* Choose the root backup folder (destination of the backups)
  * SET bkpfolder=D:\steambkp
* For each game (increment number)
  * SET app[1].name=Cities Skyline
  * SET app[1].path=D:\steamapps\games\city
* And set total number of games
  * SET /a appNbr=4
* Adapt time and date if format is not DD.MM.YYYY and HH:mm:ss.ms
  * use _echo %TIME%_ and _echo %DATE%_ commands in your CMD prompt
* Change today folder naming as you wish
  * SET todayfolder=%year%-%month%-%day%_%hour%-%min%-%sec%

## Features
* Copies configured folders inside backup folder with this logic :
  * BKP_FOLDER\MACHINE_NAME\DATE_TIME

## Project structure
- README.md          -> that the file you are reading now
- SteamBatchSave.bat -> Batch file
- Screenshots        -> Images of the behavior

## Log
### TODO

## Known issues
* When hours is less than 10 (1 digit) folder produced has a space instead of leading zero

## Developper infos
- Author : Jimmy Caille
- Email  : jimmy.caille.dev@gmail.com
