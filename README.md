underscore-js-externs
=====================

This file provides externs for the Underscore js library, version 1.3.3,
for use with Google's Closure Compiler.

It covers both object-style notation (\_.detect(array, function())), as
well as functional style (\_(array).detect(function() {})).

Bug reports, pull requests are welcome.

## Testing the externs

The quick and dirty approach that is currently taken to "testing" the
externs (i.e. ensuring that all necessary underscore methods are
defined, that they specify the right parameters and return types, etc.)
is to just grab the qunit test code from the underscore library, specify
some additional externs for qunit and json, and run the qunit underscore
tests through Closure Compiler with advanced optimizations on.

You can do this for yourself thus.

- install closure compiler
- make sure ruby is installed
- `export CC_PATH={path/to/compiler.jar}`
- from this directory: `cd test && ruby compile_javascript.rb`

This will spit out a bunch of errors. Most of them are irrelevant,
related to missing jQuery externs, etc.

## Tags

I've begun creating tags for the appropriate version of underscore.

Currently only 1.3.3 and 1.4.3 are tagged.
