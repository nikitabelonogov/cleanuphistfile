#!/usr/bin/env bash

HISTFILE=${1}

cp "${HISTFILE}" "${HISTFILE}.backup"

wc -l "${HISTFILE}"

sort -s -u -t ':' -k 3 "${HISTFILE}.backup" | \
  grep --regexp ': \d*:0;.*' | \
  grep --invert-match --regexp '\\$' | \
  grep --invert-match ':0;tree' | \
  grep --invert-match ':0;ssh' | \
  grep --invert-match ':0;touch' | \
  grep --invert-match ':0;rm' | \
  grep --invert-match ':0;cd' | \
  grep --invert-match ':0;ll' | \
  grep --invert-match ':0;ls' | \
  grep --invert-match ':0;l' | \
  grep --invert-match ':0;gco' | \
  grep --invert-match ':0;git checkout' | \
  grep --invert-match ':0;gaa' | \
  grep --invert-match ':0;ga' | \
  grep --invert-match ':0;gc -m' | \
  grep --invert-match ':0;git show' | \
  grep --invert-match ':0;gd' | \
  grep --invert-match ':0;git diff' | \
  grep --invert-match ':0;history' | \
  grep --invert-match ':0;man' | \
  grep --invert-match ':0;export' | \
  sort > "${HISTFILE}"

wc -l "${HISTFILE}"
