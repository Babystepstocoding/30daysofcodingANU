readInts :: IO [Int]
readInts = map read . words <$> getLine

main :: IO ()
main = do
    bob <- readInts
    alice <- readInts
    putStrLn $ show (length $ filter id $ zipWith (>) bob alice) ++ " " ++ show (length $ filter id $ zipWith (<) bob alice)
