#!/bin/bash

set -xe

echo "ARCH: $ARCH ..."

# install using pip from the whl files on PyPI

if [ `uname` == Darwin ]; then
    # CPython 3.9+ macOS 11.0+ ARM64
    WHL_FILE=runtimed-${PKG_VERSION}-cp39-abi3-macosx_11_0_arm64.whl
    curl -Lso "$WHL_FILE" https://pypi.org/packages/cp39/r/runtimed/runtimed-${PKG_VERSION}-cp39-abi3-macosx_11_0_arm64.whl
fi

# Dead code for Linux x86-64 on future builds when MANYLINUX is available
if [ `uname` == Linux ]; then
    # CPython 3.9+ manylinux: glibc 2.39+ x86-64
    WHL_FILE=https://pypi.org/packages/cp39/r/runtimed/runtimed-${PKG_VERSION}-cp39-abi3-manylinux_2_39_x86_64.whl
fi

$PYTHON -m pip install --no-deps --no-build-isolation -vvv $WHL_FILE