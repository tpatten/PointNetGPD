 # docker build -t ubuntu1604py36
#FROM ubuntu:16.04
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN rm -rf /var/lib/apt/lists/* \
    /etc/apt/sources.list.d/cuda.list \
    /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && \
    apt-get install -y software-properties-common vim
    
RUN apt-get update -y

RUN apt-get install -y build-essential python3 python3-pip && \
    apt-get install -y git apt-utils
    
RUN apt install -y libgoogle-glog-dev

# ==================================================================
# update pip
# ------------------------------------------------------------------ 
#RUN python3 -m pip3 install pip --upgrade
RUN pip3 install --upgrade setuptools pip
    
# ==================================================================
# python
# ------------------------------------------------------------------    
#RUN pip3 install scipy \
RUN python3 -m pip install scipy \
                 h5py \
                 numpy \
                 matplotlib \
                 NearPy \
                 Pillow \
                 python-dateutil \
                 PyYAML \
                 scikit-image \
                 scikit-learn \
                 six \
                 trimesh \
                 pyhull \
                 cvxopt \
                 pandas \
                 pyquaternion \
                 numba \
                 autolab-core \
                 autolab-perception \
                 torch>=0.4.1 \
                 tensorboardX \
                 sklearn \
                 dill
                             
# ==================================================================
# tools
# ------------------------------------------------------------------    
RUN apt-get install -y libsm6 libxext6 libxrender-dev
RUN apt-get install -y python3-tk

# ==================================================================
# ROS
# ------------------------------------------------------------------ 
#RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' && \
#    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
#    apt-get update && apt-get install -y --allow-unauthenticated ros-kinetic-desktop && \
#    apt-get install -y --allow-unauthenticated python-rosinstall python-rosdep python-vcstools python-catkin-tools && \
#    apt-get install -y --allow-unauthenticated ros-kinetic-tf2-geometry-msgs
    
# bootstrap rosdep
#RUN rosdep init
#RUN rosdep update

#RUN pip install rospkg

# ==================================================================
# PCL
# ------------------------------------------------------------------    
#RUN apt-get install -y libpcl1.7 libpcl-dev
#RUN pip3 install python-pcl
    
# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
RUN ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/* 

