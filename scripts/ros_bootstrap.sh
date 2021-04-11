#!/bin/bash
echo "Running startup script"
source startup.sh

echo "Setting up sources.list"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "Setting up keys"
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo "Updating Debian Package Index"
sudo apt update

echo "Installing ROS (Bare Bones)"
sudo apt install ros-noetic-desktop-full -y

echo "Setting up Environment"
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

source dependencies.sh
