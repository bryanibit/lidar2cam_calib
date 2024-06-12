FROM	ubuntu:20.04
# Ubuntu sides with libav, I side with ffmpeg.
#RUN	echo "deb http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu quantal main" >> /etc/apt/sources.list
#RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1DB8ADC1CFCA9579
WORKDIR /app
ARG DEBIAN_FRONTEND=noninteractive #This way DEBIAN_FRONTEND will be defined only while you build your image while TZ will persist at runtime.
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone  && \
    apt-get update && apt-get install -y \
		# INSTALL THE DEPENDENCIES
		# Build tools:	
		build-essential \
		cmake \
		# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
		qt5-default \
		# Media I/O:libvtk6-dev 
		zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev \
		# Media I/O:
		libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev \
		# pangolin
		libgl1-mesa-dev libglew-dev libpython2.7-dev \
		# ffmpeg
		ffmpeg x264 x265 \
		# Parallelism and linear algebra libraries:
		libtbb-dev libeigen3-dev \
		# Python:
		python-dev python-tk python-numpy python3-dev python3-tk python3-numpy \
		# Java:
		ant default-jdk \
		# Documentation:
		doxygen \
		# Others
		unzip wget vim git \
		# For Lidar driver
		libpcap-dev libjsoncpp-dev libboost-dev \
		# intstall opencv 4.2
		libopencv-dev \
		# pcl 1.10
		libpcl-dev
#COPY	add_dnet.sh .	
#COPY	dnet.zip .
COPY	build_pangolin_0.6.sh .
#RUN	/bin/sh ./add_dnet.sh
# install pangolin 0.6
RUN	/bin/sh ./build_pangolin_0.6.sh
