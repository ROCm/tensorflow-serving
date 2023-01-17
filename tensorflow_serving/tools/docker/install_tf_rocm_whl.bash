#!/bin/bash

TF_REPO="https://pypi.org"
TF_VERS_SUBSCRIPT=$( \
                    basename $ROCM_PATH | \
                    cut -d "-" -f2 | \
                    tr -d "." || \
                    true \
    ) && \
    pip3 uninstall -y tensorflow-gpu tensorflow-estimator keras keras-nightly && \
    pip3 install tensorflow-rocm==2.10.0.${TF_VERS_SUBSCRIPT} -f ${TF_REPO} || true
