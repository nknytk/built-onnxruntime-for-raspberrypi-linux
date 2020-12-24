#!/bin/bash

set -e

onnxruntime_ver=1.4.0
for pyver in 5 6 7 8; do
  cat Dockerfile-arm32v7.template | sed "s/PYTHON_MINOR_VERSION/${pyver}/" | sed "s/ONNXRUNTIME_VERSION/${onnxruntime_ver}/" > Dockerfile
  docker build --rm=true -t onnxruntime-arm32v7-3${pyver}:${onnxruntime_ver} .

  set +e
  docker run --name distc -v $(pwd)/built_wheels:/built_wheels --entrypoint "cross-build-start" onnxruntime-arm32v7-3${pyver}:${onnxruntime_ver}
  filename1=onnxruntime-${onnxruntime_ver}-cp3${pyver}-cp3${pyver}m-linux_armv7l.whl
  filename2=onnxruntime-${onnxruntime_ver}-cp3${pyver}-cp3${pyver}-linux_armv7l.whl
  #docker cp distc:/code/onnxruntime/build/Linux/MinSizeRel/dist/${filename1} /tmp
  docker cp distc:/code/onnxruntime/build/Linux/MinSizeRel/dist/${filename2} /tmp
  mv /tmp/snap.docker/tmp/${filename1} wheels/${os_code}/
  mv /tmp/snap.docker/tmp/${filename2} wheels/${os_code}/
  #docker cp distc:/code/onnxruntime/build/Linux/MinSizeRel/dist/${filename1} /tmp/
  #docker cp distc:/code/onnxruntime/build/Linux/MinSizeRel/dist/${filename2} /tmp/
  #mv /tmp/${filename1} wheels/buster/
  #mv /tmp/${filename2} wheels/buster/
  set -e

  docker rm distc
  docker rmi onnxruntime-arm32v7-3${pyver}:${onnxruntime_ver}
done
