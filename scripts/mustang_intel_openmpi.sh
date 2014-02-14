#!/bin/bash
module purge
module load intel openmpi
export SOFTWARE_DIR=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi
export NETCDF3=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi/netcdf-3.6.3
export NETCDF4=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi/netcdf-4.1.3
export NETCDF=${NETCDF4}
export HDF5=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi/hdf5-1.8.7
export PNETCDF=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi/parallel-netcdf-1.2.0
export PIO=/usr/projects/climate/SHARED_CLIMATE/software/mustang/intel_openmpi/pio-1.4.0
#export METIS4=/usr/projects/climate/SHARED_CLIMATE/software/mustang/universal/metis-4.0
export PATH="${METIS4}:${PATH}"
export LD_LIBRARY_PATH="${NETCDF}/lib:${PNETCDF}/lib:${PIO}:${LD_LIBRARY_PATH}"
