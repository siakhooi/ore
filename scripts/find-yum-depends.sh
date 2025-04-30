#!/bin/bash

programs=(
  find
  sed
  column
  highlight.red
  highlight.green
  echo.error
  is-true
  sort
  printf
  mkdir
  touch
  dirname
  echo
  basename
  yq
  jv
  jq
)

for program in "${programs[@]}"; do
  yum provides "$program"
done
