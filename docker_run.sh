#!/usr/bin/env bash

docker run -it \
--rm --privileged --user root -p 8888:8888 \
-e GRANT_SUDO=yes \
-v /Users/jasiedu/WebstormProjects/jupyter-docker/work:/home/jovyan/work \
cmap/jupyter-merino start.sh jupyter lab


#sudo service docker start

#-v /Users/jasiedu/WebstormProjects/jupyter-docker/work:/home/cmap/work \
#docker run -ti --rm --privileged --user root -p 8888:8888 -e GRANT_SUDO=yes jupyter/datascience-notebook:latest start-notebook.sh
