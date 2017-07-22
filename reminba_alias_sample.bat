@echo off
setlocal
echo Reminba.
echo.
set /p yourdate="[1/2] Your Date(HHMM)> "
set /p yourmessage="[2/2] Your Message> "
title %yourdate% "%yourmessage%"
"(REMINBA-PATH)\reminba.bat" %yourdate% "%yourmessage%"
