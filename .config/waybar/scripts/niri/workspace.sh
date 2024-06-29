#!/usr/bin/env sh
niri msg -j workspaces |
  jq --arg monitor "$1" '.[] | select(.output == $monitor and .is_active) | if .name != null then .name else .idx end'
