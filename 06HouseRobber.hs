maximum' [] = 0
maximum' xs = maximum xs

houseRobber nums = maximum' $ loeb $ 
 [\l -> max (l!!(ix+1)) (v+maximum' (drop (ix+2) l)) | (ix,v) <- zip [0..] nums] ++ [const 0]

loeb :: (Functor f) => f (f a -> a) -> f a
loeb xs = go
  where go = fmap ($ go) xs
