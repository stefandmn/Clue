#!/bin/bash

usage() {
  printf "Usage:\n  $0 <old pattern> <new name or pattern>\n"
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
fi

oldpattern="$1"
newpattern="$2"

for file in $(find . -type f -name "$oldpattern"); do
    mv $file $(dirname "$file")/$newpattern
done

