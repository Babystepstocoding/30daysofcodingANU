import Data.Char
data EncodedChar = Simple Char
                 | Looped Int [EncodedChar]
decodeString = printEncoded . parseEncoded

printEncoded :: [EncodedChar] -> String
printEncoded [] = []
printEncoded (Simple x:xs) = x : printEncoded xs
printEncoded (Looped n str:xs) = concat (replicate n (printEncoded str)) ++ printEncoded xs

parseEncoded = fst . go
  where
    go [] = ([], [])
    go (']':xs) = ([], xs)
    go (x:xs)
      | isDigit x = let num = read (takeWhile isDigit (x:xs)) in
                    let (dat,rest) = go (drop 1 $ dropWhile (/= '[') xs) in
                    let (res,rest') = go rest in
                    (Looped num dat:res, rest')
      | otherwise = let (res,left) = go xs in (Simple x:res, left)
