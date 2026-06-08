FROM osrf/ros:noetic-desktop

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    nano \
    python3-pip \
    python3-catkin-tools \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    ros-noetic-navigation \
    ros-noetic-map-server \
    ros-noetic-amcl \
    ros-noetic-slam-gmapping \
    ros-noetic-teleop-twist-keyboard \
    ros-noetic-xacro \
    ros-noetic-robot-state-publisher \
    ros-noetic-joint-state-publisher \
    ros-noetic-joint-state-publisher-gui \
    ros-noetic-tf \
    ros-noetic-tf2-ros \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
RUN echo "source /root/garcom_ws/devel/setup.bash" >> /root/.bashrc
RUN echo "export DISPLAY=:0" >> /root/.bashrc
RUN echo "export QT_X11_NO_MITSHM=1" >> /root/.bashrc
RUN echo "export LIBGL_ALWAYS_SOFTWARE=1" >> /root/.bashrc

WORKDIR /root/garcom_ws

CMD ["bash"]
