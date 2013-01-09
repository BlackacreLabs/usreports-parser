exports.LIGATURES =
  ﬁ: 'fi'
  ﬂ: 'fl'
  ﬀ: 'ff'
  ﬃ: 'ffi'
  ﬄ: 'ffl'

exports.SOFT_HYPHEN = "\u00AD"

module.exports.replaceLigatures = (chars) ->
  for from, to of exports.LIGATURES
    chars = chars.replace(from, to, 'g')
  chars
