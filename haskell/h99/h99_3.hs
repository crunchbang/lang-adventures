elementAt::(Eq a, Num a) => [t] -> a -> t
elementAt [] _ = error "NO ELEMENTS TO RETURN"
elementAt (x:xs) n
	| n == 1 = x
	| otherwise = elementAt xs (n-1)
	 
