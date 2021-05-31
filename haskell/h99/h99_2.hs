myButLast::[a] -> a
myButLast [] = error "Empty LIST!!"
myButLast (x:_:[]) = x
myButLast (_:xs) = myButLast xs
