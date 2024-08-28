#!/usr/bin/bash


# push current directory
pushd .

# go to the files directory
cd pages/files

# download java installer
# get headers for download request
curl -sI https://javadl.oracle.com/webapps/download/AutoDL?BundleId=250129_d8aa705069af427f9b83e66b34f5e380 -D headers.txt > /dev/null

# get just the location field of the header
location=$(cat headers.txt | grep -i location)

# remove temp file
rm headers.txt

# split the string on the ' ' after location and keep only the second string
rawlink=$(echo -n $location | cut -d ' ' -f 2)

# write raw link to file
echo -n $rawlink > rawlink.txt

# get python to remove newline
./striplink.py

# remove temp file
rm rawlink.txt

link=$(cat link.txt)

# remove temp file
rm link.txt

# download the java installer
curl -sO $link

# # download the forge installer
curl -sO https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.4.2/forge-1.19.2-43.4.2-installer.jar

# return current directory
popd