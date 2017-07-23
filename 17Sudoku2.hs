import Data.List
sudoku2 grid = all valid rows && all valid cols && all valid boxes
  where
    rows = grid
    cols = transpose grid
    boxes = map concat $ concatMap transpose $ splitInto3 $ map splitInto3 grid
    splitInto3 (x:y:z:xs) = [x,y,z] : splitInto3 xs
    splitInto3 [] = []
    valid block = let b = filter (/= '.') block in b == (nub b)
