#!/bin/bash
if [ "$1" == "build" ] ; then
for i in $(ls /files/opensource-cobol*.tar.gz 2> /dev/null)
do
  BASE=${i#/files/}
  BASE=${BASE%.tar.gz}
  tar zxpf $i 
done
for i in $(ls -d opensource-cobol*)
do
  if `echo $i | grep -q utf8` ; then
    OPT="--enable-utf8"
  else
    OPT=""
  fi
  cd $i
  ./configure $OPT
  make
  cd tests
  ./run
  cd ../..
done
fi
/bin/bash

