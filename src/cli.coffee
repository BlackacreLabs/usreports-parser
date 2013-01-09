# CLI script

dumpTokens = (tokens) ->
  for token in tokens
    if tokens.length > 1
      console.log token[0] + ": " + token[1]

FORMATS =
  plain: require './plaintext'
  tokens: dumpTokens

formats = (k for k of FORMATS)

args = require('optimist')
  .usage('Usage: $0 [Options] [FILE]')
  .alias('f', 'format')
  .describe('f', 'output format: ' + formats.join ' | ')
  .check((argv) ->
    unless formats.indexOf(argv.format) > -1
      throw "Invalid format."
  ).argv

input = args._[0]
input ?= '/dev/stdin/'

fs = require 'fs'
fs.readFile input, 'utf8', (err, data) ->
  throw err if err
  processJSON(JSON.parse(data))

plainText = require './plaintext'

processJSON = FORMATS[args.format]
