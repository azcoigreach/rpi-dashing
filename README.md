# rpi-dashing

Raspberry Pi compatible Docker Image with a minimal [Dashing](http://dashing.io/) sample dashboard. 

## Building the docker image

    $ docker build -c 0 --tag azcoigreach/rpi-dashing .
		
## Start the container

    $ docker run -i -d -p 3030:3030 azcoigreach/rpi-dashing

## Use your own dashport project

    $ docker run -i -d -p 3030:3030 -v `pwd`/:/usr/src/app:rw azcoigreach/rpi-dashing
    
## Start the container and keep control, e.g. when using the docker image for development

    $ docker run -i -t -p 3030:3030 -v `pwd`/:/usr/src/app:rw azcoigreach/rpi-dashing bash
        
E.g. in order to start the server:
        
    $ dashing start
