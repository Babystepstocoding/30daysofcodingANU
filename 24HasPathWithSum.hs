hasPathWithGivenSum Null 0 = True
hasPathWithGivenSum t n = hasPathWithGivenSum' t n
hasPathWithGivenSum' Null _ = False
hasPathWithGivenSum' (Tree x Null Null) n = x == n
hasPathWithGivenSum' (Tree x l r) n = hasPathWithGivenSum' l n' || hasPathWithGivenSum' r n'
  where n' = n - x
