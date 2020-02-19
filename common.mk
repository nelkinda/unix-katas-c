.PHONY: all
## Builds and tests the program.
all: test

test: $(binary) | tmp/

tmp/:
	mkdir -p $@

.PHONY: clean
clean::
	$(RM) -r $(binary) test tmp/

-include ../.makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
../.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git ../.makehelp
endif
