#!/bin/bash
set -e

#### Install more services than regular ones
apt-get update; \
apt-get install -y --no-install-recommends \
  vim \
  && rm -rf /var/lib/apt/lists/*