include ../common.mk

test:
	! ./false >tmp/$@.stdout 2>tmp/$@.stderr
	diff /dev/null tmp/$@.stdout
	diff /dev/null tmp/$@.stderr
	touch $@
