import Data.Char (digitToInt, isSpace, isUpper)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr func []
    where func x y | p x       = x : y
                   | otherwise = y

foldrMap :: (a -> b) -> [a] -> [b]
foldrMap f = foldr ((:) . f) []

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f acc xs = foldr (flip f) acc (reverse xs)

asInt :: String -> Int
asInt ('-':xs) = negate(asInt xs)
asInt xs       = foldl ((+).(*10)) 0 (map digitToInt xs)

myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ []    = []
myTakeWhile p (x:xs) | p x       = x : myTakeWhile p xs
                     | otherwise = myTakeWhile p xs

takeWhileFold :: (a -> Bool) -> [a] -> [a]
takeWhileFold p xs = foldr (\x acc -> if p x then x:acc else []) [] xs

foldrCycle :: [a] -> [a]
foldrCycle xs = foldr (:) (foldrCycle xs) xs

foldrAny :: (a -> Bool) -> [a] -> Bool
foldrAny p = foldr ((||) . p) False 

-- TODO
-- words
-- unlines
-- groupBy
--  using folds

wordCount :: String -> Int
wordCount  = length . filter (isUpper . head) . words
