#!/bin/bash

ZOOMPATH={{zoom_path}}
UUID=$(find "{{zoom_path}}" -type f -not -name ".*" | head -n1 | awk -F: '{print $1}')
RECENTFILE=$(find "{{downloads_path}}" -type f -exec stat -f "%m %N" {} \; | sort -rn | head -n1 | awk -F/ '{print $NF}')
BGPATH="{{downloads_path}}/$RECENTFILE"

echo "Moving $BGPATH to $UUID"
cp -R "$BGPATH" "$UUID"
