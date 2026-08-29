// String helpers that the STRING literal does not provide.

export def StartsWith(s, prefix)
  if prefix.size() > s.size()
    return false
  end
  return s[0:prefix.size()] == prefix
end

export def EndsWith(s, suffix)
  if suffix.size() > s.size()
    return false
  end
  return s[s.size() - suffix.size():] == suffix
end

export def Repeat(s, times)
  out = ""
  foreach i in times
    out = out + s
  end
  return out
end

export def PadLeft(s, width, pad)
  out = s
  while out.size() < width
    out = pad + out
  end
  return out
end

export def PadRight(s, width, pad)
  out = s
  while out.size() < width
    out = out + pad
  end
  return out
end

// TitleCase uppercases the first character of each space-separated word.
export def TitleCase(s)
  words = []
  foreach word in s.split(" ")
    if word.size() == 0
      words.push(word)
    else
      words.push(word[0:1].upcase() + word[1:])
    end
  end
  return words.join(" ")
end
