fs    = require 'fs'
plist = require 'plist'

module.exports = ->
  options = require('dreamopt') [
    "Usage: plist-to-json [options] source.plist"

    "Arguments:"
    "  source.plist       Source file to output as JSON #required #var(sourceFile)"

    "Options:"
    "  -i, --indent SIZE  Indentation size for pretty-printing the output file (defaults to 2)"
  ]

  await fs.readFile options.sourceFile, 'utf8', defer(err, data)
  if err
    process.stderr.write "Cannot read file #{options.sourceFile}: #{err.stack || err.message || err}\n"
    process.exit 1

  await plist.parseString data, defer(err, obj)
  if err
    process.stderr.write "Failed to parse file #{options.sourceFile}: #{err.stack || err.message || err}\n"
    process.exit 1

  if options.indent == "\\t"
    options.indent = "\t"

  data = JSON.stringify(obj, null, options.indent)
  process.stdout.write data.trim() + "\n"
