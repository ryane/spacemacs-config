#!/bin/bash

if [ ! -e ~/.spacemacs ]; then
    ln -s $(pwd)/.spacemacs ~/.spacemacs
fi

if [ ! -e ~/.emacs.d/private/rae-auto-save ]; then
    ln -s $(pwd)/private/rae-auto-save ~/.emacs.d/private/
fi

if [ ! -e ~/.emacs.d/private/jsonnet ]; then
    ln -s $(pwd)/private/jsonnet ~/.emacs.d/private/
fi
