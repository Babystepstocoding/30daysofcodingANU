composeRanges = go Nothing
  where 
    go Nothing [] = []
    go (Just (start,curr)) []
      | start /= curr = [show start ++ "->" ++ show curr]
      | otherwise = [show curr]
    go Nothing [x] = [show x]
    go Nothing (x:xs) = go (Just (x,x)) xs
    go (Just (start,curr)) (x:xs)
      | x == curr+1 = go (Just (start,curr+1)) xs
      | start==curr = show start: go (Just (x,x)) xs
      | otherwise = (show start ++ "->" ++ show curr):go (Just (x,x)) xs
  
