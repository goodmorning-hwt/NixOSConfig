mkdir -p ~/limx_ws/src
cd ~/limx_ws/src
git clone https://github.com/limxdynamics/pointfoot-sdk-lowlevel.git

cd ~/limx_ws/src
git clone https://github.com/limxdynamics/pointfoot-gazebo-ros.git

cd ~/limx_ws/src
git clone https://github.com/limxdynamics/robot-description.git

cd ~/limx_ws/src
git clone https://github.com/limxdynamics/robot-visualization.git

cd ~/limx_ws
catkin_make install









