# rocket-lang-core

Generic helpers for [RocketLang](https://github.com/flipez/rocket-lang),
distributed as a planet.

## Install

```
rocket-lang planet get flipez/rocket-lang-core
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

list.map([1, 2, 3], def(n) return n * 2 end)              // [2, 4, 6]
list.filter([1, 2, 3, 4], def(n) return n % 2 == 0 end)   // [2, 4]
list.reduce([1, 2, 3, 4], 0, def(a, b) return a + b end)  // 10
list.find([1, 5, 8], def(n) return n > 4 end)             // 5
list.any?([1, 2], def(n) return n > 1 end)                // true
list.all?([2, 4], def(n) return n % 2 == 0 end)           // true

list.each(["a", "b"], def(s) puts(s) end)
```

### `strings` — string helpers

```js
import "core/strings" as strings

strings.starts_with?("hello", "he")      // true
strings.ends_with?("hello", "lo")        // true
strings.repeat("ab", 3)                  // "ababab"
strings.pad_left("7", 3, "0")            // "007"
strings.pad_right("7", 3, ".")           // "7.."
strings.title_case("hello wide world")   // "Hello Wide World"
```

### `stats` — summary statistics

```js
import "core/stats" as stats

stats.min([3, 1, 2])        // 1
stats.max([3, 1, 2])        // 3
stats.mean([1, 2])          // 1.5
stats.median([4, 1, 3, 2])  // 2.5
```

`mean` and `median` return floats deliberately. Dividing two integers in
RocketLang yields an integer, so `[1, 2].sum() / 2` would be `1` rather than
`1.5`.

Each returns `nil` for an empty array rather than raising.

### `utils`

```js
import "core/utils" as utils

utils.hello()   // Hello from rocket-lang-core
```

## Requirements

RocketLang 0.24 or newer: planets, and the explicit `export` keyword these
modules rely on, were introduced there.

## A note on naming

Everything here is lowercase, matching the language's own methods (`upcase`,
`to_s`, `include?`). Capitalization carries no meaning in RocketLang —
`export` is what decides whether a name is public, so an unexported
`Helper` stays private and an exported `helper` does not.
