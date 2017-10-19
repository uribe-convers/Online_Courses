#!/bin/sh
awk '
BEGIN { printf "Sr No\tName\tSub\tMarks\n" }
{ a+=$4; print $0 "\n" }
END { printf "No hay cama para tanta gente!\n Total count = ", a }
'
