#!/usr/bin/env bash
function git-lita-ship {
  TAG=$(git describe | cut -d '-' -f 1)
  COMMAND="lita ship $TAG to $(basename $(pwd)) production"
  echo -n "$COMMAND" | pbcopy
  echo "\"$COMMAND\" copied to clipboard."
}
