myLast :: [a] -> a
myLast []     = error "Empty List"
myLast [x]    = x
myLast (x:xs) = myLast xs
