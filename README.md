# 48hScheme

Solutions and notes for [Write Yourself a Scheme in 48 Hours](http://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours).

---

# Env

I used the [Haskell Platform](http://www.haskell.org/platform/). This allows you to install [Parsec](http://legacy.cs.uu.nl/daan/download/parsec/parsec.html) with cabal like so:

```
cabal update
cabal install Parsec
```

## Running Code

I used `runHaskell x.hs` to run my haskell code rather than compiling each time. I used `ghci` to test out various functions by importing them with `:import x.hs`. You might also find it useful to know that `--` starts a comment that runs to the end of the line. Note though the Haskell wiki calls out comments as bad.

##  Organisation

This repository is layed out in the following manner:

+ Each page coresponds to a directory e.g. The [First Steps](http://en.wikibooks.org/wiki/Write_Yourself_a_Scheme_in_48_Hours/First_Steps#Presentation) book page corresponds to the [FirstPage](https://github.com/jake5991/48hScheme/tree/master/FirstSteps) directory in this repository. Note that directory names have no spaces.
+ Each directory contains the code provided on that page verbatim in a file of the same name e.g. the code from First Steps is given verbatim in [FirstSteps.hs](https://github.com/jake5991/48hScheme/blob/master/FirstSteps/FirstSteps.hs).
+ Each excersise solution is contained within the `page-exercise_number.hs` file e.g. Ex 1 of First Steps is contained in [FirstSteps-1.hs](https://github.com/jake5991/48hScheme/blob/master/FirstSteps/FirstSteps-1.hs).
+ Each directory also contains a `NOTES.md` file which contains any notes I made whilst reading/completing the page exercises.

## Contribute

If you think the code here is bad, [open an issue](https://github.com/jake5991/48hScheme/issues) with your solution and a _thorough_ explanation of why your code is better.

## Licence

Refer to the [LICENSE file](https://github.com/jake5991/48hScheme/blob/master/LICENSE).
