module Main where
import System.Environment


main :: IO ()
main = do args <- getArgs
          sum <- (read (args !! 0)) + (read (args !! 1))
          putStrLn ("Sum: " ++ (show sum))
          
