set dotenv-load

export EDITOR := 'nvim'

alias c := clean
alias l := lint
alias o := open

all: forbid clean

default:
  just --list

clean:
  fd '.log|.gz|.aux|.fls|.toc|.fdb_latexmk|.out|.pre' -X rm

dev-deps:
  brew install proselint pandoc fd zathura

forbid:
  ./bin/forbid

lint:
  proselint .

open:
  zathura `fd .pdf | fzf`
