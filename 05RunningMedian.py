#!/bin/python3

import sys
from heapq import heappush, heappop

n = int(input().strip())
a = []
a_i = 0
for a_i in range(n):
   a_t = int(input().strip())
   a.append(a_t)

# Python only has min heaps, so we just negate things
# when we put them in, and again when we take them out
def maxheappush(h,x):
    heappush(h,x*-1)
def maxheappop(h):
    return (-1 * heappop(h))
def maxheappeek(h):
    return (-1 * h[0])

curr = float(a[0])
# a min heap for all elements bigger than curr
minHeap = []
# a max heap for all elements smaller than curr
maxHeap = []
print ("%.1f" % curr)
for a_i in a[1:]:
    a_i = float(a_i)
    # add element
    if a_i < curr:
        maxheappush(maxHeap,a_i)
    else:
        heappush(minHeap,a_i)
    # rebalance
    while abs(len(maxHeap) - len(minHeap)) > 1:
        if len(maxHeap) > len(minHeap):
            heappush(minHeap,curr)
            curr = maxheappop(maxHeap)
        else:
            maxheappush(maxHeap,curr)
            curr = heappop(minHeap)
    # print
    if len(minHeap) == len(maxHeap):
        print ("%.1f" % curr)
    else:
        print ("%.1f" % (0.5 * (curr + (minHeap[0] if 
                                        len(minHeap) > len(maxHeap) 
                                        else maxheappeek(maxHeap)))))
