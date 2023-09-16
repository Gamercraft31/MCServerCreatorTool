@echo off
title MCServerCreatorTool
setlocal enabledelayedexpansion

:main_menu
echo Choose a server type:
echo 1. Paper
echo 2. mohist
echo 3. magma

set /p server_choice=Enter your choice (1/2/3): 

if "%server_choice%"=="1" (
    set server_type=paper
    call :choose_mc_version_paper
) else if "%server_choice%"=="2" (
    set server_type=mohist
    call :choose_mc_version_mohist
) else if "%server_choice%"=="3" (
    set server_type=magma
    call :choose_mc_version_magma
) else (
    echo Invalid choice. Please choose 1, 2, 3.
    goto main_menu
)

echo You choose %server_type% server with version %mc_version%.

echo Installation begin...
cd %install_path%
powershell -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/%server_type%-%mc_version%.jar -OutFile %server_type%-%mc_version%.jar"
powershell -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server.properties -OutFile server.properties"
powershell -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/eula.txt -OutFile eula.txt"
powershell -command "Invoke-WebRequest -Uri http://44.31.180.97:2000/jars/server-icon.png -OutFile server-icon.png"
echo Installation finished
echo Creating start script...
echo java -Xms512M -Xmx4096M -jar %server_type%-%mc_version%.jar > start.bat
echo Pause >> start.bat
echo Start script created!

pause
exit

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

:choose_mc_version_vanilla
echo Choose a Minecraft version for Vanilla:
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
echo 23. 1.13.1
echo 24. 1.13
echo 25. 1.12.2
echo 26. 1.12.1
echo 27. 1.12
echo 28. 1.11.2
echo 29. 1.11.1
echo 30. 1.11
echo 31. 1.10.2
echo 32. 1.10.1
echo 33. 1.10
echo 34. 1.9.4
echo 35. 1.9.3
echo 36. 1.9.2
echo 37. 1.9.1
echo 38. 1.9
echo 39. 1.8.9
echo 40. 1.8.8

set /p mc_version=Enter your choice: 
goto :eof