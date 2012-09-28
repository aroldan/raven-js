RAVEN = ./src/raven.js
PARSEURI = ./src/vendor/uri.js
SGLUE = ./src/senchaglue.js
VER = $(shell cat version.txt)
RAVEN_FULL = ./dist/raven-${VER}.js
RAVEN_MIN = ./dist/raven-${VER}.min.js
TMP = /tmp/raven.min.js

COMPRESSOR ?= `which yuicompressor`

#
# Build the compressed all-in-one file
#

raven:
	mkdir -p dist

	# build CoffeeScript to Js
	coffee -c -o src src/coffee/*.coffee

	# Generate the full and compressed distributions
	cat ${BASE64} ${CRYPTO} ${PARSEURI} ${SGLUE} ${RAVEN} | \
		sed "s/@VERSION/${VER}/" > ${RAVEN_FULL}

	${COMPRESSOR} ${RAVEN_FULL} > ${RAVEN_MIN}

	# Prepend the tiny header to the compressed file
	echo "/* Raven.js v${VER} | https://github.com/lincolnloop/raven-js/ */" | \
		cat - ${RAVEN_MIN} > ${TMP}
	mv ${TMP} ${RAVEN_MIN}
