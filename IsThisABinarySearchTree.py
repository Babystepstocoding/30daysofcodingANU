def checkBST(root, minCanBe = None, maxCanBe=None):
    if root is None: return True
    meValid = (minCanBe is None or root.data > minCanBe) and (maxCanBe is None or root.data < maxCanBe)
    return meValid and checkBST (root.left, minCanBe, root.data) and checkBST (root.right, root.data, maxCanBe)
    
