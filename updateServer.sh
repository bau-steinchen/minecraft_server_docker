#!/bin/bash

# This script will be used to update te server files to run the given version
# This program will also create a backup of the most urgent files but i may bring unforseen situation make sure you do not loose urgen files
# param (1) - will be the path to the server-files.zip
# param (2) - will be the path to the current server files

WORLD_NAME="world"
BACKUP_DIR=""

###############################################################################
# display usage information
###############################################################################

usage() {

echo "\
Usage: updateServer.sh --file FILE --server DIR [OPTION...]

Take the server-files.zip and try to update the version to the server-files.zip version

 Options:
  -f, --file FILE            FILE f the version the server should be running with
  -s, --server DIR           DIR the directory of the server files of the running server

 Optionals:
  -n, --name STRING          STRING for custom world named (default is 'world')
  -b, --backup DIR           DIR the directory where to store the backup file (default inside server files)

 Other options:
  -h, --help                 Displays this help"

}

###############################################################################
# parse command line arguments
# prints out all errors but does not exit to collect all errors
###############################################################################

while [[ $# -gt 0 ]]
do
    case "$1" in
    -f | --file)
        shift

        if [[ $# -lt 1 ]]
        then
            echo "ERROR: Missing parameter for server files " 1>&2
        else
            if test -f "$1";
            then
                SERVER_FILE="$1"
            else
                echo "ERROR: Server file '$1' does not exist" 1>&2
            fi
        fi
        ;;
    -n | --name)
        shift

        if [ ! -z "$1" ]
        then
            WORLD_NAME="$1"
        else
            echo "INFO: using default world name"
        fi
        ;;
    -s | --server)
        shift
        if [[ $# -lt 1 ]]
        then
            echo "ERROR: Missing parameter for server directory" 1>&2
        else
            if [ -d "$1" ]; 
            then
                SERVER_DIR="$1"
            else
                echo "ERROR: Server directory '$1' does not exist" 1>&2
            fi
        fi
        ;;
    -b | --backup)
        shift
        if [ ! -z "$1" ]
        then
            if [ -d "$1" ]; 
            then
                BACKUP_DIR="$1"
            else
                echo "ERROR: Server directory '$1' does not exist" 1>&2
            fi
        else
            echo "INFO: No backup directory saving inside server files."
        fi
        ;;
    
    -h | --help)
        usage
        exit 0
        ;;
    *)
        echo "ERROR: Unknown option: $1" 1>&2
        usage
        exit 0
        ;;
    esac

    shift
done

###############################################################################
# preparation steps finished
###############################################################################

echo "Create Backup before update"

###############################################################################
# display infos about the backup
###############################################################################

echo -e "\
    SERVER_DIR:             ${SERVER_DIR}
    MOD directory:          ${SERVER_DIR}/mods/
    World directoy          ${SERVER_DIR}/${WORLD_DIR}/

    Backup directory:       ${BACKUP_DIR}

"
now=$(date)
echo ${now}
#mkdir -p ${BACKUP_DIR}