def possibleSums(coins, quantity):
    # What's the highest number of possible combinations?
    worst_case = sum(c * q for c,q in zip(coins,quantity))

    # 0 is always possible
    used = [1] + ([0] * (worst_case))
    
    for c,q in zip(coins,quantity):
        for x in range(c):
            count = -1        
            for i in range(x,worst_case+1,c):
                if used[i] == 1: count = 0 # restart
                elif count >= 0: count += 1
                # do we still have coins left?
                used[i] = int(0 <= count <= q)
    # how many did we get? (minus one, because we don't count 0)
    return (sum(used) - 1)
