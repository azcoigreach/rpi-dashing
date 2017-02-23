# rpi-dashing - supervisord

Raspberry Pi compatible Docker Image with a minimal [Dashing](http://dashing.io/) sample dashboard. 

## Building the docker image - local

    $ docker build -c 0 --tag azcoigreach/rpi-dashing .
    
## Building the docker directly from github

    $ docker build -c 0 --tag azcoigreach/rpi-dashing https://github.com/azcoigreach/rpi-dashing.git
		
## Start the container

    $ docker run --restart unless-stopped -d -i -P -p 3030:3030 azcoigreach/rpi-dashing

## Use your own dashport project

    $ docker run --restart unless-stopped -d -i -P -p 3030:3030 -v `pwd`/:/usr/src/app:rw azcoigreach/rpi-dashing
    
## Connect to container with SSH

    Locate the port your container attached too when starting
    $ docker ps
    
    The 'P' option connects the SSH server to a round-robin port every time the container starts.  
    eg. 0.0.0.0:32768->22/tcp 
    
    $ ssh root@localhost -p [container_port]
    
    Root container password is screencast 
    Password is set in the Dockerfile.
    
## Dashing commands
        
    $ dashing start
