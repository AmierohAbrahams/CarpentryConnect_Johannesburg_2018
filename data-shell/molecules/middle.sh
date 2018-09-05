# This script script prints the first $2 lines and then takes the last five lines

head -n $2 $1 | tail -n 5
