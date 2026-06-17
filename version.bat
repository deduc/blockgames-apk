@echo off
setlocal enabledelayedexpansion

set /p VERSION=<version

for /f "tokens=1,2 delims=." %%a in ("%VERSION%") do (
    set MAJOR=%%a
    set MINOR=%%b
)

set /a NEW_MINOR=MINOR+1
set NEW_VERSION=%MAJOR%.%NEW_MINOR%

echo %NEW_VERSION%> version

git add .
git commit -m "%VERSION%"
git push
