BASE:=factchain
TEX:=${BASE}.tex
SLIDES:=${BASE}.pdf
STYLES:=schulung.sty beamerinnerthemeschulung.sty beamerouterthemeschulung.sty

GSSWITCHES:=-sDEVICE=pdfwrite -dBATCH -dNOPAUSE

INFOSIM:=images/20151102_Meeting_TUM.pdf
CHUNK:=chunk.pdf

PART1:=part1.pdf
PART2:=part2.pdf
PARTS:=${PART1} ${PART2}

LOG:=make.log

.PHONY: ${TEX}

${SLIDES}: ${TEX} images/*
	echo "### COMPILE###"
	#lualatex ${TEX} 
	pdflatex ${TEX}
	pdflatex ${TEX}

split: ${SLIDES} ${INFOSIM}
	echo "### SPLIT ###"
	gs ${GSSWITCHES} -dFirstPage=1 -dLastPage=14 -sOutputFile=${CHUNK} ${INFOSIM} >> ${LOG} 2>&1
	gs ${GSSWITCHES} -dFirstPage=1 -dLastPage=6 -sOutputFile=${PART1} ${SLIDES} >> ${LOG} 2>&1
	gs ${GSSWITCHES} -dFirstPage=7 -sOutputFile=${PART2} ${SLIDES} >> ${LOG} 2>&1

merge: ${SLIDES} split
	echo "### MERGE ###"
	gs ${GSSWITCHES} -sOutputFile=${SLIDES} ${PART1} ${CHUNK} ${PART2} >> ${LOG} 2>&1
	rm -f ${PARTS} ${CHUNK}

all: mergeq

clean:
	rm -f *.toc *.log *.aux *.pdf *.snm *.out *.nav *.tex~
