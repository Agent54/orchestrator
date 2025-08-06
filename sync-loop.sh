while true; do
    jj git fetch --remote sync         
    jj git push --remote sync --allow-empty-description --all
    sleep 3
done
