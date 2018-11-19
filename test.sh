#!/bin/bash
#set -eux
try() {
  expected="$1"
  input="$2"
  ros compiler.ros "$input" > tmp.s
  gcc -static -o tmp tmp.s
  ./tmp
  actual="$?"
	echo $actual
  if [ "$actual" != "$expected" ]; then
    echo "$input expected, but got $actual"
    exit 1
  fi
}
try 0 0
try 42 42
try 21 '5+20-4'
echo OK
