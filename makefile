BEAM1610 := $(patsubst %.md,%.md.16zu10.beamer.vortrag.pdf,$(wildcard *.ur.md))
BEAM169 := $(patsubst %.md,%.md.16zu9.beamer.vortrag.pdf,$(wildcard *.ur.md))
BEAM149 := $(patsubst %.md,%.md.14zu9.beamer.vortrag.pdf,$(wildcard *.ur.md))
BEAM54 := $(patsubst %.md,%.md.5zu4.beamer.vortrag.pdf,$(wildcard *.ur.md))
BEAM43 := $(patsubst %.md,%.md.4zu3.beamer.vortrag.pdf,$(wildcard *.ur.md))
BEAM32 := $(patsubst %.md,%.md.3zu2.beamer.vortrag.pdf,$(wildcard *.ur.md))

#BEAMTEX=$(SRC:.md=.beamer.vortrag.tex)

REVEALSIM := $(patsubst %.md,%.md.simple.reveal.vortrag.htm,$(wildcard *.ur.md))
REVEALNIG := $(patsubst %.md,%.md.night.reveal.vortrag.htm,$(wildcard *.ur.md))

#REVEALSIM=$(SRC:.md=.simple.reveal.vortrag.htm)
#REVEALNIG=$(SRC:.md=.night.reveal.vortrag.htm)
#HANDOUTPDF=$(SRC:.md=.handout.vortrag.pdf)
#HANDOUTODT=$(SRC:.md=.handout.vortrag.odt)
#TAR=$(SRC:.md=.paket.tar.gz)

O_DIR := Output
TEX_O := --output-directory=$(O_DIR)

#all:  $(BEAM1610) $(BEAM169) $(BEAM149) $(BEAM54) $(BEAM43) $(BEAM32) $(BEAMTEX) $(HANDOUTPDF) $(HANDOUTODT) $(REVEALSIM) $(REVEALNIG) $(TAR)

all: $(BEAM1610) $(BEAM169) $(BEAM149) $(BEAM54) $(BEAM43) $(BEAM32) $(REVEALSIM) $(REVEALNIG)

#beamer: clean-beamer $(BEAM1610) $(BEAM169) $(BEAM149) $(BEAM54) $(BEAM43) $(BEAM32) $(BEAMTEX)
#reveal: clean-reveal $(REVEALSIM) $(REVEALNIG)
#handout: clean-handout $(HANDOUTPDF) $(HANDOUTODT)
#tar: clean-tar $(TAR)

%.ur.md.16zu10.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=1610 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.16zu9.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=169 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.14zu9.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=149 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.5zu4.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=54 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.4zu3.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=43 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.3zu2.beamer.vortrag.pdf: %.ur.md
	@pandoc --latex-engine=xelatex -V aspectratio=32 \
	--template=beamertheme/vorlage-beamer.tex --no-tex-ligatures -f markdown -t beamer \
	$< -o $(O_DIR)/$@

%.ur.md.simple.reveal.vortrag.htm: %.ur.md
	@pandoc -V theme=simple -V transition=fade -V revealjs-url=dinge-und-sachen/reveal.js \
	-s -S -f markdown -t revealjs	$< -o $(O_DIR)/$@

%.ur.md.night.reveal.vortrag.htm: %.ur.md
	@pandoc -V theme=simple -V transition=fade -V revealjs-url=dinge-und-sachen/reveal.js \
	-s -S -f markdown -t revealjs	$< -o $(O_DIR)/$@
