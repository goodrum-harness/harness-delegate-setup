#!/bin/sh
set -e
PACKAGES="gcc python39-pip python39-devel"
microdnf install ${PACKAGES}
microdnf clean all
