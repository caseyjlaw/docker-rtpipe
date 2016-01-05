# Builds rtpipe, pwkit and all dependencies with conda for use in ipython notebook
FROM continuumio/anaconda:latest

RUN apt-get install -y debian-archive-keyring
RUN apt-key update -y

RUN apt-get update && apt-get install -y libfftw3-bin libfftw3-dev python-pip gcc
RUN conda install -y ncurses
RUN conda install -y -c pkgw casa-data casa-python 
RUN pip install rtpipe sdmreader sdmpy pwkit pyfftw

COPY jupytercustomcss /.jupyter/custom

CMD jupyter notebook --notebook-dir=/home --no-browser --ip=0.0.0.0
EXPOSE 8888

