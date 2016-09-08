
# Conversions

## Copying

### File → File (can move and rename)

`ffoobar.js` → `dist/ffoo.js`

special cases below

### Files → Folder

`ffoo.js`→ `dist/`

`foo/*` → `bar/`

### Folder → Folder

should disambiguate between copying to the given location and placing inside the given folder

`src/foo_bar/` → `dist/foo-bar` (probably want copy and rename)

`lib/` → `dist/` (might want place inside)

## Concatenation

### Multiple Files → File

`src/*.js` → `lib/bundle.js`

## Minification

for javascript: `src/*.js` → `lib/*.min.js`

for css: `src/*.css`→ `lib/*.min.css`

for both: `src/*` → `lib/*.min.*`


## Minification and Concatenation

`src/*.js` → `lib/bundle.min.js`

## Compilation / Transpilation

`.coffee` → `.js`

`.cson` → `.json`

`.ts` → `.js`

`.json5` → `.json`

`.scss` → `.css`

`.sass` → `.css`

`.styl` → `.css`

`.sss` → `.css`*

`.js` → `.coffee`**

`.json` → `.cson`**

also templates maybe*

*these can be more complicated

Blocks are usually simple input/output, but they could have options.

[PostCSS](http://postcss.org/) (including [SugarSS (`.sss`)](https://github.com/postcss/sugarss)) would need a complex plugin hopefully sharing an interface with a PostCSS playground.

**These transpilations are useful as one-offs in the [console](./README.md#console).

## Packaging / Compression

Files or Folder → `.zip`

Files or Folder → `.tar`

Files or Folder → `.gz`

Files or Folder → `.tar.gz`

Files or Folder → `.tar.xz`

Files or Folder → `.tar.gz.zip.7z.cab`

(What if you wanted to package a set of directories separately in batch?)

## Extraction / Decompression

`.zip` → Folder

`.tar` → Folder

`.gz` → Folder

`.tar.gz` → Folder

`.tar.xz` → Folder

`.tar.gz.zip.7z.cab` → Folder

## Downloading?

URL → Folder or Files

Fetches the URL with [`request`](https://github.com/mikeal/request)

## Uploading????

Files → URL

Sends an HTTP PUT request?

also FTP maybe, but this is already pretty uncommon
