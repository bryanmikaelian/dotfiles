#!/bin/bash
# Focus window 1 and resize it wider
kitty @ focus-window --match "num:1"
sleep 0.1
kitty @ kitten relative_resize.py right 10
sleep 0.1
kitty @ kitten relative_resize.py right 10
sleep 0.1
kitty @ kitten relative_resize.py right 10

# Focus window 3 and make it shorter
sleep 0.1
kitty @ focus-window --match "num:3"
sleep 0.1
kitty @ kitten relative_resize.py down 5

# Focus back to window 2 (Claude)
sleep 0.1
kitty @ focus-window --match "num:2"
