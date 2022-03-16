all: gromacs.sif
.PHONY: all


clean:
	rm -rf *.sif
.PHONY: clean


spack.sif: spack.def
	apptainer build --fakeroot --force spack.sif spack.def


gcc.sif: gcc.def spack.sif
	apptainer build --fakeroot --force gcc.sif gcc.def


gromacs.sif: gromacs.def spack.sif
	apptainer build --fakeroot --force gromacs.sif gromacs.def
