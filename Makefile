# Makefile for Claudius Roman

# Location of mftrace
TRACE=mftrace --enc=cork.enc

# Command to make directories
MKDIR=mkdir

# Command to copy files
CP=cp -u

# Command to generate tar-balls
TAR=tar

# Version number, used for distribution
VERSION=0.5

DISTDIR=claudius-latex-${VERSION}

FONTS=claudius-regular claudius-bold
TEXSUPPORT=claudius.sty claudius.map T1Claudius.fd

TFMS=${addsuffix .tfm, ${FONTS}}
DVIS=${addsuffix .dvi, ${FONTS}}
PFBS=${addsuffix .pfb, ${FONTS}}
TTFS=${addsuffix .ttf, ${FONTS}}


#####################################################################
# Rules

# How to build a DVI proof of a 
%.dvi : %.mf
	mf '\mode:=proof; mag:=1.5; nonstopmode; input $<'
	gftodvi ${basename $<}.3903gf

# How to create a Type1 outline font 
%.pfb : %.mf
	${TRACE} --formats=pfb ${basename $<}

# How to create a TrueType outline font
%.ttf : %.mf
	${TRACE} --formats=ttf ${basename $<}

# How to create a bitmap font
%.600gf %.tfm : %.mf
	mf '\mode:=ljfour; mag:=1; nonstopmode; input $<'

#####################################################################
# Targets

all: ${TFMS} ${PFBS}

tests: all
	make -C test-docs

proofs: ${DVIS}

dev: proofs tests

dist: all
	${RM} -rf ${DISTDIR}
	${MKDIR} ${DISTDIR}
	${CP} COPYING README.txt ${TEXSUPPORT} ${TFMS} ${PFBS} ${DISTDIR}
	${TAR} -czvf ${DISTDIR}.tar.gz ${DISTDIR}
	${TAR} -cjvf ${DISTDIR}.tar.bz2 ${DISTDIR}

clean:
	${RM} *.aux *.dvi *.log *.tfm *.*gf *.*pk *.pfb *.ttf
	${RM} -rf ${DISTDIR} ${DISTDIR}.tar.gz
	make -C test-docs clean

#####################################################################
# Dependencies

${TFMS}: claudius.mf
${PFBS}: claudius.mf
${DVIS}: claudius.mf
${TTFS}: claudius.mf

claudius-regular.tfm: claudius-regular.mf
claudius-bold.tfm: claudius-bold.mf

#####################################################################
# Misc

.PHONY: clean proofs tests dist dev all
