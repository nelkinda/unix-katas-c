include ../common.mk

test: test/false
test/false: | actual/false/
	! ./false >actual/false/stdout 2>actual/false/stderr
	diff /dev/null actual/false/stdout
	diff /dev/null actual/false/stderr
	touch $@
