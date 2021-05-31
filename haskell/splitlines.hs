
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
