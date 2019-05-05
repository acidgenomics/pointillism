#!/bin/bash

# Consider adding a step to check for hdf5 version, and skipping this step to
# speed up the build time.
if [[ "$TRAVIS_OS_NAME" == "linux" ]]
then
    wd="$PWD"
    cd ..
    wget "${HDF5_RELEASE_URL}/hdf5-${HDF5_VERSION%.*}/hdf5-${HDF5_VERSION}/src/hdf5-${HDF5_VERSION}.tar.gz"
    tar -xzf "hdf5-${HDF5_VERSION}.tar.gz"
    cd "hdf5-${HDF5_VERSION}"
    ./configure --prefix=/usr/local
    sudo make install
    cd "$wd"
    unset -v wd
fi
