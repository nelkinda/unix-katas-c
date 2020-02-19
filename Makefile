binaries:=true false
tests:=$(addprefix test-,$(binaries))

.PHONY: all
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
clean::
	$(RM) -r $(binaries) $(tests) tmp/
