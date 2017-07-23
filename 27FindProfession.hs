import Data.Bits

findProfession lev pos
  | even (popCount pos') = "Engineer"
  | otherwise = "Doctor"
  where pos' = (pos-1) `mod` (2^(lev-1))
  -- This is broken but #yolo
