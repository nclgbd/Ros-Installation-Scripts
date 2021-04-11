#!/bin/bash

echo "Adding Dependencies"
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
rosdep init
rosdep update
# rosdep install turtlesim

echo "Setting up Workspace"
#Setup default Catkin WorkSpace
mkdir -p ~/workspaces/src
cd ~/workspaces/src
catkin_init_workspace
cd ~/workspaces/
catkin_make

#Add the WorkSpace to the ROS environment
echo "source ~/workspaces/devel/setup.bash" >> ~/.bashrc
cd ~/workspaces/src
git clone https://github.com/ros/ros_tutorials.git
cd ..
catkin_make

# export ROS_MASTER_URI=http://listener:11311

echo "ROS is set up to run."