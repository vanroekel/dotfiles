#!/bin/bash

HOST_CHECK=`echo ${HOSTNAME%-*} | sed "s/[0-9]//g"`
if [ "${HOST_CHECK}" == "lo" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load git/1.7.7.1 cmake subversion/1.6.15 python-epd/7.3.2 
elif [ "${HOST_CHECK}" == "cj" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load cmake python-epd/7.3.2 subversion/1.6.15 
elif [ "${HOST_CHECK}" == "ml" ]; then
    export SCRIPT_DIR=/usr/projects/climate/SHARED_CLIMATE/scripts
    source ${SCRIPT_DIR}/add_modules.sh
    module load friendly-testing
    module load python-epd/7.3.2 cmake
elif [ "${HOST_CHECK}" == "bl" ]; then
    export NETCDF_PATH=/soft/spack-0.9.1/opt/spack/linux-centos6-x86_64/intel-17.0.0/netcdf-4.4.1-gpk22cidfgknxbc6wjuimdkqifhfhg2j
    export PNETCDF_PATH=/soft/spack-0.9.1/opt/spack/linux-centos6-x86_64/intel-17.0.0/parallel-netcdf-1.7.0-v6lbtz7i6ng4oeay53iz74w7krgkdlwq
    export NETCDF=$NETCDF_PATH
    export PNETCDF=$PNETCDF_PATH
    export PIO=/home/lvanroe/libpio
    unset LS_COLORS
    # added by Miniconda2 4.1.11 installer
    export PATH="/home/zender/bin:/lcrc/group/acme/lvanroe/conda/bin:$PATH"
    export PYTHONPATH="/home/lvanroe/python_scripts:${PYTHONPATH}"
elif [ "${HOST_CHECK}" == "titan" ]; then
    alias cdrun="cd /lustre/atlas1/cli115/scratch/vanroek/GMPAS-IAF_oRRS18to6v3/run"
    module use /ccs/proj/cli115/vanroek/modulefiles/all
    export MEMBERWORK='/lustre/atlas/scratch/vanroek'
    export PROJWORK='/lustre/atlas/proj-shared'
    #    module load python/anaconda-2.7-lvr
    module swap PrgEnv-pgi PrgEnv-intel
    alias cdcase="cd /ccs/home/vanroek/ACME_CASES/GMPAS-IAF_oRRS18to6v3"
elif [ "${HOST_CHECK}" == "rhea" ]; then
    export PYTHONPATH="/ccs/home/vanroek/python_scripts:${PYTHONPATH}"
elif [ "${HOST_CHECK}" == "yslogin" ]; then
	export LIBEVENT=/glade/u/home/douglasj/libevent/2.1.3
	export TMUX=/glade/u/home/douglasj/tmux/1.8
	export LD_LIBRARY_PATH="${LIBEVENT}/lib:${LD_LIBRARY_PATH}"
	export PATH="${TMUX}/bin:${PATH}"
elif [ "${HOST_CHECK}" == "hopper" ]; then
    module load git
else # Ubuntu?
    # Setup for MPAS
    export NETCDF=/usr
    export PNETCDF=/usr
    export PIO=/usr
fi

