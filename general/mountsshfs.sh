#!/bin/bash

# MOUNTS sshfs hosts

# use $sudo umount ~/sshfs/*
# to unmount everything

LIST="ctrl-c.club pi cloudbox coxeter"

for d in $LIST; do
    read -p "Do you want to mount $d (Y/[N])?" answer
    case $answer in
    		# -a archive -v verbose -z compress -L copy a symlink as its referent
		# -L is useful for keeping a local file that gets split to multiple remote files.
	[Yy]* ) sshfs $d:/home/pgadey/ /home/pgadey/sshfs/$d/;;
        * ) echo "Not mounting $d.";;
    esac
done

