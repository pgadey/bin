#!/bin/bash

LIST="cloudbox tilde.works ctrl-c.club"

for d in $LIST; do
    read -p "Do you want to synch $d (Y/[N])?" answer
    case $answer in
    		# -a archive -v verbose -z compress -L copy a symlink as its referent
		# -L is useful for keeping a local file that gets split to multiple remote files.
        [Yy]* ) rsync -avzL -e ssh $HOME/public/$d/ $d:$HOME/public_html/;; 
        * ) echo "Not syncing $d.";;
    esac
done

