@echo off

echo [Update scripts repository]
git pull
echo [Ok]

echo [Create tmp directory]
IF NOT EXIST "tmp" (
    mkdir tmp
    echo [Ok]
) ELSE (
    echo [Already exists]
)

type NUL >> tmp\QuickNotes.txt

echo [Run AutoHotKey scripts]
start script.ahk
echo [OK]


