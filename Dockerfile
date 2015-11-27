# Builds rtpipe, pwkit and all dependencies with conda for use in ipython notebook
# option 1
#FROM continuumio/anaconda:latest

# option 2
FROM andrewosh/binder-base

USER root  # opt 2

#RUN apt-get install -y debian-archive-keyring  # opt 1
#RUN apt-key update -y   # opt 1

RUN apt-get update && apt-get install -y libfftw3-bin libfftw3-dev python-pip gcc
#RUN conda install -y ncurses  # opt 1
RUN conda install -y -c pkgw casa-data casa-python 
RUN pip install rtpipe sdmreader sdmpy pwkit pyfftw

USER main  # opt 2

WORKDIR /ipynb
CMD ipython notebook --no-browser --ip=0.0.0.0
EXPOSE 8888

