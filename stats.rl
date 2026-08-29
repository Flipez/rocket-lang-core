// Summary statistics over arrays of numbers.

export def Min(numbers)
  if numbers.size() == 0
    return nil
  end
  lowest = numbers.first()
  foreach n in numbers
    if n < lowest
      lowest = n
    end
  end
  return lowest
end

export def Max(numbers)
  if numbers.size() == 0
    return nil
  end
  highest = numbers.first()
  foreach n in numbers
    if n > highest
      highest = n
    end
  end
  return highest
end

// Mean returns a float, so an average is not silently truncated the way
// integer division would truncate it.
export def Mean(numbers)
  if numbers.size() == 0
    return nil
  end
  return numbers.sum().to_f() / numbers.size().to_f()
end

export def Median(numbers)
  if numbers.size() == 0
    return nil
  end
  sorted = numbers.sort()
  middle = sorted.size() / 2
  if sorted.size() % 2 == 1
    return sorted[middle].to_f()
  end
  return (sorted[middle - 1].to_f() + sorted[middle].to_f()) / 2.0
end
