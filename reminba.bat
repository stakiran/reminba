@echo off
setlocal EnableDelayedExpansion
set prefixstr=****************************************************************\n\n
set suffixstr=\n\n****************************************************************

if [%1]==[] (
	echo No time given.
	goto USAGE
	exit /b
)
if [%2]==[] (
	echo No message given.
	goto USAGE
	exit /b
)

set your_time=%1
set your_hour=!your_time:~0,2!
set your_min=!your_time:~2,2!
set your_displaytime=!your_hour!:!your_min!
set your_message=%2
set your_message=!your_message:"=!

:LOOPSTART
set timefull=!time!
set timefull=!timefull: =0!
set timesemifull=!timefull:~0,8!
set hour=!timefull:~0,2!
set min=!timefull:~3,2!
set sec=!timefull:~6,2!
echo Your=!your_displaytime! Current=!timesemifull!

if !hour! equ !your_hour! (
	if !min! equ !your_min! (
		start /min "" cscript %~dp0dialog.vbs "!prefixstr! !your_message! !suffixstr!" "!your_displaytime!" //Nologo
		exit /b
	)
)

%~dp0sleep.exe 500
goto :LOOPSTART

exit /b

rem SUBROOTINS
rem ----------

:USAGE
	echo [Usage]
	echo     %~n0 TIME MESSAGE
	echo.
	echo [Sample]
	echo     %~n0 1245 Buy a 2L water.
	echo     %~n0 0915 Review in Meeting-Room-A.
	exit /b
