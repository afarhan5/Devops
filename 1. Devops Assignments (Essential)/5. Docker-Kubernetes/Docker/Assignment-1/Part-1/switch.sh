#!/bin/bash

HOUR=$(date +"%H")

if [[ "$HOUR" -ge 10 && "$HOUR" -lt 12 ]]; then
  cp /html/index-1.html /usr/share/nginx/html/index.html
elif [[ "$HOUR" -ge 14 && "$HOUR" -lt 23 ]]; then
  cp /html/index-2.html /usr/share/nginx/html/index.html
else
  echo "<h1>Service Unavailable</h1>" > /usr/share/nginx/html/index.html
fi
