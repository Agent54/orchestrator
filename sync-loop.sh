#!/bin/bash

# Default to both if no argument provided
operation=${1:-fetch}

while true; do
    if [[ "$operation" == "fetch" || "$operation" == "both" ]]; then
        jj git fetch --remote sync 2>&1 | grep -v -E "(Nothing changed\.|Nothing to fetch|Already up to date)"
    fi
    
    if [[ "$operation" == "push" || "$operation" == "both" ]]; then
        jj git push --remote sync --allow-empty-description --all 2>&1 | grep -v -E "(Nothing changed\.|Nothing to push|Everything up-to-date)"
    fi
    
    sleep 3
done
