#!/bin/bash

set -xe

git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256
