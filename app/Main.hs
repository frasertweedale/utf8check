module Main where

import System.Environment (getArgs, getProgName)
import System.Exit (die)
import Text.Utf8check
import qualified Data.ByteString as B

main :: IO ()
main = do
  args <- getArgs
  input <- case args of
    [] -> B.getContents
    ["-"] -> B.getContents
    [path] -> B.readFile path
    _ -> getProgName >>= \name -> die $ "usage: " <> name <> " [FILE]"
  case utf8check input of
    True -> putStrLn "it is valid"
    False -> die "it is not valid"
