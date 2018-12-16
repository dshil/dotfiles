# !/bin/bash

sudo dnf install \
                readline-devel \
                qt5-qtwebkit-devel \
                libXScrnSaver-devel \
                qt5-qtsvg \
                sqlite-devel \
                qt5-qtx11extras-devel

echo "export QMAKE=/usr/bin/qmake-qt5" >> ~/.bashrc

cd $HOME/src/toggldesktop

make deps
make
make run
make test
make uitest
