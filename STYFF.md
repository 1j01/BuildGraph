
build-graph, the cascading build system

BuildGraph, a visual node-graph based build system
==================================================

It's gonna be cool. With like kinetic realismistic wiring, with like double wires for "files with sourcemaps" that can be (automatically) split into single wires for things that don't support source maps.

Documentation That You Don't Need
=================================

## Copying

File → File (can rename)

`ffoobar.js` → `dist/ffoo.js`

Files → Folder

`ffoo.js`→ `dist/`

`foo/*` → `bar/`

(How do you distinguish between moving a folder to a folder vs renaming it and or stuff?)

## Concatenation

Multiple Files → File

`src/*.js` → `lib/bundle.js`

## Minification

for javascript: `src/*.js` → `lib/*.min.js`

for css: `src/*.css`→ `lib/*.min.css`

for both: `src/*` → `lib/*.min.*`


## Minification and Concatenation
`src/*.js` → `lib/bundle.min.js`

## Compilation
`.coffee` → `.js`

`um.js` → `ok.coffee`

`package.cson` → `.json`

`um.json` → `ok.cson`

`.coffee` → `.js`

`.scss` → `.css`

`.sass` → `.css`

`.styl` → `.css`

also templates maybe

## Packaging

Files or Folder → `.zip`

Files or Folder → `.tar`

Files or Folder → `.gz`

Files or Folder → `.tar.gz`

Files or Folder → `.tar.gz.zip.7z.cab`

(What if you wanted to package a set of directories seperately?)

## Downloading?

URL → Folder or Files

Fetches the URL with [`request`](https://github.com/mikeal/request)

## Uploading????

Files → URL

Sends an HTTP PUT request

also ftp maybe
