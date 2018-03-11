@echo off
setlocal EnableDelayedExpansion
title QPP
mode con cols=15 lines=6
md QPP 2>nul
cd QPP 2>nul
:loop
type "QPP0.txt" 2>nul|find "PING">QPP1.txt 2>nul
set /P pongreply=<QPP1.txt 2>nul
set pongreply=PONG %pongreply:~6%
echo %pongreply%>QPP2.txt
cls
echo Don't close.
qprocess *|find "qpp.exe">nul
if %errorlevel%==1 exit
goto loop