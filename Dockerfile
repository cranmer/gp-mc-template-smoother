FROM andrewosh/binder-base
MAINTAINER Cyril Becot <cyril.becotNOSPAM@cern.ch>
USER root

# Add george & its dependencies
RUN apt-get update
RUN apt-get install -y build-essential
RUN conda update anaconda 
RUN conda update numpy
RUN apt-get install -y libeigen3-dev
RUN apt-get install -y git
RUN pip install --upgrade pip


RUN git clone https://github.com/dfm/george.git
RUN cd george && git submodule init && git submodule update && python setup.py install
# to avoid token issue
RUN mkdir -p $HOME/.jupyter
RUN echo "c.NotebookApp.token = ''" >> $HOME/.jupyter/jupyter_notebook_config.py

