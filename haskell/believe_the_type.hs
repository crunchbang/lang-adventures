import Data.List

data Cartesian2D = Cartesian2D Double Double
                 deriving (Eq, Show)

data Polar2D = Polar2D Double Double
             deriving (Eq, Show)

data BookInfo = Book Int String [String]
              deriving (Show)

nicerID :: BookInfo -> Int
nicerID      (Book id _     _      ) = id

nicerTitle :: BookInfo -> String
nicerTitle   (Book _  title _      ) = title

nicerAuthors :: BookInfo -> [String]
nicerAuthors (Book _  _     authors) = authors


data Customer = Customer {
              customerID      :: Int,
              customerName    :: String,
              customerAddress :: [String]
              } deriving (Show)


data List a = Cons a (List a)
            | Nil
            deriving (Show)

toList :: [a] -> List a
toList (x:xs) = Cons x (toList xs)
toList [] = Nil

fromList :: List a -> [a]
fromList (Cons x xs) = x : fromList xs
fromList Nil         = []

data MyTree a = MyNode a (Maybe a) (Maybe a)
            deriving (Show)

pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
    where plural 0 = "no"   ++ word ++ "s"
          plural 1 = "one"  ++ word 
          plural n = show n ++ word ++ "s"

nElem :: [a] -> Int
nElem [] = 0
nElem (x:xs) = 1 + nElem xs

meanList :: (Fractional a) => [a] -> a
meanList [] = 0.0
meanList x  = (sum x) / (fromIntegral (length x)) 

toPalindrome :: [a] -> [a]
toPalindrome xs = xs ++ (reverse xs)

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs
    |xs == reverse xs = True
    |otherwise        = False

compareLists ::(Ord a) => [a] -> [a] -> Ordering
compareLists a b = compare (length a) (length b)

sortList :: (Ord a) => [[a]] -> [[a]]
sortList xs = sortBy compareLists xs

intersperse' :: a -> [[a]] -> [a]
intersperse' _   [x] = x
intersperse' sep (x:xs) = x ++ [sep] ++ (intersperse' sep xs)

data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

treeHeight :: Tree a -> Int 
treeHeight Empty = 0
treeHeight (Node x left right) = 1 + max (treeHeight left) (treeHeight right)
