import Control.Applicative
import Control.Monad

main :: IO ()
main = do
  n <- readLn
  forM_ [1..n] $ \_ -> do
    input <- getLine
    putStrLn (brackets input "")

brackets :: String -> String -> String
brackets [] [] = "YES"
brackets (x:xs) ys | x `elem` "([{" = brackets xs (x:ys)
brackets (x:xs) (y:ys)
  | x == ')', y == '(' = brackets xs ys
  | x == ']', y == '[' = brackets xs ys
  | x == '}', y == '{' = brackets xs ys
brackets _ _ = "NO"
