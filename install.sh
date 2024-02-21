# apt-get update
# apt-get install -y build-essential cmake git pkg-config libgtk-3-dev \
# libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
# libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
# gfortran openexr libatlas-base-dev python3-dev python3-numpy \
# libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev \
# libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev
# apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav -y
# apt-get install -y libgtk-3-dev libgtk2.0-dev pkg-config

# mkdir opencv_build && cd opencv_build
# apt-get install git -y
# apt-get install build-essential -y
# git clone https://github.com/opencv/opencv.git
# git clone https://github.com/opencv/opencv_contrib.git

cd opencv_build/opencv
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/opt/conda \
      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=OFF \
      -D WITH_OPENGL=ON \
      -D WITH_GTK=ON \
      -D OPENCV_GENERATE_PKGCONFIG=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/workspace/gstreamer/opencv_build/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      -D WITH_GSTREAMER=ON \
      -D PYTHON3_EXECUTABLE=/opt/conda/bin/python \
      -D PYTHON3_INCLUDE_DIR=/opt/conda/include/python3.10 \
      -D PYTHON3_LIBRARY=/opt/conda/lib/libpython3.10.so \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/opt/conda/lib/python3.10/site-packages/numpy/core/include \
      -D PYTHON3_PACKAGES_PATH=/opt/conda/lib/python3.10/site-packages ..

make -j$(nproc)
make install

# pkg-config --modversion opencv4

