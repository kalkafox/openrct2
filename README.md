# kalka/openrct2 (docker.io)

This is a simple Docker repo that grabs the latest `ubuntu_amd64` image from OpenRCT's Docker hub repository, and creates an OpenRCT2 server with some special requirements.

## Requirements
* A copy of RCT2. Mount the directory as a volume pointing to `/game`.
* The custom config.ini must be mounted as a volume or the program will NOT start.

## Use

Pulling the image:
`docker pull kalka/openrct2:latest`

After that, pull the config.ini from the GitHub repo:
`https://raw.githubusercontent.com/mild-prowler/openrct2/master/config.ini`

Edit as you please.

Find your game path and add it to the run parameter:
`-v <game_directory>:/game`

Run like so:
`docker run -d -v <config_directory>:/home/openrct2/.config/OpenRCT2/config.ini -v <game_directory>:/game -p 11753/tcp kalka/openrct2:latest <save_file>`

Example usage:
`docker run -d -v ~/config.ini:/home/openrct2/.config/OpenRCT2/config.ini -v /RCT2:/game -p 11753/tcp kalka/openrct2:latest /save/scenario.scn`

## Extra volumes

* Save/scenario directory

Mount `/save` as a directory and add save/scenarios from there. e.g `-v /home/kalka/saves:/save`

## Troubleshooting

```terminate called after throwing an instance of 'std::bad_alloc'
  what():  std::bad_alloc```
  
If you get this error, it means you either forgot to mount the config.ini volume or the directory you entered is invalid. Make sure you're pointing it to the right directory.