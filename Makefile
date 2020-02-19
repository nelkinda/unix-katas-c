programs:=$(patsubst %/,%,$(wildcard */))

.PHONY: all
## Builds and tests all programs.
all: $(addsuffix -all,$(programs))

%-all:
	$(MAKE) -C $*

.PHONY: clean
## Removes all auto-generated files.
clean:: $(addsuffix -clean,$(programs))

%-clean:
	$(MAKE) -C $* clean

-include .makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git .makehelp
endif
