all: gromacs.sif hdfview.sif
.PHONY: all


clean:
	rm -rf *.sif spack
.PHONY: clean


spack: spack.def
	apptainer build --fakeroot --force --sandbox spack spack.def


gromacs.sif: spack gromacs-pre.def gromacs.def
	apptainer build --fakeroot --update --sandbox spack gromacs-pre.def
	apptainer build --fakeroot --force gromacs.sif gromacs.def


hdfview.sif: spack hdfview.def
	apptainer build --fakeroot --update --sandbox spack hdfview.def
	apptainer build --fakeroot --force hdfview.sif hdfview.def
