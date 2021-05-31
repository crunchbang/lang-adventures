import System.Environment (getArgs)

interactWith function inputFile outputFile = do
        input <- readFile inputFile
        writeFile outputFile (function input)

fixLines :: String -> String
fixLines input = unlines (splitLines input)

splitLines :: String -> [String]
splitLines [] = []
splitLines ln = 
        let (pre, suf) = break isLineTerminator ln
            in pre : case suf of
                         ('\r' :'\n' :rest) -> splitLines rest
                         ('\r' : rest)      -> splitLines rest
                         ('\n' :rest)       -> splitLines rest
                         _                  -> []

isLineTerminator c = c == '\n' || c == '\r'

main = mainWith myFunction
    where mainWith function = do args <- getArgs
                                 case args of
                                     [input, output] -> interactWith function input output 
                                     _ -> putStrLn "error: exactly 2 args needed"
          myFunction = fixLines
