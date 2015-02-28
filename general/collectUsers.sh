#!/bin/bash
echo "`date +%Y.%m.%d-%T` `who | cut -d" " -f1 | uniq | wc -l`" >> users.data
