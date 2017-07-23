import Control.Monad

main :: IO ()
main = do
  _ <- getLine
  interact (unlines . map (\x -> if isPrime (read x) then "Prime" else "Not prime") . lines)

isPrime :: Int -> Bool
isPrime n | n <= 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime n | even n = False
          | n `mod` 3 == 0 = False
isPrime n = isPrime_ 1 
  where
    isPrime_ k = ((6*k-1)^2>n) || (n `mod` (6*k+1) /= 0 && n `mod` (6*k-1) /= 0 && isPrime_ (k+1))
      
