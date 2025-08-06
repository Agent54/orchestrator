#!/bin/bash

git remote set-url sync /git-sync/$1 2>/dev/null || git remote add sync /git-sync/$1

if [ ! -d "/git-sync/$1/HEAD" ]; then
    git init --bare /git-sync/$1
    git -C /git-sync/$1 config receive.shallowUpdate true
    git -C /git-sync/$1 config receive.allowShallowUpdate true
fi
