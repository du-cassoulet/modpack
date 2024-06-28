@echo off
setlocal EnableDelayedExpansion

set "FOLDER=modpack"
set "URL=https://github.com/du-cassoulet/%FOLDER%.git"

git --version >nul 2>&1

if errorlevel 1 (
    winget install --id Git.Git -e --source winget

    if errorlevel 1 (
        echo Failed to install Git. Please install Git manually.
        exit /b 1
    )
)

if not exist ".git\" (
    git clone "%URL%"

    if errorlevel 1 (
        echo Failed to clone the repository.
        exit /b 1
    )

    xcopy "%FOLDER%\*" "." /S /E /H /I /Y

    if errorlevel 1 (
        echo Failed to move files.
        exit /b 1
    )

    @RD /S /Q "%FOLDER%"
) else (
    git pull

    if errorlevel 1 (
        echo Failed to update the repository.
        exit /b 1
    )
)

endlocal
