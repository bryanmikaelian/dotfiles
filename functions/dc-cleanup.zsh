#!/usr/bin/env bash
function dc-cleanup() {
  ./dc.sh stop -t 1 $1 && ./dc.sh rm -f $1 && ./dc.sh up -d $1
}

