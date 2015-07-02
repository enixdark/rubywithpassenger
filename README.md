##
# The Simple setup ubuntu 15.04 with ruby 2.2 + passenger & nginx server by docker
##

there's a bug when uncomment use bash file app.sh when user docket build, so please run docker images/container and use bash file app.sh in docker.

To build a docker use command `sudo docker build -t ${TAG_NAME} .`
To run a docker container and into bash mode,please use command `sudo docker run -p {$PORT}:80 -it ${TAG_NAME} /bin/bash`
when into docker bash mode please use command `./app.sh` and type acc username & password for private repo of github


