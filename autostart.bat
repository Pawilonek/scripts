@echo off

echo [Update scripts repository]
git pull
echo [Ok]

echo [Create cache directory]
IF NOT EXIST ".cache" (
    mkdir .cache
	attrib +h .cache
    echo [Ok]
) ELSE (
    echo [Already exists]
)

echo [Run AutoHotKey scripts]
start script.ahk
echo [OK]

