JS=bun build
JSFLAGS="--target=browser --minify --sourcemap=inline"
JSTARG=app.js
JSDEPS=`ls src/*.js`

CSS=bun x --bun @tailwindcss/cli
CSSFLAGS="--minify"
CSSTARG=app.css
CSSDEPS=`ls src/*.css`

GLOBALDEPS= \
	package.json \
	bun.lock \
	mkfile

TARGS=$JSTARG $CSSTARG

all:V: $TARGS

clean:V:
	rm -f $TARGS

app.js: $JSDEPS $GLOBALDEPS
	$JS $JSFLAGS --outfile app.js src/app.js

app.css: $CSSDEPS $GLOBALDEPS
	$CSS $CSSFLAGS -i src/app.css -o app.css
