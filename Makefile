.PHONY: examples

# Vendored Font Awesome 6 (TeX Live may not ship fontawesome6; see README in _fontawesome6_vendor)
FA6_VENDOR = _fontawesome6_vendor
export TEXINPUTS := .:$(FA6_VENDOR)/tex//:
export LUAINPUTS := .:$(FA6_VENDOR)/tex//:
export OPENTYPEFONTS := .:$(FA6_VENDOR)/opentype//:
export TTFONTS := .:$(FA6_VENDOR)/opentype//:
export TFONTS := .:$(FA6_VENDOR)/tfm//:
export ENCFONTS := .:$(FA6_VENDOR)/enc//:

CC = lualatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
