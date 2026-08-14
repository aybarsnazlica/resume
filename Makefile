.PHONY: resume cover-letter

all: resume cover-letter

resume:
	typst compile src/resume.typ ~/Desktop/resume.pdf
cover-letter:
	typst compile src/cover-letter.typ ~/Desktop/cover-letter.pdf