#!/bin/bash
# check if owner of /home/user is correctly set to `user`, if not fix it
if [ $( ls -al /home/  | grep user | awk '{print $3}') != "user" ]; then
    chown -R user:user /home/user
fi
