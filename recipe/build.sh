#!/bin/bash
set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

mkdir build
cd build

cmake .. ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DWEBP_BUILD_CWEBP:BOOL=ON \
    -DWEBP_BUILD_DWEBP:BOOL=ON \
    -DWEBP_BUILD_EXTRAS:BOOL=OFF \
    -DWEBP_BUILD_GIF2WEBP:BOOL=ON \
    -DWEBP_BUILD_IMG2WEBP:BOOL=ON \
    -DWEBP_BUILD_LIBWEBPMUX:BOOL=ON \
    -DWEBP_BUILD_VWEBP:BOOL=ON \
    -DWEBP_BUILD_WEBP_JS:BOOL=OFF \
    -DWEBP_BUILD_WEBPINFO:BOOL=ON \
    -DWEBP_BUILD_WEBPMUX:BOOL=ON \
    -DWEBP_LINK_STATIC:BOOL=OFF \

cmake --build .

cmake --install .
