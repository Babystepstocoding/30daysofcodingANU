{-# Language BangPatterns #-}
import Data.Array

bound = 10^9+7

mapDecoding "" = 1
mapDecoding message = arr ! 1
  where
    messlen = length message
    messarr = array (1,messlen) $ zip [1..] message
    arr = array (1,messlen) [(i, f i) | i <- [1..messlen]]
    f n 
      | n == messlen = if curr == '0' then 0 else 1
      | curr >= '3' = arr ! (n+1)
      | curr == '0' = 0
      | n == (messlen -1), next /= '0' = if curr == '1' || next <= '6' then 2 else 1
      | n == (messlen -1) = 1
      | curr == '1' || next <= '6' = ((arr ! (n+1)) + (arr ! (n+2))) `mod` bound
      | otherwise = arr ! (n+1)
      where curr = messarr ! n
            next = messarr ! (n+1)
  
