import heapq
t = int(input())
for i in range(t):
    n,m = [int(value) for value in input().split()]
    graph = {x : [] for x in range(n)}
    for i in range(m):
        x,y = [int(x) for x in input().split()]
        graph[x-1].append(y-1)
        graph[y-1].append(x-1)
    s = int(input()) - 1
    dists = [-1 for x in range(n)]
    frontier = ([(6,t)for t in graph[s]])
    dists[s] = 0
    heapq.heapify(frontier)
    while frontier != []:
        w,t = heapq.heappop(frontier)
        if w < dists[t] or dists[t] == -1:
            dists[t] = w
            for nt in graph[t]:
                heapq.heappush(frontier,(w+6,nt))
    res = ""
    for (t,w) in enumerate(dists):
        if t == s: continue
        res += ' '
        res +=str(w)
    print(res.strip())
    

