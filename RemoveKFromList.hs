-- Definition for singly-linked list:
-- data ListNode a = ListNode { val :: a
--                            , next :: ListNode a
--                            } | Nil deriving Show
--
removeKFromList Nil k = Nil
removeKFromList (ListNode v n) k
  | v == k =  removeKFromList n k
  | otherwise = ListNode v (removeKFromList n k)
