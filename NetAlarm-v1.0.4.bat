@echo off

::NetAlarm v1.0.4	By: Alex Auvenshine	Date: 5/30/2016

::https://www.gnu.org/licenses/gpl-3.0.en.html


set verNum=v1.0.4
title NetAlarm-%verNum% [Connected]
set connectName=www.google.com
set backUpName=en.wikipedia.org
set noLuck=0


:start
ping /n 1 %connectName%
if %ERRORLEVEL% GTR 0 goto bad
goto good


:good
title NetAlarm-%verNum% [Connected]
cls
color 0a
echo ---------------
echo ---Connected---
echo ---------------
if %noLuck% GTR 0 set /a noLuck=%noLuck%-1
timeout /t 5
goto start


:bad
ping /n 1 %backUpName%
if %ERRORLEVEL% GTR 0 (
goto yeah_bad) else goto good


:yeah_bad
if %noLuck% LSS 4 set /a noLuck=%noLuck%+1
title NetAlarm-%verNum% [Disconnected]
cls
color 0c
echo ----------------
echo -!Disconnected!-
echo ----------------
timeout /t 5
if %noLuck% GTR 3 (
goto alarm) else goto start


:alarm
echo 
timeout /t 1
echo 
timeout /t 1
echo 
timeout /t 1
cls
goto start