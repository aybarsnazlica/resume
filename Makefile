.PHONY: resume cover-letter shokumu-keirekisho

all: resume cover-letter

resume:
	typst compile src/resume.typ ~/Desktop/resume.pdf
cover-letter:
	typst compile src/cover-letter.typ ~/Desktop/cover-letter.pdf
shokumu-keirekisho:
	typst compile src/職務経歴書.typ ~/Desktop/職務経歴書.pdf