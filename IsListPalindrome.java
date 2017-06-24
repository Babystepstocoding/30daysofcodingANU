boolean isListPalindrome(ListNode<Integer> l) {
  if (l == null || l.next == null) return true;
  // Our counter
  ListNode<Integer> fast = l;
  // Second half of the list
  ListNode<Integer> curr = l;
  // For swapping
  ListNode<Integer> tmp;
  // We're going to reverse the first half as we go
  l = null;
  
  // Whilst our counter can step two at a time
  while (fast != null && fast.next != null) {
    // Step it
    fast = fast.next.next;
    // Move curr one
    tmp = curr;
    curr = curr.next;
    // Stick the old element at the head of l
    tmp.next = l;
    l = tmp; 
  }
  // If there were an odd number, move one more
  if (fast != null) {
    curr=curr.next;
  }
  // Compare them
  while (l != null) {
    // I hate Java comparisons
    if (!l.value.equals(curr.value)) return false;
    l = l.next;
    curr = curr.next;
  }
  return true;
}
