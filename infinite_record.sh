#!/bin/bash

while true
do
	tmpfile=$(tempfile --suffix=.mid)
	./arecordmidi -p 24 -T 10000 $tmpfile

	if [ -f $tmpfile ]
	then
		outfile=$(date +arecordmidi-%Y-%m-%d-%H:%M:%S.mid)
		mv $tmpfile ~/midi/$outfile
	else
		rm $tmpfile
		sleep 5
	fi
done

