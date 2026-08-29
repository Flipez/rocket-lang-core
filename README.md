# rocket-lang-core

Generic helpers for [RocketLang](https://github.com/flipez/rocket-lang),
distributed as a planet.

## Install

```
rocket-lang planet get flipez/rocket-lang-core@main
```

That installs it as `core`, so each module is imported as `core/<module>`:

```js
import "core/list" as list
import "core/strings" as strings
import "core/stats" as stats
```

## Modules

### `list` — higher-order helpers for arrays

RocketLang arrays have no `map`, `filter` or `reduce`. Functions are values, so
these are written in the language itself.

```js
import "core/list" as list

list.Map([1, 2, 3], def(n) return n * 2 end)              // [2, 4, 6]
list.Filter([1, 2, 3, 4], def(n) return n % 2 == 0 end)   // [2, 4]
list.Reduce([1, 2, 3, 4], 0, def(a, b) return a + b end)  // 10
list.Find([1, 5, 8], def(n) return n > 4 end)             // 5
list.Any([1, 2], def(n) return n > 1 end)                 // true
list.All([2, 4], def(n) return n % 2 == 0 end)            // true

list.Each(["a", "b"], def(s) puts(s) end)
```

### `strings` — string helpers

```js
import "core/strings" as strings

strings.StartsWith("hello", "he")        // true
strings.EndsWith("hello", "lo")          // true
strings.Repeat("ab", 3)                  // "ababab"
strings.PadLeft("7", 3, "0")             // "007"
strings.PadRight("7", 3, ".")            // "7.."
strings.TitleCase("hello wide world")    // "Hello Wide World"
```

### `stats` — summary statistics

```js
import "core/stats" as stats

stats.Min([3, 1, 2])        // 1
stats.Max([3, 1, 2])        // 3
stats.Mean([1, 2])          // 1.5
stats.Median([4, 1, 3, 2])  // 2.5
```

`Mean` and `Median` return floats deliberately. Dividing two integers in
RocketLang yields an integer, so `[1, 2].sum() / 2` would be `1` rather than
`1.5`.

Each returns `nil` for an empty array rather than raising.

### `utils`

```js
import "core/utils" as utils

utils.Hello()   // Hello from rocket-lang-core
```

## Requirements

RocketLang 0.24 or newer: planets, and the explicit `export` keyword these
modules rely on, were introduced there.
