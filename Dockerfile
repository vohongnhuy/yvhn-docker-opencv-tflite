FROM python:3.7

RUN apt-get -y update
RUN apt-get -y upgrade

WORKDIR /tfliteapp

RUN apt-get install -y git
RUN apt install libatlas3-base libgfortran5
RUN pip3 install https://www.piwheels.org/simple/numpy/numpy-1.20.2-cp37-cp37m-linux_armv7l.whl
RUN apt-get -y install libaom0 libatk-bridge2.0-0 libatk1.0-0 libatlas3-base libatspi2.0-0 libavcodec58 libavformat58 libavutil56 libbluray2 libcairo-gobject2 libcairo2 libchromaprint1 libcodec2-0.8.1 libcroco3 libdatrie1 libdrm2 libepoxy0 libfontconfig1 libgdk-pixbuf2.0-0 libgfortran5 libgme0 libgraphite2-3 libgsm1 libgtk-3-0 libharfbuzz0b libilmbase23 libjbig0 libmp3lame0 libmpg123-0 libogg0 libopenexr23 libopenjp2-7 libopenmpt0 libopus0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpixman-1-0 librsvg2-2 libshine3 libsnappy1v5 libsoxr0 libspeex1 libssh-gcrypt-4 libswresample3 libswscale5 libthai0 libtheora0 libtiff5 libtwolame0 libva-drm2 libva-x11-2 libva2 libvdpau1 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx5 libwavpack1 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwebp6 libwebpmux3 libx264-155 libx265-165 libxcb-render0 libxcb-shm0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxinerama1 libxkbcommon0 libxrandr2 libxrender1 libxvidcore4 libzvbi0
RUN pip3 install https://www.piwheels.org/simple/opencv-python/opencv_python-4.4.0.40-cp37-cp37m-linux_armv7l.whl
RUN pip3 install https://github.com/google-coral/pycoral/releases/download/v1.0.1/tflite_runtime-2.5.0-cp37-cp37m-linux_armv7l.whl
RUN git clone https://github.com/vohongnhuy/yvhn-docker-opencv-tflite && ls
ENTRYPOINT ["python3", "yvhn-docker-opencv-tflite/TF.py", "--modeldir=yvhn-docker-opencv-tflite/coco_ssd_mobilenet_v1_1.0_quant_2018_06_29/", "--threshold=0.65", "--resolution=1920x1080"]

