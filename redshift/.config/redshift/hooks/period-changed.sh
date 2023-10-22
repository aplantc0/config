#!/bin/sh

# if execusion is prevented
# https://github.com/jonls/redshift/issues/850

case $1 in
    period-changed)
        exec notify-send "Redshift" "Period changed to $3"
esac

