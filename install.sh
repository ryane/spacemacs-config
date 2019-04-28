#!/bin/bash

if [ ! -e ~/.spacemacs ]; then
    ln -s $(pwd)/.spacemacs ~/.spacemacs
fi

if [ ! -e ~/.emacs.d/private/rae-org ]; then
    ln -s $(pwd)/private/rae-org ~/.emacs.d/private/
fi

if [ ! -e ~/.emacs.d/private/rae-font-size ]; then
    ln -s $(pwd)/private/rae-font-size ~/.emacs.d/private/
fi
