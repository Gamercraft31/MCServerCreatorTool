#!/bin/bash
mcrcon(){
    read -p "Do you want to download MCRcon (Require Wine to run it on linux): " mcrcon
    if [ "$mcrcon" = "yes" ]; then
        echo "Download starting..."
        apt-get install wine
        apt-get install wine32
        dpkg --add-architecture i386 && apt-get update
        cd $path
        wget http://44.31.180.97:2000/jars/rconserver.properties -OutFile server.properties
        mkdir MCRcon
        cd MCRcon
        wget http://44.31.180.97:2000/jars/mcrcon.exe
        echo "wine mcrcon.exe -t -H 127.0.0.1 -P 25575 -p localhost" > start.sh
    fi

    if [ "$mcrcon" = "no" ]; then
        kill -INT $$
    fi
}

paper(){
    echo "1. 1.20.1"
    echo "2. 1.20"
    echo "3. 1.19.1"
    echo "4. 1.19"
    echo "5. 1.18.1"
    echo "6. 1.18"
    echo "7. 1.17.1"
    echo "8. 1.17"
    echo "9. 1.16.5"
    echo "10. 1.16.4"
    echo "11. 1.16.3"
    echo "12. 1.16.2"
    echo "13. 1.16.1"
    echo "14. 1.15.2"
    echo "15. 1.15.1"
    echo "16. 1.15"
    echo "17. 1.14.4"
    echo "18. 1.14.3"
    echo "19. 1.14.2"
    echo "20. 1.14.1"
    echo "21. 1.14"
    echo "22. 1.13.2"
    echo "23. 1.12.2"
    echo "24. 1.12.1"
    echo "25. 1.12"
    echo "26. 1.11.2"
    echo "27. 1.11.1"
    echo "38. 1.11"
    echo "39. 1.10.2"
    echo "40. 1.10.1"
    echo "41. 1.10"
    echo "42. 1.9.4"
    echo "43. 1.9.3"
    echo "44. 1.9.2"
    echo "45. 1.9.1"
    echo "46. 1.9"
    echo "47. 1.8.9"
    echo "48. 1.8.8"
    read -p "Choose paper version: " paper_version
    read -p "Choose installation path: " path
    cd $path
    echo "Download starting..."
    wget http://44.31.180.97:2000/jars/$server_type-$paper_version.jar
    wget http://44.31.180.97:2000/jars/server.properties
    wget http://44.31.180.97:2000/jars/eula.txt
    wget http://44.31.180.97:2000/jars/server-icon.png
    echo java -Xms512M -Xmx4096M -jar $server_type-$paper_version.jar nogui > start.sh
    echo "Download finished"
    mcrcon
}

mohist(){
    echo "1. 1.7.10"
    echo "2. 1.12.2"
    echo "3. 1.16.5"
    echo "4. 1.18.2"
    echo "5. 1.19.2"
    echo "6. 1.19.4"
    echo "7. 1.20.1"
    read -p "Choose mohist version: " mohist_version
    read -p "Choose installation path: " path
    cd $path
    echo "Download starting..."
    wget http://44.31.180.97:2000/jars/$server_type-$mohist_version.jar
    wget http://44.31.180.97:2000/jars/server.properties
    wget http://44.31.180.97:2000/jars/eula.txt
    wget http://44.31.180.97:2000/jars/server-icon.png
    echo java -Xms512M -Xmx4096M -jar $server_type-$mohist_version.jar nogui > start.sh
    echo "Download finished"
    mcrcon
}

magma(){
    echo "1. 1.12.2"
    echo "2. 1.16.5"
    echo "3. 1.18.2"
    echo "4. 1.19.3"
    echo "1.20.1 coming soon"
    read -p "Choose magma version: " magma_version
    read -p "Choose installation path: " path
    cd $path
    echo "Download starting..."
    wget http://44.31.180.97:2000/jars/$server_type-$magma_version.jar
    wget http://44.31.180.97:2000/jars/server.properties
    wget http://44.31.180.97:2000/jars/eula.txt
    wget http://44.31.180.97:2000/jars/server-icon.png
    echo java -Xms512M -Xmx4096M -jar $server_type-$magma_version.jar nogui > start.sh
    echo "Download finished"
    mcrcon
}

bungeecord(){
    read -p "Choose installation path: " path
    cd $path
    echo "Download starting..."
    wget http://44.31.180.97:2000/jars/bungeecord.jar
    wget http://44.31.180.97:2000/jars/server.properties
    wget http://44.31.180.97:2000/jars/server-icon.png
    echo java -Xms512M -Xmx4096M -jar bungeecord.jar nogui > start.sh
    echo "Download finished"
    mcrcon
}

main_menu(){
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root, Exiting..."
    kill -INT $$
fi
echo "-------------------"
echo "MCServerCreatorTool"
echo "-------------------"
echo "Script is running with root privileges."
echo "Do not type the number to choose or the script will exit"
echo "1. paper"
echo "2. mohist"
echo "3. magma"
echo "4. bungeecord (mc server proxy)"
read -p "Choose jar type: " server_type

if [ "$server_type" = "paper" ]; then
    server_choose="paper"
    paper
fi
if [ "$server_type" = "mohist" ]; then
    server_choose="mohist"
    mohist
fi
if [ "$server_type" = "magma" ]; then
    server_choose="magma"
    magma
fi
if [ "$server_type" = "bungeecord" ]; then
    bungeecord
fi
}

main_menu