addTwoHugeNumbers a b = fl $ reverse $ go (zip' (reverse (tl a)) (reverse (tl b)))
  where
    go (x:xs) | x <= 9999 = x:go xs
              | otherwise = case xs of
                [] -> (x-10000):[1]
                y:ys -> (x-10000):go (y+1:ys)
    go [] = []

zip' (x:xs) (y:ys) = (x+y):zip' xs ys
zip' [] ys = ys
zip' xs [] = xs

tl (ListNode x xs) = (x:tl xs)
tl Nil = []

fl (x:xs) = ListNode x (fl xs)
fl [] = Nil
