// Higher-order helpers for arrays. RocketLang has no map, filter or reduce of
// its own, but functions are values, so they can be written in the language.

export def Each(items, fn)
  foreach item in items
    fn(item)
  end
  return nil
end

export def Map(items, fn)
  result = []
  foreach item in items
    result.push(fn(item))
  end
  return result
end

export def Filter(items, fn)
  result = []
  foreach item in items
    if fn(item)
      result.push(item)
    end
  end
  return result
end

export def Reduce(items, initial, fn)
  carry = initial
  foreach item in items
    carry = fn(carry, item)
  end
  return carry
end

export def Find(items, fn)
  foreach item in items
    if fn(item)
      return item
    end
  end
  return nil
end

export def Any(items, fn)
  foreach item in items
    if fn(item)
      return true
    end
  end
  return false
end

export def All(items, fn)
  foreach item in items
    if !fn(item)
      return false
    end
  end
  return true
end
