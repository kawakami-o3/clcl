#!/bin/bash
set -eux
run() {
  input="$1"
  ros roswell/cl-9cc.ros "$input"
}
#run 0
#run 42
run '2*3+4'
