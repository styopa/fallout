#!/bin/bash
hamming() {
  for (( I=0; $I < ${#1}; I++)) {
    if [[ "${1:$I:1}" == "${2:$I:1}" ]]; then
      let N++
    fi
  }

  echo "$N"
}
