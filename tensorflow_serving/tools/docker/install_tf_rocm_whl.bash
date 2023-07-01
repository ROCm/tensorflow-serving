#!/bin/bash

TF_REPO="https://pypi.org"
TF_VERS_TO_POST_INSTALL="2.13.0"
TF_VERS_SUBSCRIPT=$( \
                    basename $ROCM_PATH | \
                    cut -d "-" -f2 | \
                    tr -d "." || \
                    true \
    ) && \
    python3 -m pip uninstall -y tensorflow-gpu tensorflow-estimator keras keras-nightly && \
    python3 -m pip install tensorflow-rocm==${TF_VERS_TO_POST_INSTALL}.${TF_VERS_SUBSCRIPT} -f ${TF_REPO} || \
        (echo "tensorflow-rocm is not installed correctly" && exit 2)
