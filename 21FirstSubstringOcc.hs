{-# Language BangPatterns #-}

import Data.Array
import Data.Array.ST
import Control.Monad.ST

findFirstSubstringOccurrence s x = go 0 0
  where 
    lens = length s
    lenx = length x
    sarr = array (0,lens-1) (zip [0..] s)
    xarr = array (0,lenx-1) (zip [0..] x)
    t = runSTArray $ do
      arr <- newArray (0,lenx-1) (-1)
      construct arr 1 0
      return arr
      where
        construct :: (STArray s Int Int) -> Int -> Int -> ST s ()
        construct arr !pos !cnd
          | pos >= lenx = return ()
          | (xarr ! pos) == (xarr ! cnd) = do
            newVal <- readArray arr cnd
            writeArray arr pos newVal
            construct arr (pos+1) (cnd+1)
          | otherwise = do
            writeArray arr pos cnd
            cnd' <- loop arr cnd
            construct arr (pos+1) (cnd+1)
          where 
            loop :: (STArray s Int Int) -> Int -> ST s Int
            loop arr cnd = do
                  cnd' <- readArray arr cnd
                  if cnd' >= 0 && xarr!pos /= xarr!cnd then loop arr cnd' else return cnd'
    go !m !i 
      | m + i >= lens = -1 
      | xarr!i == sarr!(m+i) = if i+1 == lenx then m else go m (i+1)
      | (t!i) > (-1) = go (m+i-(t!i)) (t!i)
      | otherwise = go (m+i+1) 0
