O_DIR    := Output
TEX_O    := --output-directory=$(O_DIR)
CSL      := Template/CSL/ur-magnum-opus-zotero.csl
URMD     := $(wildcard *.ur.md)
B_OPT    := --standalone --latex-engine=xelatex --no-tex-ligatures --number-sections -V header-includes='\setbeamertemplate{bibliography item}{}' --biblio Quellen/Quellen.bib -f markdown -t beamer --biblatex
B_TMPL   := Template/BEAMER/beamer-template.tex
B_TMPLUR := Template/BEAMER/ur-beamer-template.tex
QUIET    := -interaction=batchmode
#QUIET    :=

BEAM1610   := $(patsubst %.ur.md,$(O_DIR)/%.16zu10.beamer.vortrag.tex,$(URMD))
BEAM1610UR := $(patsubst %.ur.md,$(O_DIR)/%.16zu10.beamer.vortrag.ur.tex,$(URMD))
BEAM169    := $(patsubst %.ur.md,$(O_DIR)/%.16zu9.beamer.vortrag.tex,$(URMD))
BEAM169UR  := $(patsubst %.ur.md,$(O_DIR)/%.16zu9.beamer.vortrag.ur.tex,$(URMD))
BEAM149    := $(patsubst %.ur.md,$(O_DIR)/%.14zu9.beamer.vortrag.tex,$(URMD))
BEAM149UR  := $(patsubst %.ur.md,$(O_DIR)/%.14zu9.beamer.vortrag.ur.tex,$(URMD))
BEAM54     := $(patsubst %.ur.md,$(O_DIR)/%.5zu4.beamer.vortrag.tex,$(URMD))
BEAM54UR   := $(patsubst %.ur.md,$(O_DIR)/%.5zu4.beamer.vortrag.ur.tex,$(URMD))
BEAM43     := $(patsubst %.ur.md,$(O_DIR)/%.4zu3.beamer.vortrag.tex,$(URMD))
BEAM43UR   := $(patsubst %.ur.md,$(O_DIR)/%.4zu3.beamer.vortrag.ur.tex,$(URMD))
BEAM32     := $(patsubst %.ur.md,$(O_DIR)/%.3zu2.beamer.vortrag.tex,$(URMD))
BEAM32UR   := $(patsubst %.ur.md,$(O_DIR)/%.3zu2.beamer.vortrag.ur.tex,$(URMD))

REVEALSIM     := $(patsubst %.ur.md,$(O_DIR)/%.simple.reveal.vortrag.htm,$(URMD))
REVEALNIG     := $(patsubst %.ur.md,$(O_DIR)/%.night.reveal.vortrag.htm,$(URMD))
REVEALUR      := $(patsubst %.ur.md,$(O_DIR)/%.ur.reveal.vortrag.htm,$(URMD))
HANDOUTPDF    := $(patsubst %.ur.md,$(O_DIR)/%.handout.vortrag.tex,$(URMD))
HANDOUTODT    := $(patsubst %.ur.md,$(O_DIR)/%.handout.vortrag.odt,$(URMD))

#TAR=$(SRC:.md=.paket.tar.gz)


all : \
	$(BEAM1610) \
	$(BEAM1610UR) \
	$(BEAM169) \
	$(BEAM169UR) \
	$(BEAM149) \
	$(BEAM149UR) \
	$(BEAM54) \
	$(BEAM54UR) \
	$(BEAM43) \
	$(BEAM43UR) \
	$(BEAM32) \
	$(BEAM32UR) \
	$(REVEALSIM) \
	$(REVEALNIG) \
	$(REVEALUR) \
	$(HANDOUTPDF) \
	$(HANDOUTODT)

beamer : \
	$(BEAM1610) \
	$(BEAM1610UR) \
	$(BEAM169) \
	$(BEAM169UR) \
	$(BEAM149) \
	$(BEAM149UR) \
	$(BEAM54) \
	$(BEAM54UR) \
	$(BEAM43) \
	$(BEAM43UR) \
	$(BEAM32) \
	$(BEAM32UR)

rebuild-beamer : \
	clean-beamer \
	$(BEAM1610) \
	$(BEAM1610UR) \
	$(BEAM169) \
	$(BEAM169UR) \
	$(BEAM149) \
	$(BEAM149UR) \
	$(BEAM54) \
	$(BEAM54UR) \
	$(BEAM43) \
	$(BEAM43UR) \
	$(BEAM32) \
	$(BEAM32UR)

reveal : \
	$(REVEALSIM) \
	$(REVEALNIG) \
	$(REVEALUR)

rebuild-reveal : \
	clean-reveal \
	$(REVEALSIM) \
	$(REVEALNIG) \
	$(REVEALUR)

handout : \
	$(HANDOUTPDF) \
	$(HANDOUTODT)

rebuild-handout : \
	clean-handout \
	$(HANDOUTPDF) \
	$(HANDOUTODT)

#tar: clean-tar $(TAR)

##	BEAM1610
$(O_DIR)/%.16zu10.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=1610 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (16zu10) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (16zu10) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM1610UR
$(O_DIR)/%.16zu10.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=1610 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (16zu10) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (16zu10) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'

##	BEAM169
$(O_DIR)/%.16zu9.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=169 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (16zu9) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (16zu9) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM169UR
$(O_DIR)/%.16zu9.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=169 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (16zu9) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (16zu9) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'

##	BEAM149
$(O_DIR)/%.14zu9.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=149 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (14zu9) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (14zu9) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM149UR
$(O_DIR)/%.14zu9.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=149 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (14zu9) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (14zu9) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'

##	BEAM54
$(O_DIR)/%.5zu4.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=54 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (5zu4) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (5zu4) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM54UR
$(O_DIR)/%.5zu4.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=54 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (5zu4) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (5zu4) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'

##	BEAM43
$(O_DIR)/%.4zu3.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=43 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (4zu3) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (4zu3) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM43UR
$(O_DIR)/%.4zu3.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=43 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (4zu3) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (4zu3) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'

##	BEAM32
$(O_DIR)/%.3zu2.beamer.vortrag.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=32 \
	--template=$(B_TMPL) \
	$< -o $@
	@echo '* Beamer-TEX (3zu2) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@ 
	biber $(basename $@)
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@
	@echo '* Beamer-TEX/PDF (3zu2) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF; aux files removed.'

## BEAM32UR
$(O_DIR)/%.3zu2.beamer.vortrag.ur.tex: %.ur.md
	@pandoc $(B_OPT) \
	-V aspectratio=32 \
	--template=$(B_TMPLUR) \
	$< -o $@
	@echo '* Beamer-TEX UR (3zu2) erstellt.' 
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@echo '* Beamer-TEX/PDF UR (3zu2) erstellt.'
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Beamer-TEX/PDF UR; aux files removed.'



$(O_DIR)/%.simple.reveal.vortrag.htm: %.ur.md
	@pandoc \
	-V lang=de \
	-V theme=simple \
	-V transition=fade \
	-V revealjs-url=../Template/reveal.js \
	-s \
	-S \
	--biblio Quellen/Quellen.bib \
	--csl $(CSL) \
	-f markdown \
	-t revealjs \
	$< -o $@
	@echo '* Reveal (simple) erstellt.'

$(O_DIR)/%.night.reveal.vortrag.htm: %.ur.md
	@pandoc \
	-V lang=de \
	-V theme=night \
	-V transition=fade \
	-V revealjs-url=../Template/reveal.js \
	-s \
	-S \
	--biblio Quellen/Quellen.bib \
	--csl $(CSL) \
	-f markdown \
	-t revealjs \
	$< -o $@
	@echo '* Reveal (night) erstellt.'

$(O_DIR)/%.ur.reveal.vortrag.htm: %.ur.md
	@pandoc \
	-V lang=de \
	-V theme=uni \
	-V transition=fade \
	-V revealjs-url=../Template/reveal.js \
	-B Template/reveal.js/ur-svg-farben-template.txt \
	--template=Template/reveal.js/ur-revealjs-template.htm \
	-s \
	-S \
	--biblio Quellen/Quellen.bib \
	--csl $(CSL) \
	-f markdown \
	-t revealjs \
	$< -o $@
	@echo '* Reveal (uni) erstellt.'

$(O_DIR)/%.handout.vortrag.tex: %.ur.md
	@pandoc \
	-V mainfont:'Frutiger Next LT W1G' -V sansfont:'Frutiger Next LT W1G' \
	-V papersize:a4 -V lang=ngerman -V mainlang=german \
	-V classoption='DIV=9' -V classoption='headinclude' \
	-V classoption='footexclude' \
	-V header-includes='\usepackage[absolute]{textpos}' \
	-V documentclass=scrartcl \
	-V include-before='\end{textblock}' \
	-V include-before='\includegraphics[scale=0.9]{Template/TEX-PDF/logo-uni-rz-stud-it-regular}' \
	-V include-before='\begin{textblock}{4}(1.71,1.2)' \
	-V include-before='\setlength{\TPVertModule}{\TPHorizModule}' \
	-V include-before='\setlength{\TPHorizModule}{1cm}' \
	--latex-engine=xelatex --no-tex-ligatures --toc \
	--template=Template/TEX-PDF/tex-pdf-template.tex \
	--biblio Quellen/Quellen.bib --csl $(CSL) --biblatex \
	-s \
	$< -o $@
	@echo '* Handout-TEX/PDF UR.'
	xelatex $(QUIET) $(TEX_O) $@
	biber $(basename $@) 
	xelatex $(QUIET) $(TEX_O) $@ 
	xelatex $(QUIET) $(TEX_O) $@ 
	@-rm $(basename $@).aux $(basename $@).bbl $(basename $@).bcf $(basename $@).blg $(basename $@).log $(basename $@).nav $(basename $@).out $(basename $@).run.xml $(basename $@).snm $(basename $@).toc $(basename $@).vrb
	@echo '* Handout-TEX/PDF UR; aux files removed.'

$(O_DIR)/%.handout.vortrag.odt: %.ur.md
	@pandoc -V lang=ngerman -V mainlang=german \
	--toc --reference-odt=Template/ODT/reference-handout.odt \
	--biblio Quellen/Quellen.bib --csl $(CSL) \
	-s $< -o $@
	@echo '* Handout (odt) erstellt.'


clean-handout : ;
	@-rm \
	$(HANDOUTPDF) \
	$(HANDOUTODT)
	@echo '* Handout-Dateien gelöscht.'

clean-beamer : ;
	@-rm \
	$(BEAM1610) \
	$(BEAM1610UR) \
	$(BEAM169) \
	$(BEAM169UR) \
	$(BEAM149) \
	$(BEAM149UR) \
	$(BEAM54) \
	$(BEAM54UR) \
	$(BEAM43) \
	$(BEAM43UR) \
	$(BEAM32) \
	$(BEAM32UR)
	@echo '* Beamer-Dateien gelöscht.'
	
clean-reveal : ;
	@-rm \
	$(REVEALSIM) \
	$(REVEALNIG) \
	$(REVEALUR)
	@echo '* Reveal-Dateien gelöscht.'
	
clean-all : ;
	@-rm \
	$(BEAM1610) \
	$(BEAM169) \
	$(BEAM149) \
	$(BEAM54) \
	$(BEAM43) \
	$(BEAM32) \
	$(REVEALSIM) \
	$(REVEALNIG) \
	$(REVEALUR) \
	$(HANDOUTPDF) \
	$(HANDOUTODT)
	@echo '* alle Output-Dateien gelöscht.'
	
rebuild-all : clean-all all
