#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# This script builds Impala from scratch. It is known to work on Ubuntu 14.04. To run it
# you need to have:
#
# 1. At least 8GB of free disk space
# 4. A connection to the internet (parts of the build download dependencies)
#
# To bootstrap a more complete development environment that includes not only building
# Impala but also running and testing it, see bootstrap_development.sh in this directory.

# Set up some logging and exit conditions:
set -euxo pipefail

# Install dependencies:
sudo apt-get update
sudo apt-get --yes install g++ gcc git libsasl2-dev libssl-dev make maven openjdk-7-jdk \
    python-dev python-setuptools

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
./buildall.sh -notests -so
