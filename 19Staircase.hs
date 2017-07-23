import Data.Array

main :: IO ()
main = do
    _ <- getLine
    interact (unlines . map (show.stairs.read) . lines)
    
stairs :: Int -> Int
stairs n = arr ! n
  where arr = array (1,n) [(i, f i)|  i <- [1..n]]
        f 0 = 1
        f 1 = 1
        f 2 = 2
        f 3 = 4
        f n = arr ! (n-1) + arr ! (n-2) + arr ! (n-3)
