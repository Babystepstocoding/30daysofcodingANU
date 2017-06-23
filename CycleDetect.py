"""
Detect a cycle in a linked list. Note that the head pointer may be 'None' if the list is empty.

A Node is defined as: 
 
    class Node(object):
        def __init__(self, data = None, next_node = None):
            self.data = data
            self.next = next_node
"""


def has_cycle(head):
    tortoise = head
    hare = head
    while True:
        if tortoise is None: return False
        if hare is None or hare.next is None: return False
        tortoise = tortoise.next
        hare = hare.next.next
        if tortoise is hare: return True
    
