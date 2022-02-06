# !/usr/bin/env bash
git branch -D $1
git branch -dr origin/$1
git push origin --delete $1
