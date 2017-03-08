#!/usr/bin/env bash
function git-cleanup {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}