# Makefile for generating R packages.
# 2017 Rob J Hyndman
#
# Assumes Makefile is in top folder of package

PKG_NAME=$(shell grep -i ^package DESCRIPTION | cut -d : -d \  -f 2)

all: build pkgdown install

check: 
	rcheck

build:
	R CMD build .
	mv -f *.tar.gz ..

install: 
	rmake

pkgdown:
	Rscript -e "rt::rdoc(); rt::rpkgdown()"

winbuild:
	Rscript -e "rt::rwinbuild(devel=TRUE)"

clean:
	-rm -f ../$(PKG_NAME)_*.tar.gz
	-rm -r -f man/*.Rd
	-rm -r -f NAMESPACE

