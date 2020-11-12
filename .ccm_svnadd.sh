#!/bin/bash

usage() {
  printf "Usage:\n  $0 <pattern>\n"
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

pattern="$1"

for file in $(find . -type f -name "$pattern"); do
    svn add $file
done

