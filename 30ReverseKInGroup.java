ListNode<Integer> reverseNodesInKGroups(ListNode<Integer> l, int k) {
    if (l==null) return l;
    ListNode<Integer> curr = l;
    ListNode<Integer> backwards = null;
    ListNode<Integer> res = null;
    ListNode<Integer> newTail = null;
    ListNode<Integer> oldTail = null;
    ListNode<Integer> tmp;
    // Walk down curr, if this fails, we're done
    
    while (curr != null){
        backwards = null;
        for (int i=0; i<k; i++) {
            if (curr == null) {
                // rewind
                for (int j=0; j<i; j++){
                    tmp = backwards;
                    backwards = backwards.next;
                    tmp.next = curr;
                    curr = tmp;
                }
                backwards = curr;
                curr = null;
                break;
            }
            if (i==0) {newTail = oldTail; oldTail = curr;}
            tmp = curr;
            curr = curr.next;
            tmp.next = backwards;
            backwards = tmp;
        }
        if (newTail == null) {
            res = backwards;
        } else {
            newTail.next = backwards;
        }
    }
    return res;
}
