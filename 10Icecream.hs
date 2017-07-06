import Control.Applicative
import Control.Monad
import Data.Array
import Data.List hiding (find)
import Data.Ord
import System.IO
import Prelude hiding (find)

iceCream :: Int -> Int -> [(Int,Int)] -> Array Int (Int,Int) -> (Int,Int)
iceCream money n creams arr = go creams
  where go ((id,cost):cs) = case find arr (money - cost) id of
          Just (id',cost') -> if (id < id') then (id,id') else (id',id)
          Nothing -> go cs

find :: Array Int (Int,Int) -> Int -> Int -> Maybe (Int,Int)
find arr target butNot = uncurry go (bounds arr) 
  where 
    go lo hi | lo > hi = Nothing
             | lo == hi = let (a,b) = arr ! lo in if (a /= butNot) && b == target then Just (a,b) else Nothing
             | lo+1 == hi = case go lo lo of
               Nothing -> go hi hi
               c -> c
             | otherwise = let curr = (lo+hi) `div` 2 in
                           let (a,b) = arr ! curr in
                           case compare target b of
                             LT -> go lo curr
                             GT -> go curr hi
                             EQ | a /= butNot -> Just (a,b)
                                | otherwise -> case go lo curr of
                                    Nothing -> go curr hi
                                    c -> c

main :: IO ()
main = do
    trips <- readLn
    forM_ [1..trips] $ \_ -> do
      money <- readLn
      n <- readLn
      icecreams <- zip [1..] . map read . words <$> getLine
      let (x1,x2) = iceCream money n icecreams (listArray (1,n) $ sortBy (comparing snd) icecreams)
      putStrLn (show x1 ++ " " ++ show x2)

