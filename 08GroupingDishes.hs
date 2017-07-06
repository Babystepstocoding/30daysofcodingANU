import Data.Map.Strict (Map)
import qualified Data.Map as M
import Data.List

groupingDishes :: [[String]] -> [[String]]
groupingDishes dishes = sort $ [x:sort xs | (x,xs@(_:_:_)) <- M.toList thing]
  where 
    thing = foldl' (\m x -> foldl' (\m' x' -> M.alter (add (head x)) x' m') m (tail x)) M.empty dishes
    add x Nothing = Just [x]
    add x (Just xs) = Just (if x `elem` xs then xs else (x:xs))
