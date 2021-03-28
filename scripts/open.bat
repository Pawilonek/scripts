@echo off

rem explorer.exe %*

IF "%~1" == "" GOTO Current
	explorer.exe %~1
	GOTO done

:Current
	explorer.exe .

:DONE
