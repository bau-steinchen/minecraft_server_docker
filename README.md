# minecraft_server_docker
Just storing the startup files for minecraft servers i'm running.   
Currently:   
* All The Mods 8
* All the Mods 9
* All The Mods 7 To The Sky

## DEPRECATION WARNING
Some of the given information maybe outdated due to updates in the refence image:
e.g. the image now provide the functionalities to directly start modpacks from curseforge by only providing the url or slug like discribes here:
[Documentation about the docker image](https://github.com/itzg/docker-minecraft-server#running-a-server-with-a-curseforge-modpack)

## Usage
For running the server you need to download the server files from curseforge and adapt the versions inside the docker-compose file  

I copied the server files to the mounted location, in my example    
compose/data/minecraft_atm8/

For testing purpose and see direct log output you can use:    
docker-compose up

For running the server in detached mode use the -d flag to start the Docker image:    
docker-compose up -d
