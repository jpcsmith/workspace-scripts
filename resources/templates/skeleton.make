# Useful automatic variables:
# 	$@ - The name of the target of the rule
# 	$* - The stem of the pattern (%)
# 	$< - The name of the first prerequisite
# 	$^ - The name of all the prerequisites
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

.PHONY: all
all:
