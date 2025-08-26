.PHONY: all clean distclean open help

# Build settings
TEX_ENGINE = pdflatex
TEX_FLAGS = -interaction=nonstopmode -halt-on-error

# Files
MAIN_TEX = resume.tex
MAIN_PDF = resume.pdf
DEPS = template.tex

# Default target
all: $(MAIN_PDF)

# Build the PDF from source files
$(MAIN_PDF): $(MAIN_TEX) $(DEPS)
	@echo "Building $(MAIN_PDF)..."
	@$(TEX_ENGINE) $(TEX_FLAGS) $(MAIN_TEX)
	@$(TEX_ENGINE) $(TEX_FLAGS) $(MAIN_TEX)
	@echo "Build complete!"

# Open the PDF in the default viewer
open: $(MAIN_PDF)
	@echo "Opening $(MAIN_PDF)..."
	@if command -v xdg-open >/dev/null; then xdg-open $(MAIN_PDF); \
	elif command -v open >/dev/null; then open $(MAIN_PDF); \
	else echo "Could not find a way to open the PDF"; fi

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	@rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz

# Remove all generated files
distclean: clean
	@echo "Removing generated files..."
	@rm -f $(MAIN_PDF)

# Show help information
help:
	@echo "Available targets:"
	@echo "all       - Build the resume PDF (default)"
	@echo "open      - Open the PDF in default viewer"
	@echo "clean     - Remove auxiliary files"
	@echo "distclean - Remove all generated files"
	@echo "help      - Show this help message"
