include ../common.mk

test: test/true
test/true: true | actual/true/
	./true >actual/true/stdout 2>actual/true/stderr
	diff /dev/null actual/true/stdout
	diff /dev/null actual/true/stderr
	touch $@
