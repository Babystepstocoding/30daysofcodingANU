{-# Language BangPatterns #-}
{-# OPTIONS_GHC -O3 #-}
import Control.Applicative
import Control.Monad
import System.IO
import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Read as T

main :: IO ()
main = do
   n <- readLn
   forM_ [1..n] $ \_ -> do
     m <- readLn
     input <- map ((\(Right (x,_)) -> fromIntegral x) . T.decimal) . T.words <$> T.getLine
     print (snd $ mergesort input m)


mergesort :: [Int] -> Int -> ([Int], Int)
mergesort [] 0 = ([],0)
mergesort [x] 1 = ([x],0)
mergesort xs !len = (merge' ys' zs',yn+zn+xn)
  where (ys,zs) = splitAt halflen xs
        (ys', yn) = mergesort ys halflen
        (zs', zn) = mergesort zs halflen'
        xn = merge ys' zs' halflen 0
        halflen = len `div` 2
        halflen' | even len = halflen
                 | otherwise = 1 + halflen

merge' :: [Int] -> [Int] -> [Int]
merge' [] ys = ys
merge' xs [] = xs
merge' l@(x:xs) r@(y:ys) | x <= y = x : merge' xs r
                         | otherwise = y : merge' l ys

merge :: [Int] -> [Int] -> Int -> Int -> Int
merge [] ys _ acc = acc
merge xs [] _ acc = acc
merge (x:xs) (y:ys) !len !acc
  | x <= y = merge xs (y:ys) (len-1) acc
  | otherwise = merge (x:xs) ys len (acc+len)
