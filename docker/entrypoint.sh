#!/bin/sh

# Create log file
if [ ! -f "/var/log/wikmd.log" ]
then
  touch /var/log/wikmd.log
fi

# if /wiki isn't mounted create it
if [ ! -d "/wiki" ]
then
  # create directories
  mkdir -p /wiki
fi

# If /wiki exists and is empty, populate it with the examples
if [ -d "/wiki" ] && [ ! "$(ls -A /wiki)" ]
then
  # copy examples
  cp /app/wikmd/wiki/*.md /wiki/.
fi

# Start wikmd
python3 /app/wikmd/wiki.py

