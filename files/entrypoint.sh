#!/bin/bash

if [ "$1" == "bash" ]; then
  echo "Run: $@"
  exec $@
else
  ./setBladeProxy.sh

  echo ""
  echo "run command: blade ${@}"
  echo ""

  exec blade $@
fi
