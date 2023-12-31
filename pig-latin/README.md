# Pig Latin

Welcome to Pig Latin on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Implement a program that translates from English to Pig Latin.

Pig Latin is a made-up children's language that's intended to be confusing.
It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

- **Rule 1**: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
  Please note that "xr" and "yt" at the beginning of a word make vowel sounds (e.g. "xray" -> "xrayay", "yttria" -> "yttriaay").
- **Rule 2**: If a word begins with a consonant sound, move it to the end of the word and then add an "ay" sound to the end of the word.
  Consonant sounds can be made up of multiple consonants, such as the "ch" in "chair" or "st" in "stand" (e.g. "chair" -> "airchay").
- **Rule 3**: If a word starts with a consonant sound followed by "qu", move it to the end of the word, and then add an "ay" sound to the end of the word (e.g. "square" -> "aresquay").
- **Rule 4**: If a word contains a "y" after a consonant cluster or as the second letter in a two letter word it makes a vowel sound (e.g. "rhythm" -> "ythmrhay", "my" -> "ymay").

There are a few more rules for edge cases, and there are regional variants too.
Check the tests for all the details.

Read more about [Pig Latin on Wikipedia][pig-latin].

[pig-latin]: https://en.wikipedia.org/wiki/Pig_latin

The unit tests provide examples of words. Try and cluster consonants
independent of the specific combinations of consonants in the unit tests.

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- Read about [string types](https://haskell-lang.org/tutorial/string-types) in Haskell.
- Add `- text` to your list of dependencies in package.yaml.
- Import `Data.Text` in [the following way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

      import qualified Data.Text as T
      import           Data.Text (Text)

- You can now write e.g. `translate :: Text -> Text` and refer to `Data.Text` combinators as e.g. `T.isSuffixOf`.
- Look up the documentation for [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html),

This part is entirely optional.

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @kytrinyx
- @lpalma
- @navarrorc
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane

### Based on

The Pig Latin exercise at Test First Teaching by Ultrasaurus - https://github.com/ultrasaurus/test-first-teaching/blob/master/learn_ruby/pig_latin/