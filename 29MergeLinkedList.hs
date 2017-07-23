mergeTwoLinkedLists Nil ys = ys
mergeTwoLinkedLists xs Nil = xs
mergeTwoLinkedLists (ListNode x xs) (ListNode y ys)
  | x <= y = ListNode x (mergeTwoLinkedLists xs (ListNode y ys))
  | otherwise = ListNode y (mergeTwoLinkedLists (ListNode x xs) ys)
