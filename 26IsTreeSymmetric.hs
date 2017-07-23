instance Eq a => Eq (Tree a) where
  Null == Null = True
  (Tree x l r) == (Tree x' l' r') = x == x' && l == l' && r == r'
  _ == _ = False

isTreeSymmetric t = t == flipT t

flipT Null = Null
flipT (Tree x l r) = Tree x (flipT r) (flipT l)
