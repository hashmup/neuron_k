#!/bin/bash -x

ARCH=x86_64

rm -r ${ARCH}
../exec/${ARCH}/bin/nrnivmodl ../mod
if [ $# -eq 0 ]
then
    echo "bench"
else
    if [ $1 == 'True' ]
    then
        echo "genie"
        rm ./${ARCH}/hh_k.c
        cp ~/genie/genie/transpiler/tmp/hh_k.c ${ARCH}/hh_k.c
    else
        echo "bench"
        #rm ./${ARCH}/hh_k.c
        #cp ./hh_k7_3.c ${ARCH}/hh_k.c
    fi
fi
../exec/${ARCH}/bin/nrnivmodl ../mod
