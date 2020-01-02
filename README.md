## About this repository

[ONNX Runime](https://github.com/microsoft/onnxruntime) is a cross-platform, high performance scoring engine for ML models. You can get Python bindings for Linux, Wiwndow, Mac on x64 platform from [pypi](https://pypi.org/project/onnxruntime/#files). The porject does not provide pre-built packages for Raspbery Pi Linux (ARM32v7) as of today. Instead it has an instruction on [how to build ONNX Runtime from the source code](https://github.com/microsoft/onnxruntime/blob/master/BUILD.md).

Building pagckage takes a lot of time. Furthermore [you need a bit of modification to the source](https://github.com/microsoft/onnxruntime/issues/1256#issuecomment-515504717). 
This repository provides pre-built Python ONNX Runtime packages for Raspberry pi for convinience.

There is NO WARRANTY of any kind at all.

## Files

### Dockerfiles

This directory has Dockerfiles to build wheels.

### wheels

This directory has built packages.
