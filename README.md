# minecraft_atm8_server
Just storing the startup files for the minecraft server running All The Mods 8 Modpack inside docker

For running the server you need to download the server files from curseforge and adapt the versions inside the docker-compose file  

I copied the server files to the mounted location, in my example    
/mnt/storage/data/minecraft_atm8/

For testing purpose and see direct log output you can use:    
docker-compose up

For running the server in detached mode use the -d flag to start the Docker image:    
docker-compose up -d
