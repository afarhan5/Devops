#!/bin/bash

case "$1" in
  -t)
    git tag "$2" && echo "Tag '$2' created."
    ;;

  -l)
    echo "Tags:"
    git tag
    ;;

  -d)
    git tag -d "$2" && echo "Tag '$2' deleted."
    ;;

  *)
    echo "Invalid option"
    ;;
esac
