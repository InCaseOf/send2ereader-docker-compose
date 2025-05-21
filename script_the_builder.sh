# This is the script I run on my unraid server to build and push to dockerhub 
#!/bin/bash
# /mnt/user/building/send2ereader
echo "##################################################################################"
echo "cloning send2ereader git"
git clone https://github.com/daniel-j/send2ereader.git /mnt/user/building/send2ereader/
echo "removing existing compose"
rm /mnt/user/building/send2ereader/docker-compose.yaml
echo "cloning modified compose"
git clone https://github.com/InCaseOf/send2ereader-docker-compose.git /mnt/user/building/send2ereader/custom
echo "moving"
mv /mnt/user/building/send2ereader/custom/docker-compose.yaml /mnt/user/building/send2ereader/
echo "building"
docker compose -f /mnt/user/building/send2ereader/docker-compose.yaml build
echo "pushing"
docker image push incaseof/send2ereader:latest
#clean up 
echo "clean up"
rm -rf /mnt/user/building/send2ereader/
docker image rm send2ereader
echo "##################################################################################"
