#!/bin/sh

pushd /workspace

git clone https://gitlab.com/gbraad/ceph-atomic.git \
    -b downstream \
    --depth 1 \
    ceph-atomic

rpm-ostree compose tree \
    --repo=/srv/repo \
    ./ceph-atomic/ceph-atomic-host.json

rm -rf /svr/repo/tmp/

popd
