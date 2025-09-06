#!/bin/bash

case "$1" in
  -l)
    echo "Branches:"
    git branch
    ;;

  -b)
    git branch "$2" && echo "Branch '$2' created."
    ;;

  -d)
    git branch -d "$2" && echo "Branch '$2' deleted."
    ;;

  -m)
    git checkout "$6"
    git merge "$4"
    echo "Merged branch '$4' into '$6'"
    ;;

  -r)
    git checkout "$6"
    git rebase "$4"
    echo "Rebased branch '$4' on '$6'"
    ;;

  *)
    echo "Invalid option"
    ;;
esac
