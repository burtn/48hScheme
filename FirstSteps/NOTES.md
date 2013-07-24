# Notes [FirstSteps]

## General

For the time being I chose to skip over metions of the term `monads` as I didn't feel it was best explained on this page. This page introduces function definitions which are written `function = ....` and type signitures which contain `::`. These are important (see Ex 2 below). I addition the following functions are introduced:

+ `<-` for IO binding (assignment).
+ `putStrLn` for printing a string to the terminal (aka the command line).
+ `!!` as the index accessor.
+ `++` for concatenating lists.
+ A number of other list operators (strings are lists of type `Char`.) Best to keep a copy of that table.
+ `read` for converting strings to other types e.g. `"1" -> 1`.
+ `show` for converting other types to string e.g. `1 -> "1"`.

## Ex 1

Ex 1 is a simple read and understand the [provided code](). You need to know that `args <- getArgs` gets the command line arguments and places them in a list. Also how the `++` and `!!` operators are used for joining and indexing lists respectively. It's alo good to note that Haskell lists are 0 indexed. Since strings are just lists (`[Char]`) you can join them with the `++` operator whilst adding in the second command line argument using `[..] !! 1`. In my solution two names are expected as arguments and are joined together as shown: `putStrLn ("Hello, " ++ args !! 0 ++ ". Or is that " ++ args !! 1 ++ "?")` ([see full code](https://github.com/jake5991/48hScheme/blob/master/FirstSteps/FirstSteps-1.hs)).

Multiple command line arguments work when using `runHaskell` e.g. `runHaskell FirstSteps-1.hs Cake Jake` which should output `Hello, Cake. Or is that Jake?`.

## Ex 2

This was probably the hardest excersise and it took some playing around to get types to work correctly. Firstly though it highlightes the importance of brackets. For example this line `putStrLn(show ((cInt (args !! 0)) * (cInt (args !! 1))))` in my final solution throws errors of the brackets are out of place. Here the brackets ensure that the functions are evaluated in the correct order (`args !! 0` -> "1" cInt "1" -> 1` and so on). It's worth pointing out that my solution takes to numbers as arguments as prints the result of multiplying them e.g. `runHaskell FirstSteps-2.hs 2 4` prints out `8`. This is probably slightly more complicated than need be, it would have been simpler to join two strings since those functions are shown in the code already.

The second important thing is that the Haskell compiler is 'clever' it tries to guess the correct types for your expression to decide which function to evaluate. Take `read` for example. This is best shown with `ghci`, if you try to run `Prelude> read (head ["1", "2"])` you'll see what I mean (note: `head` returns the first element of a list).

In this case you get the following error.
```
<interactive>:6:1:
    No instance for (Read a0) arising from a use of `read'
    The type variable `a0' is ambiguous
    Possible fix: add a type signature that fixes these type variable(s)
    Note: there are several potential instances:
      instance Read () -- Defined in `GHC.Read'
      instance (Read a, Read b) => Read (a, b) -- Defined in `GHC.Read'
      instance (Read a, Read b, Read c) => Read (a, b, c)
        -- Defined in `GHC.Read'
      ...plus 25 others
    In the expression: read (head ["1", "2"])
    In an equation for `it': it = read (head ["1", "2"])
```

The most important line of this rather large error message is `The type variable `a0' is ambiguous`. This happens because `read` is a very general function and operates on a number of data types (a0 can be any data typee e.g. [1,2] or just 1 for example). In this case haskell cant decide which read it should call. You can find the complete [definition for read](http://www.haskell.org/onlinereport/standard-prelude.html#$vread in Prelude.hs. This is [polymorphic dispatch](http://en.wikipedia.org/wiki/Polymorphism_(computer_science)) and the result is that we need to make it clearer to the haskell compiler exactly what we want from our `read` call. One way of doing this is to define a function and tell haskell what that function expects. In my solution Idefined a function `cInt` whose name is somewhat misleading. It has a type signature that looks like `cInt :: String -> Integer` which can be read as _cInt takes a String and returns and Integer_ (the name is misleading because Int is different from Integer, the first being limited to 2<sup?31</sup> and the later growing magically). Haskell now knows that it should be passing a string to the cInt function so it calls the version of `read` which returns a string since cInt is defined as read (`cInt = read`). [See the full code](https://github.com/jake5991/48hScheme/blob/master/FirstSteps/FirstSteps-2.hs)

Note it is also possible to do this without defining a new function simply by telling read what type you want. As in `read (head ["1", "2"])::Int`.

## Ex 3

This excersise is simply to show the new function `getLine` which you can use as follows `name <- getLine` to read a line from the command prompt. The prompt starts on a new line. [See the full code](https://github.com/jake5991/48hScheme/blob/master/FirstSteps/FirstSteps-3.hs).
