main :: IO ()
main = getLine >> interact (unwords . reverse . words)
