include ../common.mk

test: test/empty
test/empty: echo | actual/empty/
	./echo >actual/empty/stdout 2>actual/empty/stderr
	diff <(echo) actual/empty/stdout
	diff /dev/null actual/empty/stderr
	touch $@

test: test/single-word
test/single-word: echo | actual/single-word/
	./echo hello >actual/single-word/stdout 2>actual/single-word/stderr
	diff <(echo hello) actual/single-word/stdout
	diff /dev/null actual/single-word/stderr
	touch $@

test: test/multiple-words
test/multiple-words: echo | actual/multiple-words/
	./echo hello world >actual/multiple-words/stdout 2>actual/multiple-words/stderr
	diff <(echo hello world) actual/multiple-words/stdout
	diff /dev/null actual/multiple-words/stderr
	touch $@
