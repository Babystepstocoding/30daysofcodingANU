import Data.List
simplifyPath path = go (filter (not . null) (splitOn '/' path)) []

go [] acc = '/': (concat $ intersperse "/" $ reverse acc)
go (x:xs) acc
  | x == "." = go xs acc
  | x == ".." = case acc of
    [] -> go xs acc
    (_:acc') -> go xs acc'
  | otherwise = go xs (x:acc)

splitOn x [] = [[]]
splitOn x (c:cs)
  | x == c = []:splitOn x cs
  | otherwise = let (y:ys) = splitOn x cs in (c:y):ys

