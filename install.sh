#!/bin/bash

if [ ! -f ~/.spacemacs ]; then
    ln -s $(pwd)/.spacemacs ~/.spacemacs
fi

if [ ! -f ~/.emacs.d/private/rae-auto-save ]; then
    ln -s $(pwd)/private/rae-auto-save ~/.emacs.d/private/
fi
