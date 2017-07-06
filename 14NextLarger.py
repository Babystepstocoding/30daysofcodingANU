def nextLarger(a):
    stack = []
    for ix,val in enumerate(a):
        if len(stack) == 0:
            stack.append((ix,val))
            continue
        if stack[-1][1] >= val:
            stack.append((ix,val))
        else:
            while (len(stack) > 0 and stack[-1][1] < val):
                topix, topval = stack.pop()
                a[topix] = val
            stack.append((ix,val))
    for ix,_ in stack:
        a[ix] = -1
    return a
