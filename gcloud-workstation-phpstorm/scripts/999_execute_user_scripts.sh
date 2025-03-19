#!/usr/bin/bash

# On purpose not set with the error flag as we do not want to block the workstation startup
# If any script fails to execute, it's the responsability of the user to fix it

for script in /home/user/scripts/*.sh; do
    if [ -f "$script" ]; then
        echo "Executing user script: %s\n\r" "$script"
        bash "$script"
    fi
done
