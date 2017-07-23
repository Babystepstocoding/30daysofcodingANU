def rotateImage(a):
    if a == []: return a
    for i in range(len(a)):
        for j in range(i):
            a[i][j],a[j][i] = a[j][i],a[i][j]
    for row in a:
        for j in range(len(row)//2):
            row[j],row[len(row)-j-1] = row[len(row)-j-1],row[j]
    return a
