def toNum(poss):
    poss=list(map(int,poss))
    return poss[0] + 2*poss[1] + 4 * poss[2] + 8 * poss[3]


def solve(arr,n,poss):
    val = toNum(poss)
    if arr[n][val] != -1: return
    arr[n][val] = 0
    if (n==len(arr) - 1):
        arr[n][val]= 1 if val in [0,15,3,12,9] else 0 
        return
    if val == 0:
        moves = [ [False,False,False,False]
                , [True,False,False,True]
                , [True,True,True,True]
                , [True,True,False,False]
                , [False,False,True,True]
                ]
    elif val == 1:
        moves = [ [False,False,False,True]
                , [False,True,False,False]
                , [False, True, True, True]
                ]
    elif val == 2:
        moves = [ [True,False,False,False]
                , [True,False,True,True]
                ]
    elif val == 3:
        moves = [ [False, False, False, False]
                , [False, False, True, True]]
    elif val == 4:
        moves = [ [False, False, False, True]
                , [True, True, False, True]
                ]
    elif val == 5:
        moves = [ [False, True, False, True ]]
    elif val == 6:
        moves = [ [True, False, False, True]]
    elif val == 7:
        moves = [ [False, False, False, True]]
    elif val == 8:
        moves = [ [False, False, True, False]
                , [True, True, True, False]
                , [True, False, False, False]
                ]
    elif val == 9:
        moves = [ [False,False,False,False]
                , [False,True,True,False]
                ]
    elif val == 10:
        moves = [ [True,False,True,False]]
    elif val == 11:
        moves = [ [False,False,True,False]]
    elif val == 12:
        moves = [ [False,False,False,False]
                , [True,True,False,False]
                ]
    elif val == 13:
        moves = [ [False, True,False,False]]
    elif val == 14:
        moves = [ [True,False,False,False]]
    elif val == 15:
        moves = [[False,False,False,False]]
    for move in moves:
        solve(arr,(n+1),move)
        arr[n][val] += arr[n+1][toNum(move)]
def fillingBlocks(n):
    if (n==0): return 1
    if (n==1):return 1
    arr = [[-1]*16 for _ in range(n)]
    solve(arr,0,[False,False,False,False])
    return arr[0][0]
    

