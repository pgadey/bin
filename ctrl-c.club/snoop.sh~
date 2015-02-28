#!/bin/bash

cut -d":" -f1 /etc/passwd | tail -n +25 | perl -ne '{$comm = "finger $_"; print `$comm`, "\n\n\n"}'
