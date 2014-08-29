#!/usr/bin/env bash
#
# Setup environment for vanilla knc builds/tests.

# Unload PrgEnv and load vanilla intel compiler.
existing_prgenv=$(module list -t 2>&1 | grep PrgEnv- || :)
if [ -n "${existing_prgenv}" ] ; then
    module unload $existing_prgenv
fi
module load intel

# Unload things that conflict with craype-intel-knc.
existing_cpu_module=$(module list -t 2>&1 | grep craype- | grep -v network || :)
if [ -n "${existing_cpu_module}" ] ; then
    module unload $existing_cpu_module
fi
module unload atp cray-libsci

# Setup environment to build knc.
export CHPL_TARGET_COMPILER=intel
export CHPL_TARGET_ARCH=knc

# Explicitly disable features that do not work.
export CHPL_REGEXP=none

# Build bundled gmp. System gmp is not supported.
export CHPL_GMP=gmp
