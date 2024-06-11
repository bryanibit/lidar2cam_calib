#/usr/bin sh
wget https://github.com/stevenlovegrove/Pangolin/archive/refs/tags/v0.6.zip
unzip v0.6.zip
rm v0.6.zip
mv Pangolin-0.6/ Pangolin
cd Pangolin
mkdir build
cd build
# to build WITH CUDA remove option -D WITH_CUDA=OFF
cmake -D CMAKE_BUILD_TYPE=RELEASE ..
make -j4
make install
ldconfig
