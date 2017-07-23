main :: IO ()
main = do
    _ <- getLine
    getLine >>= print . (sum :: [Integer] -> Integer) . map read . words
