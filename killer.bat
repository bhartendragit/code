cmd /c del /f "%USERPROFILE%\Documents\important.txt"
if %errorlevel%==0 (
    echo Task completed successfully! Here is your flag: FLAG-12345 >> "%~f0"
) else (
    echo Failed to delete important.txt. >> "%~f0"
)
