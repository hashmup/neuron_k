#!/bin/bash -x

ARCH=x86_64

rm -r ${ARCH}
../exec/${ARCH}/bin/nrnivmodl ../mod
if [ $# -eq 0 ]
then
    echo "optimized"
    rm ./${ARCH}/hh_k.c
    cp ~/genie/genie/transpiler/tmp/hh_k.c ${ARCH}/hh_k.c
else
    if [ $1 == 'True' ]
    then
        echo "bench"
    else
        echo "optimized"
        rm ./${ARCH}/hh_k.c
        cp ~/genie/genie/transpiler/tmp/hh_k.c ${ARCH}/hh_k.c
        #rm ./${ARCH}/hh_k.c
        #cp ./hh_k7_3.c ${ARCH}/hh_k.c
    fi
fi
../exec/${ARCH}/bin/nrnivmodl ../mod
