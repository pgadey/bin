#!/bin/bash

# Open an instance of Zathura (resp. Evince) for each PDF (resp. DJVU) in the ReadingMaterial folder.
FILES="$HOME/read/*" 

for f in $FILES
do
	if [[ $f =~ (djvu|pdf)$ ]]
	then
		#echo "PDF: $f"
		#There is a weird Heisenbug 
		# if we leave out the sleep
		sleep 0.2
	        i3-msg exec --no-startup-id zathura $f &
	fi

	#if [[ $f =~ djvu$ ]]
	#then
	#	#echo "DJVU: $f"
	#        evince $f &
	#fi
done
