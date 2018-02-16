#!/bin/bash
hamming() {
  N=0
  for (( I=0; $I < ${#1}; I++)); do
    if [[ "${1:$I:1}" == "${2:$I:1}" ]]; then
      let N++
    fi
  done

  echo "$N"
}

if [[ $# < 3 ]]; then
  echo "Too few arguments: $#" >&2
  echo "USAGE: $0 PASSWORD PASSWORD PASSWORD..."
  exit 1
fi

PASSWORDS=(${@,,})
for PASSWORD in "${PASSWORDS[@]}"; do
  if [[ ${#PASSWORD} != ${#PASSWORDS[0]} ]]; then
    echo "Passwords are of different length: '${PASSWORDS[0]}' and '$PASSWORD'" >&2
    exit 2
  fi
done

for (( I=0; I < $#; I++ )); do
  echo 'Enter password and number of correct letters'
  read -p '> ' ENTERED CORRECT
  ENTERED="${ENTERED,,}"

  FOUND=
  for I in "${!PASSWORDS[@]}"; do
    if [[ "${PASSWORDS[$I]}" == "$ENTERED" ]]; then
      FOUND=1
      break
    fi
  done
  if [[ -z "$FOUND" ]]; then
    echo "$ENTERED is not in the list of possible passwords" >&2
    exit 3
  fi

  for J in "${!PASSWORDS[@]}"; do
    H=$(hamming "${PASSWORDS[$J]}" "$ENTERED")
    if [[ $H != $CORRECT ]]; then
      unset PASSWORDS[$J]
    fi
  done

  if [[ ${#PASSWORDS[*]} -gt 1 ]]; then
    echo "Possible passwords: ${PASSWORDS[*]}"
  elif [[ ${#PASSWORDS[*]} -eq 1 ]]; then
    echo "The password is: ${PASSWORDS[*]}"
    exit 0
  else
    echo 'No more passwords left' >&2
    exit 4
  fi
done
