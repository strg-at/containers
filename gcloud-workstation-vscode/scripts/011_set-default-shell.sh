#!/usr/bin/bash

# Set the default shell to zsh for both user and root users
chsh -s $(which zsh) root || true
chsh -s $(which zsh) user || true
