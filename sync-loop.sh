#!/bin/bash

# Default to both if no argument provided
operation=${1:-both}

while true; do
    if [[ "$operation" == "fetch" || "$operation" == "both" ]]; then
        jj git fetch --remote sync
    fi
    
    if [[ "$operation" == "push" || "$operation" == "both" ]]; then
        jj git push --remote sync --allow-empty-description --all
    fi
    
    sleep 3
done
