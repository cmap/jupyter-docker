#!/usr/bin/env bash

docker run -it \
--rm -p 8888:8888 \
-e NB_USER=cmap \
-w /home/$NB_USER \
-v /Users/jasiedu/WebstormProjects/jupyter-docker/work:/home/cmap/work \
cmap/jupyter-merino start.sh jupyter lab

#-v /Users/jasiedu/WebstormProjects/jupyter-docker/work:/home/cmap/work \
