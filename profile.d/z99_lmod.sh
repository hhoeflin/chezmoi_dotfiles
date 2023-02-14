PROG_PREFIX=${HOME}/.local/progs
MODULEPATH=${MODULEPATH:+${MODULEPATH}:}${PROG_PREFIX}/modules
MODULEPATH=${MODULEPATH:+${MODULEPATH}:}${HOME}/.config/modules
. ${PROG_PREFIX}/lmod/lmod/init/profile
