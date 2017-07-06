(defun kthLargestElement (nums k) (elt (sort nums #'>) (1- k)))
