def firstDuplicate(a):
    for i in range(len(a)):
        val = abs(a[i])
        if a[val - 1] < 0: return val
        a[val - 1] = -1 * abs(a[val - 1])
    return -1

