cmd /c del /f "%USERPROFILE%\Documents\important.txt"
timeout /t 1 > nul
del /f "%~f0"
