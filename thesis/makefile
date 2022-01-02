.PHONY : all clean help todo release
RED=\033[0;31m
NC=\033[0m # No Color
file_name=release
time_out=3m
timeout_prompt="\n\n ${RED} TIME OUT:${NC} process was killed because of timeout\n"
latex_command="xelatex -halt-on-error"
## make all : regenerate all results.
all: todo release ebook

## make todo: make build/todo.pdf
todo: build/todo.pdf
	rm -f todo.tex

## make release: make release version(without todo,cover) to build
release: build/$(file_name).pdf
	rm -f $(file_name).tex

## make ebook : make the ebook version(with todo)
ebook: build/ebook.pdf
	rm -f ebook.tex

todo.tex : build
	echo "\documentclass[draft]{mcmthesis}" > todo.tex
	awk 'FNR>3' main.tex >> todo.tex

ebook.tex : build
	echo "\documentclass[draft,ebook]{mcmthesis}" > ebook.tex
	awk 'FNR>3' main.tex >> ebook.tex

$(file_name).tex : build
	echo "\documentclass{mcmthesis}" > $(file_name).tex
	awk 'FNR>3' main.tex >> $(file_name).tex

## make *.pdf : generate the pdf files
build/%.pdf: %.tex
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) bibtex ./build/$(basename $<) || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)
	timeout $(time_out) xelatex -output-directory="./build" $< || \
		(echo -e $(timeout_prompt) && exit -1)


## make clean: clean the temp files
clean:
	# git ls-files --others | xargs gio trash
	git clean -fXd

## make build: create directory build
build:
	mkdir build

## make help : show this message.
help :
	@grep -h -E '^##' ${MAKEFILE_LIST} | sed -e 's/## //g' \
		| column -t -s ':'
