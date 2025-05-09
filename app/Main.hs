module Main where

import qualified MyLib (someFunc)
import Logger 

main :: IO ()
main =  Logger.runKatip
