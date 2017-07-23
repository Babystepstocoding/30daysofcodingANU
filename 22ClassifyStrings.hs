data Thing = Good | Bad | Mixed

toStr Good = "good"
toStr Bad = "bad"
toStr Mixed = "mixed"

comb Mixed _ = Mixed
comb _ Mixed = Mixed
comb Good Bad = Mixed
comb Bad Good = Mixed
comb x y = x

classifyStrings = toStr . go 0 0
  where
    go v c [] = if v >=3 || c >= 5 then Bad else Good
    go v c (x:xs)
      | v >= 3 || c >= 5 = Bad
      | x == '?' =  comb (go (v+1) 0 xs) (go 0 (c+1) xs)
      | x `elem` "aeiou" = go (v+1) 0 xs
      | otherwise = go 0 (c+1) xs
