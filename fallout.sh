#!/bin/bash
hamming() {
  for (( I=0; $I < ${#1}; I++)) {
    if [[ "${1:$I:1}" == "${2:$I:1}" ]]; then
      let N++
    fi
  }

  echo "$N"
}

if [[ $# < 3 ]]; then
  echo "Too few arguments: $#" >&2
  echo "USAGE: $0 PASSWORD PASSWORD PASSWORD..."
  exit 1
fi

for PASSWORD in $@; do
  if [[ ${#PASSWORD} != ${#1} ]]; then
    echo "Passwords are of different length: '$1' and '$PASSWORD'" >&2
    exit 2
  fi
done
