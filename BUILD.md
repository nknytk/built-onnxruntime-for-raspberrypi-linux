# How to build onnxruntime on Raspberry Pi

## Update

```
$ sudo apt update
$ sudo apt upgrade
$ sudo reboot
```

## Install build tools and dependencies

```
$ sudo apt install git build-essential libcurl4-openssl-dev libssl-dev libatlas-base-dev cmake
$ sudo apt install tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev libv4l-dev
```

## Install python

This is a Python 3.8.6 example. You can use other Python versions.

```
$ wget https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tgz
$ tar zxf Python-3.8.6.tgz
$ cd Python-3.8.6
$ ./configure --enable-optimizations --with-lto --enable-shared --prefix=/opt/python3.8 LDFLAGS=-Wl,-rpath,/opt/python3.8/lib
$ make
$ sudo make altinstall
```

## Install numpy

```
$ sudo /opt/python3.8/bin/pip3.8 install --upgrade pip wheel
$ sudo /opt/python3.8/bin/pip3.8 install numpy
```

## Build ONNX Runtime

```
$ cd
$ git clone --single-branch --branch v1.6.0 --recursive https://github.com/Microsoft/onnxruntime onnxruntime
$ cd onnxruntime
$ sed "s/python3/\/opt\/python3.8\/bin\/python3.8/" build.sh > build38.sh
$ chmod +x build38.sh
$ ./build38.sh --use_openmp --config MinSizeRel --arm --update --build --build_shared_lib --build_wheel
```

## Check built wheel file

```
$ ls build/Linux/MinSizeRel/dist/
```
