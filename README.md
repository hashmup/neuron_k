neuron_kplus
============

NEURON K+ is a neural circuit simulator based on NEURON for high performance computing

# How to compile NEURON
## for PC (x86_64)

1. Choose version of NEURON(7.2 or 7.3) and change dir  
    $ cd nrn-7.2

2. do configure with helper script in config/  
    $ ../config/do_config_pc_gcc.sh

3. make and make install  
    $ make  
    $ make install

4. test nrniv  
    $ ../exec/x86_64/bin/nrniv

5. make special version of NEURON with NEURON_K+ MOD files  
    $ cd ../specials  
    $ ../exec/x86_64/bin/nrnivmodl ../mod

6. test special  
    $ ./x86_64/special


## for K computer

1. Choose version of NEURON(7.2 or 7.3) and change dir. (7.3 is not avilable for K computer)  
    $ cd nrn-7.2

2. do configure with helper script in config/ for nmodl  
    $ ../config/do_config_k1.sh

3. make and make install for nmodl  
    $ make  
    $ make install

4. do configure with helper script in config/ for NEURON  
    $ ../config/do_config_k2.sh

5. make and make install for NEURON  
    $ make clean  
    $ make  
    $ make install

6. copy nmodl programs to sparc64 dir  
    $ cd ../exec  
    $ cp ./x86_64/bin/* ./sparc64/bin/  

7. make special version of NEURON with NEURON_K+ MOD files  
    $ cd ./specials  
    $ ../exec/sparc64/bin/nrnivmodl ../mod

# test NEURON K+

## for PC (x86_64) without MPI
This protcol needs specials/x86_64/special.  

1. cd hoc dir  
    $ cd hoc

2. exec th1_m0.sh  
    $ ../pc_job/th1_m0.sh  

3. check result of job  
  sample result :  

    Condition :  
     \* Process=1, Thread=1  
     \* NSTEP=800 (STOPTIME=20.000000 / dt=0.025000)  
     \* Model=BN_1056, nCELLS=32, nSYNAPSE=10  
     \* NSTIM_POS=1, NSTIM_NUM=10, SYNAPSE_RANGE=1  
     \* CacheEfficient=1, SpikeCompressMode=0  
    RESULT :  
     \* step=33.152699 sec, wait=0.000021 sec, send=0.000003 sec  
     \* modeling time : 1.888162 sec  
     \* core time : 33.152841 sec  
    (SPIKE Informations)  
    
## for K computer (with MPI and Job system)
1. modify k_job/small.sh for your own environment.  
    You have to change stgin/out dirs.

2. qeueu small.sh  
    $ pjsub small.sh

3. check result of job  




