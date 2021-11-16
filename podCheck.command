#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

set -e

# Checking lib lint
pod lib lint

# Checking spec lint
pod spec lint
