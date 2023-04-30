# machine build from base image and working directory
FROM gcr.io/deeplearning-platform-release/base-cpu:latest
WORKDIR root

# install pre reqs
RUN sudo apt update -y
RUN sudo apt-get install gfortran -y
RUN sudo apt-get install gcc -y
RUN sudo apt-get install mpich -y

# downloads latest version of QE DFT code
RUN sudo git clone https://github.com/QEF/q-e.git

#copies tutorial files and required pseudopotentials
COPY SSSP_pseudos root/q-e
COPY si.in root/q-e
COPY al.in root/q-e

# configures and makes QE
RUN cd q-e
RUN sudo ./q-e/configure
RUN cd q-e; make all
RUN cd ../../root/q-e
