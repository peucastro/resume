resume.pdf: resume.tex template.tex
	pdflatex -interaction=nonstopmode -halt-on-error resume.tex

clean:
	rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz

distclean: clean
	rm -f resume.pdf

.PHONY: clean distclean
