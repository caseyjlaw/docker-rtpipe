FROM continuumio/anaconda

RUN apt-get update && apt-get install -y libfftw3-bin libfftw3-dev python-pip gcc
RUN conda install -y -c pkgw casa-data casa-python
RUN pip install rtpipe realfast sdmreader sdmpy
