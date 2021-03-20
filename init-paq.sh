#!/bin/sh
git clone https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim

echo "This config was init thanks to this blog: https://oroques.dev/notes/neovim-init/"
