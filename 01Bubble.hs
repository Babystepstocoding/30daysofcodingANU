{-# Language BangPatterns #-}

main :: IO ()
main = do
  _ <- getLine
  (elems, swaps) <- bubbleSort 0 . map read . words <$> getLine
  putStrLn $ "Array is sorted in " ++ show swaps ++ " swaps."
  putStr "First Element: "
  print (head elems)
  putStr "Last Element: "
  print (last elems)

bubbleSort :: Integer -> [Integer] -> ([Integer], Integer)
bubbleSort n xs = case bubble 0 xs of
  (xs', 0) -> (xs', n)
  (xs', m) -> bubbleSort (n+m) xs'

bubble :: Integer -> [Integer] -> ([Integer], Integer)
bubble !n (x:y:zs)
  | x <= y = let (res, m) = bubble n (y:zs) in (x:res,m)
  | otherwise = let (res, m) = bubble (n+1) (x:zs) in (y:res,m)
bubble !n x = (x,n)
