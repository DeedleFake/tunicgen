JS=bun build
JSFLAGS="--target=browser --minify --sourcemap=inline"
JSTARG=docs/app.js
JSDEPS=`ls src/*.js`

CSS=bun x --bun @tailwindcss/cli
CSSFLAGS="--minify"
CSSTARG=docs/app.css
CSSDEPS=`ls src/*.css` docs/index.html

GLOBALDEPS= \
	package.json \
	bun.lock \
	mkfile

TARGS=$JSTARG $CSSTARG

all:V: $TARGS

clean:V:
	rm -f $TARGS

$JSTARG: $JSDEPS $GLOBALDEPS
	$JS $JSFLAGS --outfile $JSTARG src/app.js

$CSSTARG: $CSSDEPS $GLOBALDEPS
	$CSS $CSSFLAGS -o $CSSTARG -i src/app.css
