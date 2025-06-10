JS=bun build
JSFLAGS=--target browser
JSDEPS=`ls src/*.js`

CSS=bun x @tailwindcss/cli
CSSFLAGS=
CSSDEPS=`ls src/*.css`

GLOBALDEPS= \
	package.json \
	bun.lock

TARGS=app.js app.css

all:V: $TARGS

clean:V:
	rm -f $TARGS

app.js: $JSDEPS $GLOBALDEPS
	$JS $JSFLAGS --outfile app.js src/app.js

app.css: $CSSDEPS $GLOBALDEPS
	$CSS $CSSFLAGS -i src/app.css -o app.css
