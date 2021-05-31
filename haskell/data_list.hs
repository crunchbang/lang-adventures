import Data.List

myLength :: [a] -> Int
myLength []     = 0
myLength (x:xs) = 1 + myLength xs

myNull :: [a] -> Bool
myNull [] = True
myNull _  = False

myHead :: [a] -> a
myHead []     = error "Empty list"
myHead (x:xs) = x

myTail :: [a] -> [a]
myTail []     = error "Empty list"
myTail (x:xs) = xs

myLast :: [a] -> a
myLast []     = error "Empty list"
myLast (x:[]) = x
myLast (x:xs) = myLast xs

myInit :: [a] -> [a]
myInit []     = error "Empty list"
myInit (x:[]) = []
myInit (x:xs) = x : myInit xs

myAppend :: [a] -> [a] -> [a]
myAppend xs     [] = xs
myAppend []     ys = ys
myAppend (x:xs) ys = x : myAppend xs ys

myConcat :: [[a]] -> [a]
myConcat []     = []
myConcat (xs:xss) = xs ++ myConcat xss

myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]

myAnd :: [Bool] -> Bool
myAnd []     = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

myAll :: (a -> Bool) -> [a] -> Bool
myAll _ []     = True
myAll p (x:xs) = (p x) && myAll p xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny p (x:xs) = (p x) || myAny p xs

myDrop :: Int -> [a] -> [a]
myDrop 0 xs  = xs
myDrop _ []  = []
myDrop n (x:xs)  = myDrop (n - 1) xs

myTake :: Int -> [a] -> [a]
myTake 0 _      = []
myTake _ []     = []
myTake n (x:xs) = x : myTake (n-1) xs

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt n xs = (myTake n xs, myDrop n xs)

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p (x:xs)
        | p x       = x : myTakeWhile p xs
        | otherwise = []

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile p (x:xs)
        | p x       = myDropWhile p xs
        | not (p x) = (x:xs)

mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan p xs = (myTakeWhile p xs, 
               myDropWhile p xs)

myElem :: (Eq a) => a -> [a] -> Bool
myElem _ []     = False
myElem e (x:xs) 
        | e == x    = True
        | otherwise = myElem e xs

myNotElem :: (Eq a) => a -> [a] -> Bool
myNotElem _ []     = True
myNotElem e (x:xs) 
        | e == x    = False
        | otherwise = myNotElem e xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []     = []
myFilter p (x:xs) 
        | p x       = x : myFilter p xs
        | otherwise = myFilter p xs

myIsPrefixOf :: (Eq a) => [a] -> [a] -> Bool
myIsPrefixOf _      []    = False
myIsPrefixOf []     _     = True
myIsPrefixOf (x:xs) (y:ys)
        | x == y    = myIsPrefixOf xs ys
        | otherwise = False

myIsSuffixOf :: (Eq a) => [a] -> [a] -> Bool
myIsSuffixOf _  [] = False
myIsSuffixOf [] _  = True
myIsSuffixOf xs ys = myIsPrefixOf (reverse xs)
                                (reverse ys) 

myZip :: [a] -> [b] -> [(a, b)]
myZip []     _      = []
myZip _      []     = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f [] _   = []
myZipWith f _  [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

safeHead :: [a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = Just x

safeLast :: [a] -> Maybe a
safeLast []     = Nothing
safeLast [x]    = Just x
safeLast (x:xs) = safeLast xs

safeTail :: [a] -> Maybe [a]
safeTail []     = Nothing
safeTail (x:xs) = Just xs

safeListFunc f [] = Nothing
safeListFunc f xs = Just (f xs)

safeInit :: [a] -> Maybe [a]
safeInit = safeListFunc init 

--print each line

myTranspose :: String -> String
myTranspose ln = unlines $ transpose $ lines ln
