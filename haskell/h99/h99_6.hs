isPalindrome::(Eq a) => [a] -> Bool
isPalindrome xs
	| foldl (flip (:)) [] xs == xs = True
	| otherwise 		       = False
