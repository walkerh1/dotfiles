#!/bin/bash

for item in *; do
	if [ -d "$item" ]; then
		stow --adopt "$item"
	fi
done

git reset --hard
