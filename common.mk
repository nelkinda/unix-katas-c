binary:=$(notdir $(abspath .))
SHELL:=/bin/bash

CFLAGS:=-W -Wall -pedantic

.PHONY: all
## Builds and tests the program.
all: test

.PHONY: test
test: $(binary) | test/

%/:
	mkdir -p $@

.PHONY: clean
clean::
	$(RM) -r $(binary) test/ actual*

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif
