.PHONY: resume cover-letter shokumu-keirekisho

all: resume cover-letter shokumu-keirekisho

resume:
	typst compile src/resume.typ ~/Desktop/resume.pdf
cover-letter:
	set -a; source .env; set +a; typst compile --input company="$$COMPANY" --input role="$$ROLE" src/cover-letter.typ ~/Desktop/cover-letter.pdf
shokumu-keirekisho:
	typst compile src/職務経歴書.typ ~/Desktop/職務経歴書.pdf
clean:
	rm -f ~/Desktop/resume.pdf ~/Desktop/cover-letter.pdf ~/Desktop/職務経歴書.pdf	