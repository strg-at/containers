#!/bin/bash

printf "\e[1;35m%-6s\e[m\n" "configure ownership and permissions..."

chown -R user:user /home/user
runuser user -c "chmod -R 755 /home/user"

printf "\e[1;35m%-6s\e[m\n" "setup nix package manager..."
printf "\e[1;34m%-6s\e[m\n" "... wait for Startup complete before continuing."

runuser user -c "sh <(curl -L https://nixos.org/nix/install) --no-daemon" > /dev/null 2>&1
runuser user -c "echo 'source /home/user/.nix-profile/etc/profile.d/nix.sh' >> \$HOME/.bashrc"
