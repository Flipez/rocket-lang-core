// String helpers that the STRING literal does not provide.

export def starts_with?(s, prefix)
  if prefix.size() > s.size()
    return false
  end
  return s[0:prefix.size()] == prefix
end

export def ends_with?(s, suffix)
  if suffix.size() > s.size()
    return false
  end
  return s[s.size() - suffix.size():] == suffix
end

export def repeat(s, times)
  out = ""
  foreach i in times
    out = out + s
  end
  return out
end

export def pad_left(s, width, pad)
  out = s
  while out.size() < width
    out = pad + out
  end
  return out
end

export def pad_right(s, width, pad)
  out = s
  while out.size() < width
    out = out + pad
  end
  return out
end

// title_case uppercases the first character of each space-separated word.
export def title_case(s)
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
