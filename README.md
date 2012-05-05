plist-to-json
=============

We all made this mistake at least once: deciding that plist is an ideal format for some piece of data. Once you realize your wrongdoings, this tool will help you liberate your data.


Installation
------------

    npm install plist-to-json


Usage
-----

As per --help:

    Usage: plist-to-json [options] source.plist

    Arguments:
      source.plist          Source file to output as JSON

    Options:
      -i, --indent SIZE     Indentation size for pretty-printing the output file (defaults to 2)
      -h, --help            Display this usage information

Outputs the result on stdout.

Note: only works with XML plists. If you have a binary (or, heaven forbid, an old-school TextMatish one), run it through the following built-in command first (beware, this one modifies the plist in-place):

    plutil -convert xml1 exbinary.plist
