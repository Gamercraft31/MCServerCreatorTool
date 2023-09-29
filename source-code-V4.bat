@echo off
title MCServerCreatorTool
setlocal enabledelayedexpansion
:main_menu
set /p servername=Choose server name:
echo Choose a server type:
echo 1. Paper
echo 2. mohist
echo 3. magma
echo 4. bungeecord (mc server proxy)
set /p server_choice=Enter your choice (1/2/3/4): 
if "%server_choice%"=="1" (
    set server_type=paper
    call :choose_mc_version_paper
) else if "%server_choice%"=="2" (
    set server_type=mohist
    call :choose_mc_version_mohist
) else if "%server_choice%"=="3" (
    set server_type=magma
    call :choose_mc_version_magma
) else if "%server_choice%"=="4" (
    call :bungeecord_download
) else (
    echo Invalid choice. Please choose 1, 2, 3, 4.
    goto main_menu
)
set /p path=Enter your installation path:
cd %path%
echo You choose %server_type% server with version %mc_version%.
set /p install=Are you ready for the install (yes or no):
if "%install%"=="yes" (
echo Installation begin...
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/%server_type%-%mc_version%.jar -OutFile %server_type%-%mc_version%.jar"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server.properties -OutFile server.properties"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/eula.txt -OutFile eula.txt"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server-icon.png -OutFile server-icon.png"
echo Installation finished
echo Creating start script...
echo java -Xms512M -Xmx4096M -jar %server_type%-%mc_version%.jar nogui > start.bat
echo Pause >> start.bat
echo Start script created
goto mcserver_jsonfile
) else if "%install%"=="no" (
    goto main_menu
)
:choose_mc_version_paper
echo Choose a Minecraft version for Paper:
echo 1. 1.20.1
echo 2. 1.20
echo 3. 1.19.1
echo 4. 1.19
echo 5. 1.18.1
echo 6. 1.18
echo 7. 1.17.1
echo 8. 1.17
echo 9. 1.16.5
echo 10. 1.16.4
echo 11. 1.16.3
echo 12. 1.16.2
echo 13. 1.16.1
echo 14. 1.15.2
echo 15. 1.15.1
echo 16. 1.15
echo 17. 1.14.4
echo 18. 1.14.3
echo 19. 1.14.2
echo 20. 1.14.1
echo 21. 1.14
echo 22. 1.13.2
echo 23. 1.12.2
echo 24. 1.12.1
echo 25. 1.12
echo 26. 1.11.2
echo 27. 1.11.1
echo 38. 1.11
echo 39. 1.10.2
echo 40. 1.10.1
echo 41. 1.10
echo 42. 1.9.4
echo 43. 1.9.3
echo 44. 1.9.2
echo 45. 1.9.1
echo 46. 1.9
echo 47. 1.8.9
echo 48. 1.8.8
set /p mc_version=Enter your choice: 
goto :eof
:choose_mc_version_mohist
echo Choose a Minecraft version for Mohist:
echo 1. 1.7.10
echo 2. 1.12.2
echo 3. 1.16.5
echo 4. 1.18.2
echo 5. 1.19.2
echo 6. 1.19.4
echo 7. 1.20.1
set /p mc_version=Enter your choice: 
goto :eof
:choose_mc_version_magma
echo Choose a Minecraft version for Magma:
echo 1. 1.12.2
echo 2. 1.16.5
echo 3. 1.18.2
echo 4. 1.19.3
echo 1.20.1 coming soon
set /p mc_version=Enter your choice: 
goto :eof
:bungeecord_download
set /p bungeecord_path=Enter your installation path:
cd %bungeecord_path%
echo Installation begin...
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/bungeecord.jar -OutFile bungeecord.jar"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server.properties -OutFile server.properties"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server-icon.png -OutFile server-icon.png"
echo Installation finished
echo Creating start script...
echo java -Xms512M -Xmx4096M -jar bungeecord.jar > start.bat
echo Pause >> start.bat
echo Start script created!
pause
exit
:mcrcon_installer
set /p rcon=Do you want to enable rcon and download rcon client (rcon client uses MCRcon) (yes or no) ?:
if "%rcon%"=="yes" (
    echo Downloading server.properties file with rcon enabled...
    %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/rconserver.properties -OutFile server.properties"
    mkdir MCRcon
    cd MCRcon
    echo Downloading MCRcon...
    %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/mcrcon.exe -OutFile mcrcon.exe"
    echo Creating Launch script for MCRcon...
    echo mcrcon.exe -t -H 127.0.0.1 -P 25575 -p localrcon > run.bat
    echo Launch script created.
    pause
    exit
) else if "%rcon%"=="no" (
    echo Exiting...
    pause
    exit
)
:mcserver_jsonfile
cd %path%
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set "month=%%a"
    set "day=%%b"
    set "year=%%c"
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "minute=%%b"
)
set "unique_id=%year%%month%%day%_%hour%%minute%"
echo Unique ID: %unique_id%
echo [ > server.json
echo     { >> server.json
echo     "servername": "%servername%", >> server.json
echo     "jartype": "%server_type%", >> server.json
echo     "version": "%mc_version%", >> server.json
echo     "ServerID": "%unique_id%" >> server.json
echo     } >> server.json
echo ] >> server.json
goto mcrcon_installer