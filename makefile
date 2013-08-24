DOCUMENT_NAME = kochbuch
OUTPUT_DIR    = output

# Build the LaTeX document.
all: outputdir report cleanup

# Remove output directory.
clean: cleanup
	rm -rf $(OUTPUT_DIR)

# cleanup tempfiles
cleanup:
	rm -f $(DOCUMENT_NAME).aux $(DOCUMENT_NAME).out $(DOCUMENT_NAME).toc $(DOCUMENT_NAME).pdf $(DOCUMENT_NAME).log recipes/*.aux

# Create LaTeX output directory.
outputdir:
	$(shell mkdir $(OUTPUT_DIR) 2>/dev/null)

# Generate PDF output from LaTeX input files.
report:
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	pdflatex -interaction=errorstopmode $(DOCUMENT_NAME)
	cp $(DOCUMENT_NAME).pdf $(OUTPUT_DIR)
