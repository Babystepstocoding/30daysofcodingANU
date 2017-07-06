main = do
  mealCost <- readLn
  tip <- readLn
  tax <- readLn
  let res = (round :: Double -> Int) $ mealCost + 0.01*mealCost*tip + 0.01*mealCost*tax
  putStrLn $ "The total meal cost is " ++ show res ++ " dollars."
  
