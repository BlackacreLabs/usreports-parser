characters = require './characters'

sanitize = (chars) ->
  chars = characters.replaceLigatures(chars)
  chars.replace(characters.SOFT_HYPHEN, '-', 'g')

write = (string) ->
  process.stdout.write(string)

controlToken = (type) ->
  switch type
    when 'S'
      write ' '
    when 'LINE'
      write "\n"
    when 'INDENT'
      write "    "
    when 'FOOT'
      write "\n-----------\n\n"
    when 'PAGE'
      write "\n**********\n**********\n\n"

module.exports = (tokens) ->
  for token in tokens
    type = token[0]
    text = token[1]
    if token.length == 2
      write sanitize(text)
    else
      controlToken type
