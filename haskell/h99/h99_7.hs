--flatten :: [[[a]]] -> [a]
flatten (x:xs) = flatten xs 
