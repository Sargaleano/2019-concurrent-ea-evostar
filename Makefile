###############################################################################
# Makefile
###############################################################################

TEX = $(wildcard *.tex)
PDF = $(TEX:.tex=.pdf)

###############################################################################

all: $(PDF)

auto:
	latexmk -pdf -pvc

clean:
	latexmk -C

###############################################################################

%.pdf: %.tex $(EPS)
	latexmk -f -pdf $*

###############################################################################

.NOEXPORT:

###############################################################################
