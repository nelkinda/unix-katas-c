binaries:=true false
tests:=$(addprefix test-,$(binaries))

.PHONY: all
## Builds and tests all programs.
all: $(tests)

test-true: true | tmp/
	./true >tmp/$@.stdout 2>tmp/$@.stderr
	diff /dev/null tmp/$@.stdout
	diff /dev/null tmp/$@.stderr
	touch $@

test-false: false | tmp/
	! ./false >tmp/$@.stdout 2>tmp/$@.stderr
	diff /dev/null tmp/$@.stdout
	diff /dev/null tmp/$@.stderr
	touch $@

tmp/:
	mkdir -p $@

.PHONY: clean
## Removes all auto-generated files.
clean::
	$(RM) -r $(binaries) $(tests) tmp/

-include .makehelp/include/makehelp/Help.mk

ifeq "help" "$(filter help,$(MAKECMDGOALS))"
.makehelp/include/makehelp/Help.mk:
	git clone --depth=1 https://github.com/christianhujer/makehelp.git .makehelp
endif
