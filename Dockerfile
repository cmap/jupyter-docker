# Choose your desired base image
FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update && apt-get -y install libc-dev && apt-get -y install build-essential && apt-get -y install git

# Create a Python 2.x environment using conda including at least the ipython kernel
# and the kernda utility. Add any additional packages you want available for use
# in a Python 2 notebook to the first line here (e.g., pandas, matplotlib, etc.)
RUN conda update -n base conda && conda create --quiet --yes --name merino python=2.7 ipython ipykernel kernda

RUN conda install --name merino -c bioconda numpy pandas=0.24 h5py=2.6.0 requests=2.13.0 cmapPy=3.2.0 scipy setuptools argparse=1.4.0 boto3 pathlib patsy matplotlib seaborn statsmodels yaml pyyaml jinja2

RUN conda clean --all -f -y

#USER root

# Create a global kernelspec in the image and modify it so that it properly activates
# the python2 conda environment.
ENV PATH /opt/conda/envs/merino/bin:$PATH

RUN conda init bash

#activate merino
RUN /bin/bash -c "source activate merino"


# install merino into the environment here
RUN git clone https://github.com/cmap/merino.git && cd merino && python setup.py develop
#RUN source activate merino

RUN python -m ipykernel install && \
kernda -o -y /usr/local/share/jupyter/kernels/python2/kernel.json


#deactivate merino
RUN /bin/bash -c "source deactivate merino"


USER $NB_USER


