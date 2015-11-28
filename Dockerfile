FROM andrewosh/binder-base

MAINTAINER Casey Law <caseyjlaw@gmail.com>

USER root

RUN apt-get update

RUN apt-get install -y libfftw3-bin libfftw3-dev

USER main

RUN conda install -y -c pkgw casa-data casa-python 

RUN pip install rtpipe sdmreader sdmpy pwkit pyfftw

