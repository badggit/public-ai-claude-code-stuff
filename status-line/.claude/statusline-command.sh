#!/bin/bash
# Parses JSON from stdin without jq and outputs last folder name, color-coded context usage (K tokens), model, and effort
input=$(cat)

cwd=$(echo "$input" | grep -o '"cwd":"[^"]*"' | head -1 | sed 's/"cwd":"//;s/"$//')
ctx_size=$(echo "$input" | grep -o '"context_window_size":[0-9]*' | head -1 | sed 's/"context_window_size"://')
used_pct=$(echo "$input" | grep -o '"used_percentage":[0-9]*' | head -1 | sed 's/"used_percentage"://')
model_name=$(echo "$input" | grep -o '"display_name":"[^"]*"' | head -1 | sed 's/"display_name":"//;s/"$//')
effort=$(echo "$input" | grep -o '"effort":"[^"]*"' | head -1 | sed 's/"effort":"//;s/"$//')

folder=$(basename "$cwd")

status="\033[01;34m${folder}\033[00m"

if [ -n "$ctx_size" ] && [ -n "$used_pct" ]; then
  used_k=$(( ctx_size * used_pct / 100000 ))
  if [ "$used_k" -le 150 ]; then
    color="\033[01;32m"
  elif [ "$used_k" -le 190 ]; then
    color="\033[01;33m"
  else
    color="\033[01;31m"
  fi
  status="${status}  ${color}${used_k}K\033[00m"
fi

if [ -n "$model_name" ]; then
  model_display="${model_name}"
  if [ -n "$effort" ]; then
    model_display="${model_display} (${effort})"
  fi
  status="${status}  \033[00;36m${model_display}\033[00m"
fi

printf "$status"
