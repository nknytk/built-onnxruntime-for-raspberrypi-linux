## About this repository

[ONNX Runtime](https://github.com/microsoft/onnxruntime) is a cross-platform, high performance scoring engine for ML models. You can get Python bindings for Linux, Windows, Mac on x64 and arm64 platform from [pypi](https://pypi.org/project/onnxruntime/#files). The project does not provide pre-built packages for Raspbery Pi Linux 32bit (ARM32v7) as of today. Instead it has an instruction on [how to build ONNX Runtime from the source code](https://github.com/microsoft/onnxruntime/blob/master/BUILD.md).

Building package takes a lot of time. This repository provides pre-built Python ONNX Runtime packages for Raspberry pi for convenience.

There is NO WARRANTY of any kind at all.

## Files

### wheels/

This directory has built packages.

* wheels/stretch/
    - built packages for Raspbian Stretch
* wheels/buster/
    - built packages for Raspbian Buster or Raspberry Pi OS

---

Wheels are built on Raspberry Pi with [this procedure](./BUILD.md) since v1.6.0.  
Building ONNX Runtime wheel for Raspberry Pi 32bit on Docker with Qemu stopped working since 2020 summer.
### build.sh

A script to build ONNX Runtime wheels for armv7-linux on Docker with Qemu.  
It builds wheels for Python 3.5, 3.6, 3.7 and 3.8.  
You need docker to run it.

Usage:
```
$ sudo ./build.sh
```

### Dockerfile-arm32v7.template

A Dockerfile template used in build.sh.
