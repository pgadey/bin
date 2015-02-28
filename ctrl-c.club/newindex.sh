#!/bin/bash

#LIST=`stat --format=%Z\ %n /home/*/public_html/* | sort`
#find /home/*/public_html/* *.html
LIST=`stat --format=%Z\ %n /home/*/public_html/*.html | grep -v updated | sort --reverse`

echo "$LIST"

#HEAD=`echo "$LIST" | head`
#echo "$HEAD"
