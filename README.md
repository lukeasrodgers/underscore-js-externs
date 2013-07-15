# underscore-js-externs

This file provides externs for the Underscore js library for use with
Google's Closure Compiler.

Extern files currently exist for the following versions: 

- 1.3.3
- 1.4.3
- 1.4.4
- 1.5.0

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
- from this directory, `cd` to the appropriate test directory
- `ruby test_externs.rb`

This will spit out a bunch of errors. Most of them are irrelevant,
related to missing jQuery externs, etc.
