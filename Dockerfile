# Builds rtpipe, pwkit and all dependencies with conda for use in ipython notebook
FROM continuumio/anaconda:latest

RUN apt-get install -y debian-archive-keyring
RUN apt-key update -y

RUN apt-get update && apt-get install -y libfftw3-bin libfftw3-dev python-pip gcc  # git
RUN conda install -y ncurses  # jupyter
RUN conda install -y -c pkgw casa-data casa-python 
RUN pip install rtpipe sdmreader sdmpy pwkit pyfftw

WORKDIR /ipynb
CMD ipython notebook --no-browser --ip=0.0.0.0
EXPOSE 8888

