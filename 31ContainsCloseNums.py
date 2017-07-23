def containsCloseNums(nums, k):
    vals = {}
    for ix,num in enumerate(nums):
        if num in vals:
            vals[num].append(ix)
        else: vals[num] = [ix]
    for key in vals:
        if len(vals[key]) <= 1: continue
        curr = sorted(vals[key])
        for i in range(len(curr)-1):
            if (curr[i+1] - curr[i]) <= k: return True
    return False

