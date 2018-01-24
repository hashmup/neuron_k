#!/bin/bash -x

ARCH=$1

rm -r ${ARCH}
../exec$3/${ARCH}/bin/nrnivmodl ../mod
if [ $# -eq 1 ]
then
    echo "optimized"
    rm ./${ARCH}/hh_k.c
    cp ~/genie/genie/transpiler/tmp/hh_k.c ${ARCH}/hh_k.c
else
    if [ $2 == 'True' ]
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
../exec$3/${ARCH}/bin/nrnivmodl ../mod
