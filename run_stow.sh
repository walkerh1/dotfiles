#!/usr/bin/env bash

for item in *; do
	if [[ -d "$item" ]]; then
		stow "$item"
	fi
done
