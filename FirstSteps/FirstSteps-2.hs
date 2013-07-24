module Main where
import System.Environment

cInt :: String -> Integer
cInt = read
    
main :: IO ()
main = do
    args <- getArgs
    putStrLn(show ((cInt (args !! 0)) * (cInt (args !! 1))))