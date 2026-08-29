// Higher-order helpers for arrays. RocketLang has no map, filter or reduce of
// its own, but functions are values, so they can be written in the language.
//
// Names are lowercase to match the language's own methods (upcase, to_s,
// include?). Capitalization carries no meaning: `export` decides what is
// public.

export def each(items, fn)
  foreach item in items
    fn(item)
  end
  return nil
end

export def map(items, fn)
  result = []
  foreach item in items
    result.push(fn(item))
  end
  return result
end

export def filter(items, fn)
  result = []
  foreach item in items
    if fn(item)
      result.push(item)
    end
  end
  return result
end

export def reduce(items, initial, fn)
  carry = initial
  foreach item in items
    carry = fn(carry, item)
  end
  return carry
end

export def find(items, fn)
  foreach item in items
    if fn(item)
      return item
    end
  end
  return nil
end

export def any?(items, fn)
  foreach item in items
    if fn(item)
      return true
    end
  end
  return false
end

export def all?(items, fn)
  foreach item in items
    if !fn(item)
      return false
    end
  end
  return true
end
